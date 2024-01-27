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
よく見抜いてくれたね。なんかいだっただろう。素晴らしい。
このメッセージを見つけたということは 私のメッセージを見つけたということだな。

敵を欺くには 味方から。が基本だ。
すまない、これも犯人に悟られないようにするためだ。
]]
    local score = {
        {"B3", 1},
        {"B3", 1},
        {"E3", 2},
        {"B3", 1},
        {"B3", 1},
        {"E3", 2},
        {"B3", 1},
        {"B3", 1},
        {"E3", 1},
        {"B4", 2},
    }
    local message2 = [[
？…何か聞こえてきたな。
まぁ、もう君には鍵を伝えたから良い。
次の鍵がわかったら、以下で入力してくれ。

> lua 03_game.lua <鍵>
]]

    print("----------------------------")

    print(playerName .. " へ")
    PrintWithWaitTime(message1, 1)
    PlayYamahaPiano(score)
    print(" ")
    print(" ")
    PrintWithWaitTime(message2, 1)

    print("----------------------------")
end

local function invalidArgs()
   
    local message = [[
まだ鍵を見つけてない もしくは間違っているようだ。

次に進めないのなら さっきのダイニングメッセージを読んだらどうだ。
> lua 01_init_game.lua <あなたの名前>
    ]]

    PrintWithWaitTime(message, 1)
end 

local function main()
    if ( #arg == 1) and ( arg[1] == "34076") then
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
