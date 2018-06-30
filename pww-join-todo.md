# Determine why there's such a huge discrepancy in size (and time) between with current array.tq and "6/10 249d0ea4df + Smi IndexType - 476"

# Perf: add benchmark for number dictionary
# Perf: add benchmark for toLocaleString
# Perf Regression: 0 elements and 1 element


# Perf: Is avoiding ToString call (IsSmi, IsString) worth it?

Measure specialization vs just calling ToString

# Perf: Avoid/Reduce overhead of cycle detection

Cycle detection consists of the following preamble to calling `A.p.join`

1. Look for receiver in the stack
  - Can be avoided if receiver.length == 0
2. Add receiver to the stack (if not found on the stack)
  - Can be avoided if receiver.elementsKind is PACKED_SMI, HOLEY_SMI, PACKED_DOUBLES, HOLEY_DOUBLES
  - Put another way, only for PACKED_ELEMENTS and HOLEY_ELEMENTS

# Performance impact of adapted arguments vs not

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


# ====
# DONE
# ====

# Verify test coverage for packed and holey doubles

Added to the top of `mjsunit/array-join.js`

# Handle side effects from `ToString(element)`

1. Write tests has elements kind changing side effect
  - Starting in the following elements kind
    - X(Impossible, Smi's can't implement custom toString): Smi
    - X(Impossible, Double's can't implement custom toString): Double
    - X: Elements -> Holey Elements0
2. Fix it
  - Add ToString label `PossibleSideEffects`/`WithSideEffects`/`WithJSCall`


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

# Performance

## Memory Usage (need to be rechecked with correct sha in google2)

### Test

```json
{
  "label": "benchmem string",
  "type": "shell",
  "command": "clear; export PATH=/p/depot_tools:\"$PATH\"; ninja -C out.gn/x64.release d8 && /usr/bin/time -l out.gn/x64.release/d8 bench-memory.js -- string join",
  "group": {
    "kind": "build",
    "isDefault": true
  },
  "presentation": {
    "echo": true,
    "reveal": "always",
    "focus": false,
    "panel": "dedicated"
  },
  "problemMatcher": []
},
```

### Before

 449,826,816  maximum resident set size
     616,599  page reclaims

 449,839,104  maximum resident set size
     616,640  page reclaims

 451,780,608  maximum resident set size
     616,599  page reclaims

### After

  72,634,368  maximum resident set size
      18,083  page reclaims

  72,036,352  maximum resident set size
      17,983  page reclaims

  72,155,136  maximum resident set size
      17,874  page reclaims

## EnsureElementAccess

TODO(pwong): START HERE Revisiting performance of EnsureElementAccess with label

### label Continuation(Number, String)

### POST label Cannot

```ts
// ArrayJoinImpl

...
r = StringAdd_CheckNone_NotTenured(context, r, next);

// If JS code may have been called, there's a possibility the array
// was mutated in a way the current element accessor no longer applies.
try {
  EnsureElementAccess<ElementsAccessor>(initialMap, len, array)
  otherwise Cannot;
}
label Cannot {
  goto Continuation(convert<Number>(k + 1), r);
}
```

```
min     median  max     stddev
475.044 478.101 483.11  2.70123
477.003 479.447 485.105 2.33614
474.601 478.103 481.796 2.07973
470.754 477.361 483.759 4.05766
475.122 477.844 480.324 1.81616
476.256 479.2   483.445 2.37925
474.282 476.957 487.898 4.50329
475.839 478.543 483.579 2.40886
475.906 479.127 483.209 2.36613
477.678 480.176 490.262 3.68144
```

### label Cannot

```ts
  // Verifies the current element accessor can still be safely used
  // (see Load<ElementsAccessor>). Otherwise go to Continuation.
  macro EnsureElementAccess<ElementsAccessor: type>(
      originalMap: Object, originalLen: Number, receiver: Object): void
  labels Cannot;

  EnsureElementAccess<GenericElementsAccessor>(
      originalMap: Object, originalLen: Number, receiver: Object): void
  labels Cannot {}

  macro EnsureElementAccess<ElementsAccessor: type>(
      originalMap: Object, originalLen: intptr, receiver: Object): void
  labels Cannot {
    let array: JSArray = unsafe_cast<JSArray>(receiver);
    if (originalMap != array.map ||
        originalLen != convert<intptr>(array.length_fast)) {
      goto Cannot;
    }
  }
```

```
min     median  max     stddev
479.453 484.665 494.444 4.01732
479.414 482.836 487.042 2.46312
478.566 481.564 493.924 4.40706
479.844 482.683 487.539 2.45882
478.298 482.422 485.883 2.48203
480.275 485.17  487.546 2.38019
479.936 483.795 489.691 2.7893
478.249 479.701 487.495 3.08867
478.602 482.324 490.281 4.07901
478.852 481.465 484.203 1.56418
```

