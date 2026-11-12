const test = require("node:test");
const assert = require("node:assert");
const { total, shipping } = require("./cart");

test("合計は 価格×個数 の和", () => {
  assert.strictEqual(total([{ price: 100, qty: 2 }, { price: 50, qty: 1 }]), 250);
});

test("3000円以上は送料無料", () => {
  assert.strictEqual(shipping(3000), 0);
});
