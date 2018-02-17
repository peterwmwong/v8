// Copyright 2018 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef V8_OBJECTS_JS_REGEXP_STRING_ITERATOR_H_
#define V8_OBJECTS_JS_REGEXP_STRING_ITERATOR_H_

#include "src/objects.h"

// Has to be the last include (doesn't have include guards):
#include "src/objects/object-macros.h"

namespace v8 {
namespace internal {

class JSRegExpStringIterator : public JSObject {
 public:
  // [regexp]: the [[IteratingRegExp]] inobject property.
  DECL_ACCESSORS(regex, Object)

  // [string]: The [[IteratedString]] inobject property.
  DECL_ACCESSORS(string, String)

  DECL_INT_ACCESSORS(flags)

  // [boolean]: The [[Done]] inobject property.
  DECL_BOOLEAN_ACCESSORS(done)

  // [boolean]: The [[Global]] inobject property.
  DECL_BOOLEAN_ACCESSORS(global)

  // [boolean]: The [[Unicode]] inobject property.
  DECL_BOOLEAN_ACCESSORS(unicode)

  DECL_CAST(JSRegExpStringIterator)
  DECL_PRINTER(JSRegExpStringIterator)
  DECL_VERIFIER(JSRegExpStringIterator)

  static const int kIteratingRegExpOffset = JSObject::kHeaderSize;
  static const int kIteratedStringOffset =
      kIteratingRegExpOffset + kPointerSize;
  static const int kFlagsOffset = kIteratedStringOffset + kPointerSize;

  static const int kSize = kFlagsOffset + kPointerSize;

  static const int kDoneBit = 0;
  static const int kGlobalBit = 1;
  static const int kUnicodeBit = 2;

 private:
  DISALLOW_IMPLICIT_CONSTRUCTORS(JSRegExpStringIterator);
};

}  // namespace internal
}  // namespace v8

#include "src/objects/object-macros-undef.h"

#endif  // V8_OBJECTS_JS_REGEXP_STRING_ITERATOR_H_
