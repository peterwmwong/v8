'use strict';
/*

# Test against current Node

    > node test.js split
    > node test.js exec


# Test against incoming version V8 (next release of Node.js)

https://github.com/GoogleChromeLabs/jsvu

    > npm install jsvu -g
    > ~/.jsvu/v8 bench.js -- smi join
    > ~/.jsvu/v8 bench.js -- double join

*/
(() => {

// const ITERATIONS = 10;
// const ARRAY_SIZE = 10;
const ITERATIONS = 1e6;
const ARRAY_SIZE = 16;
const SETUP_VARIANTS = {
  smi() {
    const array = new Array();
    for (let i = 0; i < ARRAY_SIZE; ++i) array[i] = i;
    return array;
  },
  string() {
    const array = new Array();
    for (let i = 0; i < ARRAY_SIZE; ++i) array[i] = `Item no. ${i}`;
    return array;
  },
  double() {
    const array = new Array();
    for (let i = 0; i < ARRAY_SIZE; ++i) array[i] = i + 0.25;
    return array;
  },
  sparseSmi() {
    const array = SETUP_VARIANTS.smi();
    array.length = array.length * 2;
    return array;
  },
  sparseString() {
    const array = SETUP_VARIANTS.string();
    array.length = array.length * 2;
    return array;
  }
};

const VARIANTS = {
  join: array => array.join(),
  joinSep: array => array.join('|')
}

const [setupVariantName, variantName] = (
  typeof process !== 'undefined'
    ? [process.argv[2], process.argv[3]]
    : [arguments[0], arguments[1]]
);
const array = SETUP_VARIANTS[setupVariantName]();
const func = VARIANTS[variantName];

let result = 0; // Defeat Escape Analysis
const timeName = `${setupVariantName}-${variantName}`;
console.time(timeName);
for (let i = 0; i < ITERATIONS; i++) {
  result = func(array);
}
console.timeEnd(timeName);

})();
