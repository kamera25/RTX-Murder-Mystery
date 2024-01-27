local firm = _RT_FIRM_REVISION
if firm == nil then
    -- PCで実行されている場合
    dofile("_yamaha_game_module.lua")
else
    --Yamahaルータで実行されている場合
    dofile("usb1:/_yamaha_game_module.lua")
end


local function requireInputName()
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

local function startStory(username)
    print("----------------------------")

    local message = [[

危険だ… ルーティングの向こうに死の影が忍び寄る…。
Configを見直せ…ヤマハルータの中に秘められた鍵を見つけだせ。

悪意のあるクラッカーが仲間を襲いにくる。私はもう…助からない。
だが、君なら… 君なら真実を見つけ、彼らを止められるはずだ。

ネットワークの闇を探り、真相を明らかにせよ。
ヤマハルータは全ての謎を知っている。


急げ…残された時間はもうわずかだ…

三島より
]]

    print("最高の同僚 ", username, "へ")
    printWithWaitTime(message, 1)

    print("----------------------------")
end

local function registerPlayerName()
    local username = arg[1]

    print(username, " さんですね、こんにちは！")
    wait(1)
    print("これから ", username, " さんには 同僚のネットワークエンジニアが殺された原因を調べてもらいます")
    print("では…")
    wait(1)
    startStory(username)

    ------------
    -- ストーリー表示後の処理
    ------------
    writeConfig( [[description 100 "RUN < lua 02_game.lua 34076 >"]] )
    setPlayerName(username)
end

function main()
    if #arg < 1 then
        requireInputName()
        return
    else
        registerPlayerName()
        --[[local success, errorMessage = pcall(registerPlayerName)

        if not success then
            print("!!! プレイヤーによって ゲームが中断されました !!!")
            print("!!! ゲームを続行するには、再度処理を実施してください !!!")
        end]]
    end
end

main()
