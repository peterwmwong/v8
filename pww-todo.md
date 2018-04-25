# CURRENT: Remove IsDoubleElementsKind_ and similar ilk

Given the impending `constexpr` awesomeness: https://chromium-review.googlesource.com/c/v8/v8/+/1042085

# CURRENT: Use new [] operator for FixedDoubleArray

# CURRENT: Cycle detection

## Unexpected stack grow

```js
assertSame('1.5,2,3', [1.5,2,3].join());
assertSame('1.5,2,3', [1.5,2,3].join());
assertSame('1.5,2,3', [1.5,2,3].join()); // <--- WHY DOES THIS GROW!?
```

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

# Handle ToString Side-effects

- GetJoinSeperator
- Join loop ToString
- Can a heap number NumberToString have a side-effect? (swee jebus)

This may require us to handle a continuation-like strategy
  - If in the middle of the join loop we detect our array is no longer is "fast"

# Figure out effiecient GetJoinSeperator/Array.p.length/Fast-Array-check call order

Currently the fast and slow paths **both** generate GetJoinSeperator.
Is there a way to do this once?
We need to be resilient to a side-effectful GetJoinSeperator (from ToString)

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
