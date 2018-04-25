# [small] Using `otherwise` with `[]` operator

Not sure if this a good idea (for my case or in the general), but here's
what lead me to this...

When accessing a fixed double array's element, I tried to use the `[]` operator.
I couldn't figure out a good way to implement the `[]` operator while handling
the `hole`.

The following was how I intended to use `[]` with `otherwise`...

```ts
// This compiles just fine vvvv
extern operator '[]' macro LoadFixedDoubleArrayElement(FixedDoubleArray, Smi): float64 labels Hole;

macro NaiveJoinForDoubles(context: Context, array: FixedDoubleArray): Object {
  let result: String = '';
  for (let i: Smi = 0; i < array.length; i++) {
    try {

      // vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
      let element: float64 = array[i] otherwise Hole;
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

      let string: String = ToString_Inline(context, convert<Number>(element));
      result = StringAdd(context, result, string);
    }
    label Hole { /* Skip adding anything to the resulting String */ }
  }
  return result;
}
```

Currently this produces a parser error:

```
mismatched input 'otherwise' expecting ';'
```

Since this doesn't work, it's a bit awkward to handle detecting a double
hole as I'm not sure how (if possible) to implement a `==` operator for this...

```ts
let element: float64 = array[i];
if (element == double_hole) goto Hole;
```

From my limited understanding of loading a double, it looks like it
requires multiple loads (one load w/int representation for hole detection,
another w/float representation)...

1. If Is64()
    1. Load Uint64
    1. If Word64Equal Int64Constant(kHoleNanInt64)
        1. Do something with the hole
2. Otherwise
    1. Load Uint32
    1. Word32Equal
        1. Do something with the hole
3. Load Float64

In the end, I used `LoadFixedDoubleArrayElement()`...

```ts
extern macro LoadFixedDoubleArrayElement(FixedArray, Smi): float64 labels Hole;

let element: float64 = LoadFixedDoubleArrayElement(array, i) otherwise Hole;
```

# [small] `return void` macro with early return compile error

TODO(pwong): MAYBE FIXED ALREADY!

```ts
macro DoStuff(num: intptr): void {
  if (num) return;
}
```

Originating case:

```ts
macro JoinStackPush(array: JSArray): void
labels CycleDetected {
  try {
    let stack: FixedArray = LoadStringJoinStack();
    let length: Smi = stack.length;
    for (let i: Smi = 0; i < length; i++) {
      // Detect a cycle
      let previouslyVisited:Object = stack[i];
      if (array == previouslyVisited) goto CycleDetected;

      // Add `array` at the first open slot
      if (array == hole) {
        stack[i] = array;
        goto Done;
      }
    }

    // Reached the end of the fixed array, need to grow the fixed array to
    // track `array`
    let capacity:Smi = (length + (length >>> 1)) + 16;
    stack = ExtractFixedArray(stack, 0, length, capacity, kFixedArrays);
    stack[length] = array;
    SetStringJoinStack(stack);
  }
  label Done {}
}
```
