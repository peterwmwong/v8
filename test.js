// assertSame('1,2,3', [1,2,3].join());
// assertSame('1.5,2,3', [1.5,2,3].join());
// assertSame('1.5,2,3', [1.5,2,3].join()); // TODO(pwong): why does this generate a grow
// assertSame('', [,].join('-'));
// assertSame('-', [,,].join('-'));
// console.log('PASS');


// Add
// const a = [1,2,3];
// const pop = {
//   toString() {
//     a.pop(4);
//     Object.defineProperty(Array.prototype, '2', { get() { return 666; } });
//     return ',';
//   }
// };
// console.log(a.join(pop));



assertSame('1.5,2,3', [1.5,2,3].join());
assertSame('1.5,2,3', [1.5,2,3].join());
assertSame('1.5,2,3', [1.5,2,3].join()); // <--- WHY DOES THIS GROW!?
