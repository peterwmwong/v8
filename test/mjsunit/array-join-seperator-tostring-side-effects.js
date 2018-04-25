// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(function ToStringThrows() {
  function TestError() {}

  let callCount = 0;
  const a = [1, 2];
  assertThrows(() => a.join({
    toString() {
      callCount++;
      throw new TestError;
    }
  }), TestError);
  assertSame(1, callCount);

  // Verifies cycle detection still works properly after thrown error.
  assertSame('1,2', a.join());
})();

(function RecursiveJoinCall() {
  const a = [1,2,3];
  let callCount = 0;
  const sep = {
    toString() {
      callCount++;
      return a.join('-');
    }
  };
  assertEquals('11-2-321-2-33', a.join(sep));
  assertSame(1, callCount);

  // Verify cycle detection works properly after nested call
  assertEquals('1,2,3', a.join());
})();


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
  assertSame(1, callCount);
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

(function ElementsKindElementsToDoubles() {
  const a = ['one', 'two', 'three'];
  let callCount = 0;
  assertEquals('1.5,two,three', a.join({
    toString() {
      callCount++;
      a[0] = 1.5
      return ',';
    }
  }));
  assertSame(1, callCount);
  assertEquals('1.5,two,three', a.join());
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

