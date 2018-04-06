// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(() => {

function Internalize(s) {
  return Object.keys({[s]:0})[0];
}

const string = Internalize('a'.repeat(100));
let pattern;
let result;

const setupString = () => pattern = '.';
const setupRegExp = () => pattern = /./g;

Object.entries({
  BuiltinString: {
    setup: setupString,
    bench() {
      for (const match of string.matchAll(pattern)) {
        result = match.index;
      }
    }
  },
  ManualString: {
    setup: setupString,
    bench() {
      let regexp = new RegExp(pattern, 'g');
      let match;
      while((match = regexp.exec(string)) !== null) {
        result = match.index;
      }
    }
  },
  BuiltinRegExp: {
    setup: setupRegExp,
    bench() {
      for (const match of string.matchAll(pattern)) {
        result = match.index;
      }
    }
  },
  ManualRegExp: {
    setup: setupRegExp,
    bench() {
      let match;
      while((match = pattern.exec(string)) !== null) {
        result = match.index;
      }
    }
  }
}).forEach(([ name, { setup, bench } ]) => {
  new BenchmarkSuite(`StringMatchAll${name}`, [20], [
    new Benchmark(`StringMatchAll${name}`, false, false, 0, bench, setup)
  ]);
});

})();
