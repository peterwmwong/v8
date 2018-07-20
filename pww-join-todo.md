# Perf: Preallocate flatten string
# Perf: add empty array special case?
# Perf: add benchmark for number dictionary
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

# Narrow Sparse Optimization

This CL does includes a narrow sparse array optimization. Along the lines
discussed during the July 18, 2018 meeting, the implemented sparse optimization:

1) Is spec compliance (fixing side-effect related compliance issues)
2) Favors simplicity over speed (fast enough to not completely tank sparse case)

When determining whether or not to use sparse optimization, this CL
removes/changes the following requirements:
  - Sampled based approach to determining atleast 75% are holes. Instead just
    uses NumberDictionary's Number Of Elements / Array Length.
  - Does not explicitly check Array Length is NOT a SMI or greater than 1000.
    Instead implicitly depend on the fact that if `ElementsKind` is
    `DictionaryElements` it must be a length (or had) greater than 2 ^ 25.

Requirements that were preserved in this CL:
  - Receiver must be a JSArray
  - Array does NOT have complex elements (Runtime_HasComplexElements)

To bring us back to spec compliance, this CL's sparse optimization is narrower
than current implementation in that the first array element that **may** end up
calling a custom `toString()` (JS code) will result in a slow path continuation.
(see `CannotUseSameAccessor<DictionaryElements>` and
`array-join-element-tostring-sideeffects.js`'s `NumberDictionaryChanged` and
`NumberDictionaryLengthChange` tests).

## Performance

TODO(pwong) - compare sparse speed

# ==============================
# CL QUESTIONS
# ==============================

Can we not allocate heap in a fast C Call from CSA/Torque?
For the sparse optimization I collect indices using either
`CallCCollectNumberDictionaryElementIndices` (Fast C Call) or
`GetSimpleArrayKeys` (Runtime).  They are identical in implementation, but
`CallCCollectNumberDictionaryElementIndices` fails verify heap checks and blows
up spectacular after a certain number of elements
(5462). Here's an optdebug output when using the fast C call:

```
#
# Fatal error in ../../src/heap/heap.cc, line 5629
# Check failed: heap_->Contains(object).
#
#
#
#FailureMessage Object: 0x7ffee4812b10
==== C stack trace ===============================

    0   libv8_libbase.dylib                 0x000000010d2af8a3 v8::base::debug::StackTrace::StackTrace() + 19
    1   libv8_libplatform.dylib             0x000000010d2d4d89 v8::platform::(anonymous namespace)::PrintStackTrace() + 41
    2   libv8_libbase.dylib                 0x000000010d2a7ba5 V8_Fatal(char const*, int, char const*, ...) + 325
    3   libv8.dylib                         0x000000010bb46eae v8::internal::VerifyPointersVisitor::VerifyPointers(v8::internal::HeapObject*, v8::internal::MaybeObject**, v8::internal::MaybeObject**) + 142
    4   libv8.dylib                         0x000000010bc7082c v8::internal::Isolate::Iterate(v8::internal::RootVisitor*, v8::internal::ThreadLocalTop*) + 124
    5   libv8.dylib                         0x000000010bb3ea20 v8::internal::Heap::IterateStrongRoots(v8::internal::RootVisitor*, v8::internal::VisitMode) + 128
    6   libv8.dylib                         0x000000010bb28935 v8::internal::Heap::Verify() + 149
    7   libv8.dylib                         0x000000010bb2843f v8::internal::Heap::GarbageCollectionPrologue() + 335
    8   libv8.dylib                         0x000000010bb2e39a v8::internal::Heap::CollectGarbage(v8::internal::AllocationSpace, v8::internal::GarbageCollectionReason, v8::GCCallbackFlags) + 1274
    9   libv8.dylib                         0x000000010bb4067d v8::internal::Heap::AllocateRawWithLightRetry(int, v8::internal::AllocationSpace, v8::internal::AllocationAlignment) + 61
    10  libv8.dylib                         0x000000010bb408af v8::internal::Heap::AllocateRawWithRetryOrFail(int, v8::internal::AllocationSpace, v8::internal::AllocationAlignment) + 31
    11  libv8.dylib                         0x000000010badeabc v8::internal::Factory::NewFixedArrayWithFiller(v8::internal::Heap::RootListIndex, int, v8::internal::Object*, v8::internal::PretenureFlag) + 124
    12  libv8.dylib                         0x000000010bade914 v8::internal::Handle<v8::internal::FixedArray> v8::internal::Factory::NewFixedArrayWithMap<v8::internal::FixedArray>(v8::internal::Heap::RootListIndex, int, v8::internal::PretenureFlag) + 116
    13  libv8.dylib                         0x000000010be279f1 v8::internal::OrderedHashTable<v8::internal::OrderedHashSet, 1>::Allocate(v8::internal::Isolate*, int, v8::internal::PretenureFlag) + 113
    14  libv8.dylib                         0x000000010be28171 v8::internal::OrderedHashTable<v8::internal::OrderedHashSet, 1>::Rehash(v8::internal::Isolate*, v8::internal::Handle<v8::internal::OrderedHashSet>, int) + 289
    15  libv8.dylib                         0x000000010be27f61 v8::internal::OrderedHashTable<v8::internal::OrderedHashSet, 1>::EnsureGrowable(v8::internal::Isolate*, v8::internal::Handle<v8::internal::OrderedHashSet>) + 529
    16  libv8.dylib                         0x000000010be2fb27 v8::internal::OrderedHashSet::Add(v8::internal::Isolate*, v8::internal::Handle<v8::internal::OrderedHashSet>, v8::internal::Handle<v8::internal::Object>) + 343
    17  libv8.dylib                         0x000000010bca5abe v8::internal::KeyAccumulator::AddKey(v8::internal::Handle<v8::internal::Object>, v8::internal::AddKeyConversion) + 606
    18  libv8.dylib                         0x000000010ba2ed7a v8::internal::(anonymous namespace)::DictionaryElementsAccessor::CollectElementIndicesImpl(v8::internal::Handle<v8::internal::JSObject>, v8::internal::Handle<v8::internal::FixedArrayBase>, v8::internal::KeyAccumulator*) + 1034
    19  libv8.dylib                         0x000000010bcaaa04 v8::internal::KeyAccumulator::CollectOwnElementIndices(v8::internal::Handle<v8::internal::JSReceiver>, v8::internal::Handle<v8::internal::JSObject>) + 324
    20  libv8.dylib                         0x000000010b9ee1a8 v8::internal::ElementsAccessor::CollectNumberDictionaryElementIndices(v8::internal::Isolate*, v8::internal::JSArray*) + 744
    21  libv8.dylib                         0x000000010c6955d6 v8_Default_embedded_blob_ + 3960598
Received signal 4 <unknown> 00010d2ad732
```


# ==============================
# NOTES
# ==============================

# Array Size and ElementsKind

```js
new Array(size);
```

| Elements Kind | Start                               | End                            |
|---------------|-------------------------------------|--------------------------------|
| HoleyElements | `0`                                 | `JSArray::kMaxFastArrayLength` |
| Slow???       | `JSArray::kMaxFastArrayLength + 1`  | `2^25`                         |
| Dictionary    | `2^25 + 1`                          | `2^32 - 1`                     |
