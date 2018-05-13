// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(function ToStringThrows() {
  function TestError() {}

  let callCount = 0;
  const toStringThrows = {
    toString() {
      callCount++;
      throw new TestError;
    }
  }
  const a = [toStringThrows];
  assertThrows(() => a.join(), TestError);
  assertSame(1, callCount);

  // Verifies cycle detection still works properly after thrown error.
  a[0] = 1;
  a[1] = 2;
  assertSame('1,2', a.join());
})();

(function ArrayLengthIncreased() {
  let callCount = 0;
  const a = [
    {
      toString() {
        callCount++;
        a.push(2);
        return '1';
      }
    }
  ];
  assertSame('1', a.join());
  assertSame(1, callCount);
  assertSame('1,2', a.join());
})();

(function ArrayLengthDecreased() {
  let callCount = 0;
  const a = [
    {
      toString() {
        callCount++;
        a.pop();
        return '1';
      }
    },
    '2'
  ];
  assertSame('1,', a.join());
  assertSame(1, callCount);
  assertSame('1', a.join());
})();

(function ElementsKindChangedToHoley() {
  let callCount = 0;
  const a = [
    {
      toString() {
        callCount++;
        a.length = 3;
        a[1] = 777;
        return '1';
      }
    },
    2
  ];
  assertSame('1,777', a.join());
  assertSame(1, callCount);
  assertSame('1,777,', a.join());
})();
