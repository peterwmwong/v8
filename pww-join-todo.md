# Perf regression: Sparse fucking Array optimization

This is kinda complicated, does this still pay off?
  - mjsunit/array-join tests a max array length with 2
  - Check SparseSmiJoin, SparseStringJoin
    - maybe tq version now beats the JS sparse variant
  - Add SparseDoubleJoin?

Current JS algo:

1. If "sparse"
    - Requirements:
        ```
        ( is an array
          && length >= 1000
          && !%HasComplexElements )
        && (
          !IsSmi(length)
          || /*
            Given every 97th element (what da actual fuck), count number of holes
            If the ratio of holes > 75%
          */
        )
        ```
2. `%NormalizeElements` (to NumberDictionary)
3. `%GetArrayKeys`
  - Number or Interval... omglskdjf

# Test: weird ass, mothafucking receivers

Quickly determine any behavior change:
- Strings
  - Slightly worried people might actually use this in perf sensitive areas
    - `Array.prototype.join.call("abc", '\n'); // I dunno`
  - Don't optimize, but measure to atleast warn of possible perf regression in CL messaging
- Functions (arguments determine the `length`)
  - `Array.prototype.join.call(function hello(a,b,c){}, '-') // '--'`

# Perf Regression: 0 elements and 1 element

# Investigate memory impact of not Flattening

Currently the JS version produces a flatten string.

```
-> DoJoin()
-> %StringBuilderConcat()
  Handle<SeqOneByteString> answer;
  ASSIGN_RETURN_FAILURE_ON_EXCEPTION(
    isolate, answer, isolate->factory()->NewRawOneByteString(length));
```

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

# Double type checks

Using `cast<Blah>(obj)` to `switch` against different types leads to double
checking. For example...

```
try { let smi: Smi = cast<Smi>(obj) otherwise Next; }
label Next {};
// This second cast<String>, double checks `obj` is a Smi...
// 1) Check Tagged Heap Object (Check if NOT a Smi)
// 2) Check String
try { let string: String = cast<String>(obj) otherwise Next; }
label Next {};
```

This can lead to a 5% boost on `string join` benchmark

# TFS StringAdd_CheckNone_NotTenured | StringAdd

## Snapshot size impact

|                           | TFS       | Macro     |          |
|---------------------------|-----------|-----------|----------|
| snapshot_blob.bin         | 1,347,704 | 1,376,680 | -28.30KB |
| snapshot_blob_trusted.bin | 1,312,552 | 1,341,520 | -28.29KB |

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
