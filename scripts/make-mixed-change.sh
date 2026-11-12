#!/usr/bin/env bash
# 練習用: 動画の山場と同じ「混ざった変更」を cart.js に作る。
#   1. shipping() の1行を4行に整形する（別のまとまり）
#   2. total() の合計を直す（price に qty を掛ける）
#   3. 合計の直後・return の前に console.log を1行足す（修正と同じまとまり）
# 前提: cart.js が HEAD（バグ版）と同じ状態。実行後の git diff は2つの塊になる。
set -euo pipefail

cd "$(dirname "$0")/.."

if ! git diff --quiet HEAD -- cart.js; then
  echo "cart.js が HEAD と違うため止めました。やり直すなら git restore cart.js で戻してから実行してください。" >&2
  exit 1
fi

node -e '
const fs = require("fs");
const file = "cart.js";
let src = fs.readFileSync(file, "utf8");
const edits = [
  [
    "function shipping(subtotal) { if (subtotal >= FREE_SHIPPING_LINE) return 0; return 500 }\n",
    "function shipping(subtotal) {\n  if (subtotal >= FREE_SHIPPING_LINE) return 0;\n  return 500;\n}\n",
  ],
  [
    "  const amount = items.reduce((sum, item) => sum + item.price, 0);\n",
    "  const amount = items.reduce((sum, item) => sum + item.price * item.qty, 0);\n  console.log(\"debug\", amount);\n",
  ],
];
for (const [before, after] of edits) {
  const found = src.split(before).length - 1;
  if (found !== 1) {
    console.error("想定の行が1か所で見つからなかったため止めました: " + found + "件");
    process.exit(1);
  }
  src = src.replace(before, () => after);
}
fs.writeFileSync(file, src);
'

echo "混ざった変更を作りました。git diff で確かめてください。"
