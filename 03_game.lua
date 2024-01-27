local firm = _RT_FIRM_REVISION
if firm == nil then
    -- PCで実行されている場合
    dofile("_yamaha_game_module.lua")
else
    --Yamahaルータで実行されている場合
    dofile("usb1:/_yamaha_game_module.lua")
end



local function validArgs()
   
    local playerName = GetPlayerName()
    local message1 = [[
君は耳も良いのだな。聞き分けられるのは素晴らしい。
前を向いて 歩けるのはすばらしいな。
    
]]
    local ledData = {
        {"ON",  2}, -- N
        {"OFF", 1},
        {"ON",  1},

        {"OFF", 3},

        {"ON",  1}, -- E

        {"OFF", 3},

        {"ON",  2}, -- T
    }
    local message2 = [[

…鍵はわかったかい？前を向いてみるんだよ。
ヒントをあげよう。

「・ー」　 最初の文字を示す
「ーー・・」 最後の文字を示す
「ーーーーー」　何も無い意味を示す

インターネットをつかってもよいぞ。
…これは 昔 ではあるがな。

> lua 04_game.lua <鍵>
]]

    print("----------------------------")

    print(playerName .. " へ")
    PrintWithWaitTime(message1, 1)
    ControlLED(ledData)
    print(" ")
    print(" ")
    PrintWithWaitTime(message2, 1)

    print("----------------------------")
end

local function invalidArgs()
   
    local message = [[
まだ鍵を見つけてない もしくは間違っているようだ。

次に進めないのなら さっきの ダイニングメッセージ と レクイレム を聞いたらどうだ。
> lua usb1:/02_init_game.lua <あなたの名前>

]]

    PrintWithWaitTime(message, 1)
end 

local function main()
    if ( #arg == 1) and ( arg[1] == "4") then
        local success, errorMessage = pcall(validArgs)

        if not success then
            print("!!! プレイヤーによって ゲームが中断されました !!!")
            print("!!! ゲームを続行するには、再度処理を実施してください !!!")
        end
    else
        invalidArgs()
    end
end

main()
