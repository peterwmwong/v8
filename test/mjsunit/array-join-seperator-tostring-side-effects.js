// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(function ArrayLengthIncreased() {
  const a = [1,2,3];
  assertEquals('1,2,3', a.join({
    toString() {
      a.push(4);
      return ',';
    }
  }));
})();

(function ArrayLengthDecreased() {
  const a = [1,2,3];
  assertEquals('1,2,', a.join({
    toString() {
      a.pop();
      return ',';
    }
  }));
})();

(function ElementsKindSmiToDoubles() {
  const a = [1,2,3];
  assertEquals('1.5,2,3', a.join({
    toString() {
      a[0] = 1.5
      return ',';
    }
  }));
})();

(function ArrayIsNoLongerFast() {
  const a = [1,2,3];
  assertEquals('666,2,3', a.join({
    toString() {
      Object.defineProperty(a, '0', {
        get(){ return 666; }
      });
      return ',';
    }
  }));
})();

(function ArrayPrototypeIsNoLongerFast() {
  const a = [1,2,3];
  assertEquals('1,2,777', a.join({
    toString() {
      a.pop();
      Object.defineProperty(Array.prototype, '2', {
        get(){ return 777; }
      });
      return ',';
    }
  }));
})();

