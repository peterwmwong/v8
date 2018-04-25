// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(function ToStringThrows() {
  function TestError() {}

  const toStringThrows = {
    toString() { throw new TestError; }
  }
  const a = [toStringThrows];
  assertThrows(() => a.join(), TestError);

  // Verifies the cycle detection works properly after thrown error
  a[0] = 1;
  a[1] = 2;
  assertSame('1,2', a.join());
})();

