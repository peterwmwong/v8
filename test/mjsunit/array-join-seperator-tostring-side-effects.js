// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(function ArrayLengthIncreased() {
  const a = [1,2,3];
  let callCount = 0;
  assertEquals('1,2,3', a.join({
    toString() {
      callCount++;
      a.push(4);
      return ',';
    }
  }));
  assertSame(1, callCount);
  assertEquals('1,2,3,4', a.join());
})();

(function ArrayLengthDecreased() {
  const a = [1,2,3];
  let callCount = 0;
  assertEquals('1,2,', a.join({
    toString() {
      callCount++;
      a.pop();
      return ',';
    }
  }));
  assertEquals('1,2', a.join());
})();

(function ElementsKindSmiToDoubles() {
  const a = [1,2,3];
  let callCount = 0;
  assertEquals('1.5,2,3', a.join({
    toString() {
      callCount++;
      a[0] = 1.5
      return ',';
    }
  }));
  assertSame(1, callCount);
  assertEquals('1.5,2,3', a.join());
})();

(function ArrayIsNoLongerFast() {
  const a = [1,2,3];
  let callCount = 0;
  assertEquals('666,2,3', a.join({
    toString() {
      callCount++;
      Object.defineProperty(a, '0', {
        get(){ return 666; }
      });
      return ',';
    }
  }));
  assertSame(1, callCount);
  assertEquals('666,2,3', a.join());
})();

(function ArrayPrototypeIsNoLongerFast() {
  const a = [1,2,3];
  let callCount = 0;
  assertEquals('1,2,777', a.join({
    toString() {
      callCount++;
      a.pop();
      Object.defineProperty(Array.prototype, '2', {
        get(){ return 777; }
      });
      return ',';
    }
  }));
  assertSame(1, callCount);
  assertEquals('1,2', a.join());
})();

