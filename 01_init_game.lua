

-- wait - 指定秒数待機します
-- 引数 : 秒(seconds)
local function wait(seconds)
    -- ヤマハルータかどうか検知する。
    local firm = _RT_FIRM_REVISION

    -- PCで実行されている場合
    if firm == nil then
        local start = os.time()
        repeat until os.time() > start + seconds        
    else
    -- Yamahaルータで実行されている場合
        rt.sleep(seconds)
    end
end

-- テキストを指定秒数だけ遅らせます。
-- 引数 : str 表示される「改行を含んだ文字列」 
-- 引数 : waitSeconds 「表示を遅らせる秒数」
local function printWithWaitTime( str, waitSeconds)

    for line in str:gmatch("(.-)\n") do
        print(line)
        wait(waitSeconds)
    end
end

local function requirInputName()

    print [[
        --------------------------------------------------
        【ヤマハルータからの挑戦！ルーティングの背後に隠された殺意】
        --------------------------------------------------
        ]]

    wait(1)

    print [[
        この度は、このゲームを遊んでいただきありがとうございます。
        はじめに、あなたの名前を入力してください。

        コマンド入力「lua 01_init_game.lua <あなたの名前>」
        ]]
    wait(1)
end

local function startStory( username )
    
print ("----------------------------")

    local message = [[

危険だ… ルーティングの向こうに死の影が忍び寄る…。
Configを見直せ…ヤマハルータの中に秘められた何かが鍵だ。

悪意のあるハッカーが仲間を襲っている。私はもう… 助けられない。
だが、君なら… 君なら真実を見つけ、彼らを止められるはずだ。

ネットワークの闇を探り、真相を明らかにせよ。
ヤマハルータは全ての謎を知っている。


急げ…時はもう少しだけだ…

三島より
]]

print ("最高の同僚 ", username, "へ")
printWithWaitTime(message, 1)

print ("----------------------------")

end

local function registerPlayerName()

    local username = arg[1]

    print (username, " さんですね、こんにちは！")
    wait(1)
    print ("これから ", username, " さんには 同僚のネットワークエンジニアが殺された原因を調べてもらいます")
    print ("では…")
    wait(1)
    startStory( username )

    ------------
    -- ストーリー表示後の処理
    ------------
    -- description 100 "Takumi RTX1500 for Internet gateway"

end

function main()

    if #arg < 1 then
        requirInputName()  
        return
    else
        registerPlayerName()
    end
end

main()
