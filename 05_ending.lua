dofile("_yamaha_game_module.lua") -- 最後だけは、ヤマハのFlashに書き込みを行う


local function validArgs()
   

    local message1 = [[
おれ おレ… オレ は

・
・
・

コンニチハ
ワタシハ ヤマハルータ RTX1210 デス

カレ ハ アナタ ヲ ニクンデ イマシタ…
アナタ…
]]
local message2 = [[
ヲ フカク ニクンデ イマシタ
    
サイゴニ アナタ ノ キーボードデ
カレ ヘノ レクイレム ヲ 演奏 シテアゲテクダサイ…
10秒間

3
2
1

]]
local message3 = [[
ふふ 素晴らしい
君らしい演奏 を聞けて嬉しいよ…

###      ##
## ##
#        ###      #####
####       ##     ##  ##
##        ##     ##  ##
##        ##     ##  ##
####      ####    ##  ##

遊んでくれてありがとう！

]]

    print("----------------------------")

    -- print(playerName .. " 君")
    print(" ")
    print(" ")
    PrintWithWaitTime(message1, 1)
    -- print(playerName)
    PrintWithWaitTime(message2, 1)

    PlayYamahaPiano(10)

    PrintWithWaitTime(message3, 1)

    print("----------------------------")

end

local function invalidArgs()
   
    -- local playerName = GetPlayerName()
    local message1 = [[
まだ完全にミッションをクリアしていないようだ。
もしわからなければ ミシマ の 犯行メッセージ を聞くしかないな

> lua usb1:/04_game.lua <さっき入力したモールス信号>

録音開始(無音)

]]

    PrintWithWaitTime(message1, 1)
    local score = PlayYamahaPiano(5)
    PlayScoreByBuzzer(score)
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
