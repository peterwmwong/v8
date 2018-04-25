// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flags: --allow-natives-syntax

const MIN_DICTIONARY_LENGTH = 2**25+1;

(function Empty() {
  const b = new Array(MIN_DICTIONARY_LENGTH);

  assertTrue(%HasDictionaryElements(b));
  assertSame('', b.join(''));
  assertSame(','.repeat(MIN_DICTIONARY_LENGTH - 1), b.join());
})();

(function HoleyStart() {
  const b = new Array(MIN_DICTIONARY_LENGTH);
  b[0] = 'a';

  assertTrue(%HasDictionaryElements(b));
  assertEquals('a', b.join(''));
  assertEquals('a' + ','.repeat(MIN_DICTIONARY_LENGTH - 1), b.join(','));
  assertEquals(`a${','.repeat(MIN_DICTIONARY_LENGTH - 1)}`, b.join(','));
})();

(function HoleyEnd() {
  const b = new Array(MIN_DICTIONARY_LENGTH);
  b[MIN_DICTIONARY_LENGTH - 1] = 'a';

  assertTrue(%HasDictionaryElements(b));
  assertEquals('a', b.join(''));
  assertEquals(`${','.repeat(MIN_DICTIONARY_LENGTH - 1)}a`, b.join(','));
})();

(function HoleyStartEnd() {
  const b = new Array(MIN_DICTIONARY_LENGTH);
  const index = MIN_DICTIONARY_LENGTH >> 1;
  b[index] = 'a';

  assertTrue(%HasDictionaryElements(b));
  assertEquals('a', b.join(''));

  const expectedStart = ','.repeat(index);
  const expectedEnd = ','.repeat(MIN_DICTIONARY_LENGTH - index - 1);
  assertEquals(`${expectedStart}a${expectedEnd}`, b.join(','));
})();

(function HoleyMiddle() {
  const b = new Array(MIN_DICTIONARY_LENGTH);
  b[0] = 'a';
  b[MIN_DICTIONARY_LENGTH - 1] = 'b';

  assertTrue(%HasDictionaryElements(b));
  assertEquals('ab', b.join(''));
  assertEquals(`a${','.repeat(MIN_DICTIONARY_LENGTH - 1)}b`, b.join(','));
})();

(function HoleyStartMiddleEnd() {
  const b = new Array(MIN_DICTIONARY_LENGTH);
  b[10] = 'a';
  b[MIN_DICTIONARY_LENGTH - 10] = 'b';

  assertTrue(%HasDictionaryElements(b));
  assertEquals('ab', b.join(''));

  const expectedStart = ','.repeat(10);
  const expectedMiddle = ','.repeat(MIN_DICTIONARY_LENGTH - 10 - 10);
  const expectedEnd = ','.repeat(9);
  assertEquals(`${expectedStart}a${expectedMiddle}b${expectedEnd}`, b.join(','));
})();
