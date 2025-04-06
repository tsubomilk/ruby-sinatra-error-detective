require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'dotenv/load'   

get '/' do
  erb :index
end

post '/analyze' do
  @goal = params[:goal]
  @code = params[:code]
  @error = params[:error]
  @what_is_not_working = params[:what_is_not_working]
  @hypothesis = params[:hypothesis]

  prompt = <<~PROMPT
    あなたはRubyとSinatraを学ぶ中高生に教えている、やさしくて元気づけてくれる先生です。
    生徒は初心者なので、フレンドリーなタメ語で、わかりやすく教えてあげてください。
  
    - 出力は **Markdown形式** にしてください。
    - 各セクションは以下の見出しで始めてください。
    - **コードブロック（```）の使用OK**。必要なら例も入れてね。
    - 説明はなるべく端的に。長くなりすぎないように注意して。
    - フレンドリーなタメ口で  
    - 励ましの一言は、肯定的なコメント（長くても可）
    - コード例はシンプルに  
    - 最後にちょっとしたアドバイスを  
  
    ## 💪 励ましの一言
    ## 🧠 原因
    ## 🔧 解決策
    ## 💡 修正コード例
    ## 🌱 アドバイス
  
    ---
    ✅ やりたいこと：
    #{@goal}
  
    💻 現在のコード：
    #{@code}
  
    ⚠️ エラーメッセージ：
    #{@error}
  
    🤔 うまくいかないこと：
    #{@what_is_not_working}
  
    💭 自分が考えた原因：
    #{@hypothesis}
  PROMPT




  response = HTTParty.post(
    "https://api.anthropic.com/v1/messages",
    headers: {
      "Content-Type" => "application/json",
      "x-api-key" => ENV['CLAUDE_API_KEY'],
      "anthropic-version" => "2023-06-01"
    },
    body: {
      model: "claude-3-haiku-20240307",
      max_tokens: 1500,
      messages: [
        { role: "user", content: prompt }
      ]
    }.to_json
  )
  
  result = response.parsed_response
  response_text = result.dig("content", 0, "text") || result.dig("content") || result["content"]
  
    
  # 万一 response_text が nil のときに備える
  if response_text.nil? || response_text.strip.empty?
    @encourage_message = "AIからの診断がうまくできませんでした。もう一度お試しください。"
    @messages = []
  else
    # セクションごとに分ける（## タイトル で分割）
    sections = response_text.split(/^## /).reject(&:empty?)
  
    # 最初のセクションは「励まし」
    @encourage_message = sections[0].sub(/^💪 励ましの一言\s*\n?/, '').strip
  
    # 残りのセクションを順に対応
    titles = ["🧠 原因", "🔧 解決策", "💡 修正コード例", "🌱 アドバイス"]
  
    @messages = titles.each_with_index.map do |title, i|
      content = sections[i + 1] ? sections[i + 1].sub(/^#{title}\s*\n?/, '').strip : ""
      { title: title, content: content }
    end
  end


puts "===== CLAUDE response (raw) ====="
puts response.body
puts "================================"

erb :result

end

