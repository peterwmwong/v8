// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

function TestMapConstructorEntrySideEffect(ctor) {
  const k1 = {};
  const k2 = {};
  const k3 = {};
  let firstEntryCallCount = 0;
  let lastEntryCallCount = 0;
  const input = [
    Object.defineProperty([, 1], "0", {
      get() {
        // Verify handling of a non-Smi array length
        input.length = 2 ** 32 - 2;
        firstEntryCallCount++;
        return k1;
      }
    }),
    [k2, 2],
    Object.defineProperty([k3, ], "1", {
      get() {
        input.length = 1;
        lastEntryCallCount++;
        return 3;
      }
    })
  ];
  const col = new ctor(input);

  assertEquals(firstEntryCallCount, 1);
  assertEquals(lastEntryCallCount, 1);
  if ('size' in col) assertEquals(col.size, 3);
  assertEquals(col.get(k1), 1);
  assertEquals(col.get(k2), 2);
  assertEquals(col.get(k3), 3);
}
TestMapConstructorEntrySideEffect(Map);
TestMapConstructorEntrySideEffect(WeakMap);
