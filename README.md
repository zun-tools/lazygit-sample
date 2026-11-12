# lazygit-sample

[lazygit](https://github.com/jesseduffield/lazygit) の入門動画の練習用サンプルです。カートの合計と送料を計算する小さな JavaScript で、テストは Node.js 組み込みの `node --test` で動きます。

このリポは lazygit 本体とは無関係の、動画の練習用に作ったサンプルです（MIT ライセンス）。

## 使い方

1. `git clone https://github.com/zun-tools/lazygit-sample.git` して、そのフォルダへ移動する
2. `./scripts/make-mixed-change.sh` を実行する（動画の山場と同じ「混ざった変更」ができます）
3. `lazygit` を起動する（迷ったら `?` でキー一覧）

2 を終えると `git diff` に2つの塊が出ます。1つ目は `shipping()` の整形、2つ目は `total()` の合計の修正と `console.log` の1行です。やり直すときは `git restore cart.js` で戻してから 2 を実行してください。

## 中身

- `cart.js` — 計算本体。HEAD の `total()` は数量を掛けていないバグ入りなので、`npm test` は clone 直後は赤になります（練習で直す箇所）。
- `cart.test.js` — テスト（3件）
- `package.json` — `npm test` の定義（外部の依存はありません）
- `scripts/make-mixed-change.sh` — 練習用の「混ざった変更」を作る
- `config.example.yml` — lazygit の設定の例（カスタムコマンド X・Y）

## config.yml の置き場所

- Mac: `~/Library/Application Support/lazygit/config.yml`
- Linux: `~/.config/lazygit/config.yml`

既存の config.yml がある場合は上書きせず、`customCommands:` の中身だけを足してください。lazygit のステータスの画面で `e` を押すと開けます。

- `X` … `npm test` の結果を小窓に出す
- `Y` … 種類（fix・feat・style）を選び、メッセージを入力してコミットする。先に stage しておく必要があります。メッセージに `"` や `$` は入れないでください。

## 確かめたこと（lazygit v0.66.3）

- lazygit v0.66.3 を Linux（arm64）の公式バイナリで確かめました。git 2.53.0・Node.js v22.22.1 の環境です。Mac と Homebrew 版では確かめていません。
- 差分の画面で、混ざった変更を行ごとに選んで stage し、2つのコミットに分けられました。
- `config.example.yml` の X・Y のカスタムコマンドが動き、Y で `fix: 合計の計算を直す` のコミットができました。

## ライセンス

MIT License（[LICENSE](LICENSE)）。Copyright (c) 2026 zun-tools
