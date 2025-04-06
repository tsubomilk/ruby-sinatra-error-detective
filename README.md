# 🩺 BilsonDoctor

Ruby Sinatraのエラー解説に特化したWebサービスです。
中高生が書いたコードのエラーメッセージをもとに、わかりやすくアドバイスしてくれる先生 **BilsonDoctor** です

---

## 🔧 できること

- 🧠 エラーの原因をやさしく解説
- 💡 修正例やアドバイスももらえる
- 🧒 中高生にもわかる言葉で教えてくれる
- 🎨 かわいいUIでテンションもUP！
<img width="473" alt="image" src="https://github.com/user-attachments/assets/aaebbf0b-71d2-401b-a485-b27fd592f760" />

---

## 🚀 デプロイ先

[🔗 公開URL（Render）](https://ruby-sinatra-error-detective.onrender.com)

https://github.com/user-attachments/assets/94d521b7-583f-42d8-91eb-2a1550991858

---

## 🛠 技術スタック

| 項目         | 使用技術                      |
|--------------|-------------------------------|
| フレームワーク | Sinatra                      |
| 言語         | Ruby 3.2.2                     |
| デプロイ先     | Render（Free）                |
| スタイル     | CSS / Google Fonts (Noto Sans JP) |
| API         | Claude 3 Sonnet（Anthropic）  |

---

## 📂 ディレクトリ構成（例）

```
.
├── app.rb               # Sinatraアプリ本体
├── views/
│   ├── index.erb        # 入力フォーム
│   └── result.erb       # 結果表示
├── public/
│   └── css/style.css    # スタイルシート
├── .ruby-version        # Rubyのバージョン指定
├── Gemfile              # 使用ライブラリ
└── README.md            # ←このファイル！
```

---

## ✨ 使い方

1. フォームにエラーメッセージと現在のコードを入力  
2. 「診断する」ボタンを押す  
3. ビルソンが元気に解説してくれるよ！

---

## 🧪 ローカル開発手順

```bash
git clone https://github.com/tsubomilk/ruby-sinatra-error-detective.git
cd ruby-sinatra-error-detective
bundle install
ruby app.rb
```

---

## 📣 作者からひとこと

なかなか、Sinatraのフレームワークで、AIに質問してもいい返答がすぐに返ってくることがなく、よりSinatra専用のエラー解決サービスが作れたら便利かなと思い作成しました。
**BilsonDoctor** がいつでも優しくフォローしてくれるから安心してものづくりしてみてください〜！
バグは成長のチャンス！

---

## 📬 ライセンス・連絡

- ライセンス: MIT  
- ご意見・質問・アイデアは GitHub Issue や Pull Request でぜひどうぞ📮

---

**Happy Hacking! 🐮💻**