### return bool

```ts
  // Verifies the current element accessor can still be safely used
  // (see Load<ElementsAccessor>). Otherwise go to Continuation.
  macro EnsureElementAccess<ElementsAccessor: type>(
      originalMap: Object, originalLen: Number, receiver: Object,
      k: Number, r: String): bool;

  EnsureElementAccess<GenericElementsAccessor>(
      originalMap: Object, originalLen: Number, receiver: Object,
      k: Number, r: String): bool {
    return false;
  }

  macro EnsureElementAccess<ElementsAccessor: type>(
      originalMap: Object, originalLen: intptr, receiver: Object,
      k: intptr, r: String): bool {
    let array: JSArray = unsafe_cast<JSArray>(receiver);
    if (originalMap != array.map) return false;
    return originalLen != convert<intptr>(array.length_fast);
  }
```

```
min     median  max     stddev
493.53  498.829 513.538 5.7652
493.869 497.092 503.991 3.01066
489.686 495.305 502.01  3.19452
491.596 494.537 498.42  1.93186
490.766 496.507 498.138 2.11902
492.597 496.726 500.779 2.64963
492.454 498.34  506.037 3.60296
```


# TFS StringAdd_CheckNone_NotTenured | StringAdd

## Snapshot size impact (OUTDATED)

|                           | TFS       | Macro     |          |
|---------------------------|-----------|-----------|----------|
| snapshot_blob.bin         | 1,347,704 | 1,376,680 | -28.30KB |
| snapshot_blob_trusted.bin | 1,312,552 | 1,341,520 | -28.29KB |


#### array-join-final intptr index (updated)

Branchpoint: 249d0ea4df569908d6d4d9d3a49dd24956eda842

|                           |         |
|---------------------------|---------|
| snapshot_blob.bin         | 606,436 |
| snapshot_blob_trusted.bin | 577,956 |
| natives_blob.bin          |  65,334 |


#### array-join-final Single Generic Param, Smi Iteration

Branch: array-join-final-single-generic-param-smi-iteration
Branchpoint: 249d0ea4df569908d6d4d9d3a49dd24956eda842

|                           |         |
|---------------------------|---------|
| snapshot_blob.bin         | 606,436 |
| snapshot_blob_trusted.bin | 577,956 |
| natives_blob.bin          |  65,334 |

#### array-join-final intptr index

|                           |           |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,347,696 |
| snapshot_blob_trusted.bin | 1,317,824 |
| natives_blob.bin          |   102,768 |


#### array-join-final Slow path builtin

|                           |           |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,348,408 |
| snapshot_blob_trusted.bin | 1,318,544 |
| natives_blob.bin          |   102,768 |

#### array-join-final unified-popstack

|                           |           |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,347,968 |
| snapshot_blob_trusted.bin | 1,318,104 |
| natives_blob.bin          |   102,768 |

#### array-join-final macro AJI + SlowArrayJoin (No LocaleString)

|                           |           |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,345,072 |
| snapshot_blob_trusted.bin | 1,315,200 |
| natives_blob.bin          |   102,768 |

#### array-join-final

|                           | TFS       |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,348,100 |
| snapshot_blob_trusted.bin | 1,318,236 |
| natives_blob.bin          |   102,768 |

#### array-join5-remove-slow

|                           | TFS       |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,352,304 |
| snapshot_blob_trusted.bin | 1,317,152 |

### TFS ArrayJoinImpl

|                           | TFS       |
|---------------------------|-----------|
| snapshot_blob.bin         | 1,350,368 |
| snapshot_blob_trusted.bin | 1,315,216 |

### Generics

| snapshot_blob.bin         | 1,348,476 |
| snapshot_blob_trusted.bin | 1,313,316 |
| natives_blob.bin          |   102,920 |

### Original (No Array.p.join)

| snapshot_blob.bin         | 1,343,264  |
| snapshot_blob_trusted.bin | 1,308,112  |
| natives_blob.bin          |   103,282  |

## Performance impact

|                           | TFS AJI   | TFS       | Macro     |         |
|---------------------------|-----------|-----------|-----------|---------|
| string join               | 500       | 480       | 440       | -9%     |


# Calling NumberToString on PACKED/HOLEY SMI_ELEMENTS is ~15% gain

Instead of always calling into ToString_Inline.

# Checking IsUndefinedOrNull at the beginning eats 3% on SMI benchmark

Instead of always calling into ToString_Inline.


# Array Size and ElementsKind

```js
new Array(size);
```

| Elements Kind | Start                               | End                            |
|---------------|-------------------------------------|--------------------------------|
| HoleyElements | `0`                                 | `JSArray::kMaxFastArrayLength` |
| Slow???       | `JSArray::kMaxFastArrayLength + 1`  | `2^25`                         |
| Dictionary    | `2^25 + 1`                          | `2^32 - 1`                     |
