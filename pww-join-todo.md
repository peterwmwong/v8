# Perf: add benchmark for number dictionary
# Perf: add empty array
# Perf: add benchmark for toLocaleString
# Perf Regression: 0 elements and 1 element
# Update tests to consistently use assertSame

Measure specialization vs just calling ToString

# Perf: Avoid/Reduce overhead of cycle detection

Cycle detection consists of the following preamble to calling `A.p.join`

1. Look for receiver in the stack
  - Can be avoided if receiver.length == 0
2. Add receiver to the stack (if not found on the stack)
  - Can be avoided if receiver.elementsKind is PACKED_SMI, HOLEY_SMI, PACKED_DOUBLES, HOLEY_DOUBLES
  - Put another way, only for PACKED_ELEMENTS and HOLEY_ELEMENTS

# Move as many external macro's from base.tq to array.tq

# Perf regression: Add one element fast path

```js
// Fast case for one-element arrays.
if (length === 1) {
  var e = array[0];
  if (IS_NULL_OR_UNDEFINED(e)) return '';
  return TO_STRING(e);
}
```

# Determine validity of bug 7707

This bug may have uncovered a spec breakage in regards to Array-like objects.
Further analyze the bug, add a test case if valid.

https://bugs.chromium.org/p/v8/issues/detail?id=7707

# Update Torque to distinquish macros with different labels



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

# ==============================
# CL Pre-emptive Review comments
# ==============================

# Delay Sparse Optimization

This CL does NOT include the sparse array optimization.
My reasoning for not including the optimization as it exists right now:

1) Breaks compliance with the spec (>>>INSERT BUG<<<)
2) Reducing Complexity

I have already implemented this optimization and can easily recover these
commits from a local branch if someone feels strongly about this or curious
about my port of the optimization.

## Try to make sparse dictionary optimization work with just indices

1) Make ArrayJoinImpl<DictionaryElements> specialization
2) Calls CallCCollectNumberDictionaryElementIndices
3) Tests for Complex Elements along the way
  - May need to specialize HasComplexElements to

# Array Size and ElementsKind

```js
new Array(size);
```

| Elements Kind | Start                               | End                            |
|---------------|-------------------------------------|--------------------------------|
| HoleyElements | `0`                                 | `JSArray::kMaxFastArrayLength` |
| Slow???       | `JSArray::kMaxFastArrayLength + 1`  | `2^25`                         |
| Dictionary    | `2^25 + 1`                          | `2^32 - 1`                     |
