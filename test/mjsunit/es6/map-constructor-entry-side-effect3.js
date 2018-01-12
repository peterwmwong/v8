// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// const assert = require('assert');

// TODO(pwong): REMOVE ME
if (typeof assertEquals == 'undefined') {
  function assertEquals(actual, expected) {
    if (actual !== expected) throw new Error("Expectation failed");
  }
  function assertTrue(actual) { assertEquals(actual, true); }
  function assertFalse(actual) { assertEquals(actual, false); }
}

function TestMapConstructorEntrySideEffect(ctor) {
  const k1 = {};
  const k2 = {};
  const k3 = {};
  const input = [
    Object.defineProperty([, 1], "0", {
      get() {
        Object.defineProperty(input, "1", {
          get: () => [k3, 3]
        });
        return k1;
      }
    }),
    [k2, 2]
  ];
  const col = new ctor(input);

  if ('size' in col) assertEquals(col.size, 2);
  assertTrue(col.has(k1));
  assertFalse(col.has(k2));
  assertTrue(col.has(k3));
}
TestMapConstructorEntrySideEffect(Map);
TestMapConstructorEntrySideEffect(WeakMap);
