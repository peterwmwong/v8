// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flags: --allow-natives-syntax

const MIN_DICTIONARY_LENGTH = 2**25 + 1;
const FILL_LENGTH = 2**13;
const a = [];
const el = 'a';

for (let i = 0; i < FILL_LENGTH; i++) {
  a[i] = el;
}
a.length = MIN_DICTIONARY_LENGTH;
assertTrue(%HasDictionaryElements(a));

assertSame(a.join(''), el.repeat(FILL_LENGTH));
