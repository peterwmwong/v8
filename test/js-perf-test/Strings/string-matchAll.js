// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(() => {

const string = '123***456***789';
let pattern;

const setupString = () => {
  pattern = '\\w';
}

const setupRegExp = () => {
  pattern = /\w/g;
}

Object.entries({
  BuiltinString: {
    setup: setupString,
    bench() {
      let acc = 0;
      for (const match of string.matchAll(pattern)) {
        acc += match.index;
      }
      return acc;
    }
  },
  ManualString: {
    setup: setupString,
    bench() {
      let regexp = new RegExp(pattern, 'g');
      let acc = 0;
      let match;
      while((match = regexp.exec(string)) !== null) {
        acc += match.index;
      }
      return acc;
    }
  },
  BuiltinRegExp: {
    setup: setupRegExp,
    bench() {
      let acc = 0;
      for (const match of string.matchAll(pattern)) {
        acc += match.index;
      }
      return acc;
    }
  },
  ManualRegExp: {
    setup: setupRegExp,
    bench() {
      let acc = 0;
      let match;
      while((match = pattern.exec(string)) !== null) {
        acc += match.index;
      }
      return acc;
    }
  }
}).forEach(([ name, { setup, bench } ]) => {
  new BenchmarkSuite(`StringMatchAll${name}`, [20], [
    new Benchmark(`StringMatchAll${name}`, false, false, 0, bench, setup)
  ]);
});

})();
