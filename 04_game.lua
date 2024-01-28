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
素晴らしい。
素晴らしい…！君は素晴らしいよ。
]]
    local message2 = [[
遂に、遂に全てが揃った。
君が入れた鍵は、このヤマハルータに仕組んだ

「マルウェアを起動するため」のものだったのだよ。

優秀な君へ、僕はいつも憎んでいた。
この会社への恨み、つら味を発散するためにね。
]]
    local message3 = [[
アハッ！
ハハっ！
ハっ！

これから実行する！じゃあな！。
]]

    print("----------------------------")

    PrintWithWaitTime(message1, 1)
    print(playerName .. " 君")
    print(" ")
    print(" ")
    PrintWithWaitTime(message2, 3)

    print("----------------------------")

    print("oO( どうやら、マルウェアを止めなければならないらしい。どこかに記録されていないだろうか。 )")
end

local function invalidArgs()
   
    local playerName = GetPlayerName()
    local message1 = [[
まだ鍵を見つけてない もしくは間違っているようだ。
]]

local message2 = [[
 は、前側を向くのが良いところだろ？

> lua usb1:/03_game.lua <さっき入力した数>
]]

    PrintWithWaitTime(message1, 1)
    print(playerName)
    PrintWithWaitTime(message2, 1)
end 

local function main()
    if ( #arg == 1) and ( arg[1] == "NET") then
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
