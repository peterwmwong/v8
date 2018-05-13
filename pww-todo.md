# Handle side effects from `ToString(element)`

1. Write tests has elements kind changing side effect
  - Starting in the following elements kind
    - Smi
    - Double
    - Elements
2. Fix it
  - Add ToString label `PossibleSideEffects`/`WithSideEffects`/`WithJSCall`

# Try to Torqueify Load and Storing kStringJoinStackRootIndex

```ts
type RootListIndex;
const kStringJoinStackRootIndex: RootListIndex = 'Heap::kStringJoinStackRootIndex';
const kStringJoinStack: FixedArray =
    'UncheckedCast<FixedArray>(LoadRoot(Heap::kStringJoinStackRootIndex))';
extern macro StoreRoot(RootListIndex, HeapObject);

StoreRoot(kStringJoinStackRootIndex, newStack);
```

# Consider nested try to avoid stackIndex = -1

Can we avoid inializaing `stackIndex` to `-1` to indicate we have not pushed to
the stack?

# Shrink StringJoinStack when PopStack of stackIndex == 0

We don't want a runaway, deeply nested join eat up unecessary amount of
necessarily.

# Perf: Is avoiding ToString call (IsSmi, IsString) worth it?

Measure specialization vs just calling ToString

# Perf: Avoid/Reduce overhead of cycle detection

Cycle detection consists of the following preamble to calling `A.p.join`

1. Look for receiver in the stack
  - Can be avoided if receiver.length == 0
2. Add receiver to the stack (if not found on the stack)
  - Can be avoided if receiver.elementsKind is PACKED_SMI, HOLEY_SMI, PACKED_DOUBLES, HOLEY_DOUBLES
  - Put another way, only for PACKED_ELEMENTS and HOLEY_ELEMENTS


# Perf regression: Add one element fast path

```js
// Fast case for one-element arrays.
if (length === 1) {
  var e = array[0];
  if (IS_NULL_OR_UNDEFINED(e)) return '';
  return TO_STRING(e);
}
```

# Use toLocaleString if called from toLocaleString


# Consider Sparse Join special case optimization

This is kinda complicated, does this still pay off?
  - determine benchmark/use-case this was applicable

It appears the JS implementation special cased sparse arrays.

1) Determine if it's a "sparse array"
  ( is an array &&
    length >= 1000 &&
    %HasComplexElements )
  Non-smi length
  No more than 75% holes

2) If so, get keys of sparse arrays
3) Iterate over keys (effectively jumping over holes) instead of each index


# Determine validity of bug 7707

This bug may have uncovered a spec breakage in regards to Array-like objects.
Further analyze the bug, add a test case if valid.

https://bugs.chromium.org/p/v8/issues/detail?id=7707





# PR2: Fast C call to NumberToString

To further improve the performance of CSA::NumberToString, we could remove
runtime call (Runtime::kNumberToStringSkipCache).

1) Create a new static function NumberToStringSkipCache
2) Add External Reference

# PR2: Optimize double: avoid allocating heap number

Currently an `AllocateHeapNumberWithValue` is hidden under this convert:

```ts
convert<Number>(LoadFixedDoubleArrayElement(elements, k) otherwise Hole);
```

... Is there a way we can...

1) Special case handle the Infinity/+Infinity/-Infinity/-0/NaN cases
  - How does `AllocateHeapNumberWithValue` detect these cases anyways ^^^?
2) Update the Fast C call (see below) to just handle float 64
