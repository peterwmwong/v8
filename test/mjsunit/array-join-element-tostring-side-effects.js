// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

function AllTests() {
  (function ToStringThrows() {
    function TestError() {}

    let callCount = 0;
    const toStringThrows = {
      toString() {
        callCount++;
        throw new TestError;
      }
    };
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
          a.length = 4;
          a[1] = 777;
          a[2] = 7.7;
          return '1';
        }
      },
      2,
      3
    ];
    assertSame('1,777,7.7', a.join());
    assertSame(1, callCount);
    assertSame('1,777,7.7,', a.join());
  })();

  // (function NumberDictionaryChanged() {
  //   a = new Array(Math.pow(2,32) - 1);  // Max length.
  //   a[123123123] = {
  //     toString() {
  //       a[123123124] = '2';
  //       return '1';
  //     }
  //   };
  //   function assertEquals(a, b) {
  //     if (a !== b) {
  //       throw new Error(`assertEquals(${a}, ${b}) FAILED`);
  //     }
  //   }
  //   assertEquals("1,2", a.join(1,2));
  // })();

  // (function NumberDictionaryChanged() {
  //   a = new Array(2**25+1);  // Max length.
  //   a.length = 12;
  //   a[2**25-1] = {
  //     toString() {
  //       Array.prototype[9999] = true;
  //       return '1';
  //     }
  //   };
  //   a[2**25] = '2';
  //   assertEquals("1,2", a.join());
  // })();
}

AllTests();

// Force start in slow path
Array.prototype[9999] = true;

AllTests();
