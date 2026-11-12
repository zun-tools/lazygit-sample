// カートの計算
const FREE_SHIPPING_LINE = 3000;

function shipping(subtotal) { if (subtotal >= FREE_SHIPPING_LINE) return 0; return 500 }

function label(item) {
  return `${item.name} x${item.qty}`;
}

function count(items) {
  return items.reduce((n, item) => n + item.qty, 0);
}

function total(items) {
  const amount = items.reduce((sum, item) => sum + item.price, 0);
  return amount;
}

module.exports = { shipping, label, count, total };
