// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(() => {

function Internalize(s) {
  return Object.keys({[s]:0})[0];
}

let string = Internalize('a'.repeat(100));
let pattern;
let result;

const setupString = () => pattern = '.';
const setupRegExp = () => pattern = /./g;
const setupNoMatch = () => {
  // setupRegExp();
  // string = '';
  string = 'a';
  pattern = /\d/g;
};

Object.entries({
  // BuiltinString: {
  //   setup: setupString,
  //   bench() {
  //     for (const match of string.matchAll(pattern)) {
  //       result = match.index;
  //     }
  //   }
  // },
  // ManualString: {
  //   setup: setupString,
  //   bench() {
  //     let regexp = new RegExp(pattern, 'g');
  //     let match;
  //     while((match = regexp.exec(string)) !== null) {
  //       result = match[0];
  //     }
  //   }
  // },
  // BuiltinRegExp: {
  //   setup: setupRegExp,
  //   bench() {
  //     for (const match of string.matchAll(pattern)) {
  //       result = match[0];
  //     }
  //   }
  // },
  // ManualRegExp: {
  //   setup: setupRegExp,
  //   bench() {
  //     let match;
  //     while((match = pattern.exec(string)) !== null) {
  //       result = match[0];
  //     }
  //   }
  // },
  BuiltinNoMatch: {
    setup: setupNoMatch,
    bench() {
      for (const match of string.matchAll(pattern)) {
        result = match[0];
      }
    }
  },
  ManualNoMatch: {
    setup: setupNoMatch,
    bench() {
      let match;
      while((match = pattern.exec(string)) !== null) {
        result = match[0];
      }
    }
  }
}).forEach(([ name, { setup, bench } ]) => {
  new BenchmarkSuite(`StringMatchAll${name}`, [20], [
    new Benchmark(`StringMatchAll${name}`, false, false, 0, bench, setup)
  ]);
});

})();
