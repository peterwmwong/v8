// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

function TestMapConstructorEntrySideEffect(ctor) {
  const k1 = {};
  const k2 = {};
  const input = [
    Object.defineProperty([, 1], "0", {
      get() {
        // Verify continuation retains original set function
        ctor.prototype.set = () => {};
        return k1;
      }
    }),
    [k2, 2]
  ];
  const col = new ctor(input);

  if ('size' in col) assertEquals(col.size, 2);
  assertTrue(col.has(k1));
  assertTrue(col.has(k2));
}
TestMapConstructorEntrySideEffect(Map);
TestMapConstructorEntrySideEffect(WeakMap);
