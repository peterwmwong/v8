// Copyright 2018 the V8 project authors. All rights reserved.
// This code is governed by the BSD license found in the LICENSE file.

/*---
description: Named groups can be used in conjunction with lookbehind
esid: prod-GroupSpecifier
features: [regexp-named-groups, regexp-lookbehind]
includes: [compareArray.js]
---*/

(function NonStringReceiver() {
  let no_exception = true;
  try {
    result_iter.next.call(777);
    no_exception = false;
  } catch(e) {}
  assertTrue(no_exception);
})();

(function IteratorType() {
  const result_iter = '$a$b'.matchAll(/\$\w/);
  const result_iter2 = '$a$b'.matchAll(/\$\w/);

  assertTrue(result_iter !== result_iter2);
  assertSame(Object.getPrototypeOf(result_iter), Object.getPrototypeOf(result_iter2));
})();

(function NonGlobalRegexNoMatch() {
  const next_result = 'yolo'.matchAll(/\$\w/).next();
  assertSame(null, next_result.value);
  assertTrue(next_result.done);
})();

(function NonGlobalRegex() {
  const result_iter = '$a$b'.matchAll(/\$\w/);
  let next_result = result_iter.next();
  assertEquals(['$a'], next_result.value);
  assertFalse(next_result.done);

  next_result = result_iter.next();
  assertEquals(null, next_result.value);
  assertTrue(next_result.done);
})();

(function GlobalRegex() {
  const result_iter = '$a$b'.matchAll(/\$\w/g);
  let next_result = result_iter.next();
  assertEquals(['$a'], next_result.value);
  assertFalse(next_result.done);

  next_result = result_iter.next();
  assertEquals(['$b'], next_result.value);
  assertFalse(next_result.done);

  next_result = result_iter.next();
  assertSame(null, next_result.value);
  assertTrue(next_result.done);
})();

(function Empty() {
  const result_iter = ''.matchAll(/.?/g);
  let next_result = result_iter.next();
  assertEquals([''], next_result.value);

  next_result = result_iter.next();
  assertSame(null, next_result.value);
  assertTrue(next_result.done);
})();

console.log("PASS");
