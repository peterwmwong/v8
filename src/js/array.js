// Copyright 2012 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(function(global, utils, extrasUtils) {

"use strict";

%CheckIsBootstrapping();

// -------------------------------------------------------------------
// Imports

var GlobalArray = global.Array;
var InternalArray = utils.InternalArray;
var iteratorSymbol = utils.ImportNow("iterator_symbol");
var unscopablesSymbol = utils.ImportNow("unscopables_symbol");

// -------------------------------------------------------------------

// Set up unscopable properties on the Array.prototype object.
var unscopables = {
  __proto__: null,
  copyWithin: true,
  entries: true,
  fill: true,
  find: true,
  findIndex: true,
  includes: true,
  keys: true,
};

%ToFastProperties(unscopables);

%AddNamedProperty(GlobalArray.prototype, unscopablesSymbol, unscopables,
                  DONT_ENUM | READ_ONLY);

var ArrayIndexOf = GlobalArray.prototype.indexOf;
var ArrayJoin = GlobalArray.prototype.join;
var ArrayPop = GlobalArray.prototype.pop;
var ArrayPush = GlobalArray.prototype.push;
var ArraySlice = GlobalArray.prototype.slice;
var ArrayShift = GlobalArray.prototype.shift;
var ArraySort = GlobalArray.prototype.sort;
var ArraySplice = GlobalArray.prototype.splice;
var ArrayToString = GlobalArray.prototype.toString;
var ArrayUnshift = GlobalArray.prototype.unshift;

// Array prototype functions that return iterators. They are exposed to the
// public API via Template::SetIntrinsicDataProperty().
var ArrayEntries = GlobalArray.prototype.entries;
var ArrayForEach = GlobalArray.prototype.forEach;
var ArrayKeys = GlobalArray.prototype.keys;
var ArrayValues = GlobalArray.prototype[iteratorSymbol];


// The internal Array prototype doesn't need to be fancy, since it's never
// exposed to user code.
// Adding only the functions that are actually used.
utils.SetUpLockedPrototype(InternalArray, GlobalArray(), [
  "indexOf", ArrayIndexOf,
  "join", ArrayJoin,
  "pop", ArrayPop,
  "push", ArrayPush,
  "shift", ArrayShift,
  "sort", ArraySort,
  "splice", ArraySplice
]);

// V8 extras get a separate copy of InternalPackedArray. We give them the basic
// manipulation methods.
utils.SetUpLockedPrototype(extrasUtils.InternalPackedArray, GlobalArray(), [
  "push", ArrayPush,
  "pop", ArrayPop,
  "shift", ArrayShift,
  "unshift", ArrayUnshift,
  "splice", ArraySplice,
  "slice", ArraySlice
]);

// -------------------------------------------------------------------
// Exports

utils.Export(function(to) {
  to.ArrayJoin = ArrayJoin;
  to.ArrayPush = ArrayPush;
  to.ArrayToString = ArrayToString;
  to.ArrayValues = ArrayValues;
});

%InstallToContext([
  "array_entries_iterator", ArrayEntries,
  "array_for_each_iterator", ArrayForEach,
  "array_keys_iterator", ArrayKeys,
  "array_values_iterator", ArrayValues,
]);

});
