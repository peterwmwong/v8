// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

function nestedArray(depth, value) {
  const arr = [value];
  if (--depth > 0) arr.push(nestedArray(depth, value));
  return arr;
}

const DEPTH = 128;
let r = nestedArray(DEPTH, 'a').join();
let expected = 'a,'.repeat(DEPTH).slice(0, -1);
assertSame(expected, r);

// Verify cycle detection is still working.
assertSame(expected, r);


