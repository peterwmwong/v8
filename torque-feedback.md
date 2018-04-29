# Torque feedback

The following outlines my observations while porting `Array.p.join`.

First off, my overall first experience with Torque was **very** positive.
- Spent less time waiting on a bad compile (Torque would catch things
  earlier/faster)
- Made fewer typing mistakes
- Felt rewarded with having the proper type
- Less Code, Less Thinking, Less Mistakes
  - Did I provide TFS with the right options in `builtins-definition.h`?
  - Less "ceremony" with loading `arguments`, `context`, etc.
  - Is it `arguments.PopAndReturn()` or just `Return()`?
  - How should I name this `Label` for this branch... bah, just call it
    `next`? :)

Below are areas I thought maybe could be improved. I'm sure some or all of
these are just me "holding it wrong". Each observation is tagged with my
annoyance level (`[small]`, `[medium]`, `[big]`) :)

## `[big]` Constant time compile customization

TODO(pwong): Show the current compiled CSA code and compare with
              ideal/expected CSA code

```ts
type const_bool generates 'bool';

macro MaybeDoIt(doit: const_bool): never {
  if (doit) {
    Print("doit"); // Don't generate code if doit is `false`
  } else {
    Print("don't doit");  // Don't generate code if doit is `true`
  }
}

builtin Something(): never {
  doit(true);   // Blast! I can't do this, as `true` has alreaday been taken
                // and mapped to the Oddball `TrueConstant`
  doit(false);  // ... Same here
}
```

The context is for performance by specializing `Array.p.join` based on the
ElementsKind of the array:

- Load element (`LoadFixedDoubleArrayElement` or just `LoadFixedArrayElement`)
- Do a hole check or not?
- `ToString_Inline` or `NumberToString`
- Re-check whether an array is still fast or not after calling `ToString_Inline`

## `[small]` `operator` search strategy doesn't include the return type

It seems the current strategy (just matching against arguments).  What I wanted
to do was to add the `.length` operator for a fast JS array that resulted in
`IntPtrT`.

```ts
/* Assumption: LoadAndUntagFastJSArrayLength exists...
TNode<IntPtrT> LoadAndUntagFastJSArrayLength(TNode<JSArray> fast_array) {
  return SmiUntag(LoadFastJSArrayLength(fast_array));
}
*/
// Seems `LoadJSArrayLength` is always chosen, even if I'm using it like:
//   let len: intptr = array.length;
extern operator '.length' macro LoadJSArrayLength(JSArray): Number;
extern operator '.length' macro LoadAndUntagFastJSArrayLength(JSArray): intptr;
```

## `[small]` `CSA_ASSERT`

It appears Simon Zünd hit this aswell and added a temporary
`AssertUnreachable()`.

## `[small]` `Label::kDeferred`

TBH, I'm not exactly sure what `Label::kDeferred` did and used it to mark
"less likely" labels in the hopes of better performance.

If it does actually make a difference in performance, I would like the ability
to hint a branch is more likely or unlikely.

## `[small, compile-error]` Empty string '' or "" is a parser error

I ended up adding the `EmptyStringConstant()`

## `[small, compile-error]` Macro with unused label

The error occurs pretty far in the build in mksnapshot.
It would have been helpful to error out sooner with a `Unused label "Bailout" in
macro "DoStuffFast"` (see below example).

TODO(pwong): Re-test with optdebug

```ts
macro DoStuffFast(context: Context): Object
labels Bailout {
  return 777;
}
javascript builtin DoStuff(context: Context, receiver: Object, ...arguments): Object {
  try {
    return DoStuffFast(context, receiver, arguments) otherwise Bailout;
  }
  label Bailout {
    return "";
  }
}
```

```
# Current Build output
FAILED: gen/embedded_trusted.cc snapshot_blob_trusted.bin
python ../../tools/run.py ./mksnapshot --turbo_instruction_scheduling --no-untrusted-code-mitigations --embedded_src gen/embedded_trusted.cc --embedded_variant Trusted --random-seed 314159265 --startup_blob snapshot_blob_trusted.bin
[12/20] ACTION //:run_mksnapshot_default(//build/toolchain/mac:clang_x64)
FAILED: gen/embedded.cc snapshot_blob.bin
python ../../tools/run.py ./mksnapshot --turbo_instruction_scheduling --embedded_src gen/embedded.cc --embedded_variant Default --random-seed 314159265 --startup_blob snapshot_blob.bin
```

## `[small]` String constants

I copied the "untyped type" approach from `TypedArray.p.sort` => `type MethodName;`
