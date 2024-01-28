local firm = _RT_FIRM_REVISION
if firm == nil then
    -- PCで実行されている場合
    dofile("_yamaha_game_module.lua")
else
    --Yamahaルータで実行されている場合
    dofile("usb1:/_yamaha_game_module.lua")
end

-- ダミーのマルウェアファイルをフラッシュ内に生成する
local function makeMalware()

    local f = io.open("malware.bin", "w")
    if f == nil then
        print("すまない、トラブルが発生した。再度コマンドを実行してくれ")
        os.exit(1)
    end

    local malstr = [[
Hello! I am malware!

8p7zf44dibpeecf45e9xc34k295gigdrktk25jbjwnbi5ratamxg2ai6u2miuy4demsh9z85569y39yc3amjuf59c9c748e7bf9
sk5eb9tamyaymhepkg4sntgczhnbc6xfkwjyyf5k6sgh4uk897unszysjawx9rdc6r9mnfu4z5e4ru7m49xhhztezbubekwp89f
awiiwkzsx5e4kjk97uwh78spsiygxgdmwjd2aaammji34hcubicxierc5bak8r39k658ncdbtmi4rfhz2zyrwj2zahkst6ggpnh
ciei9e2gfyiy8uupmr8xy5m8z6jrh9si3wzcfg2uueuzjmk6n3yxkm4etzyt3j6iakt45fdkbwkjfswng66i66jt32muh2k9ub2
7mwxfyj4ak6kcj48khyazzwwt32partsexrtckbdb7s5yma2he3ekex8idb88ejk5u2sbkj2t8xzuyk4mi94g79zxt5spchgkf6

]]

    f:write(malstr)
    f:close()
end


local function validArgs()
   
    ------------
    -- ストーリーに関する処理
    ------------
    OutputSyslog( "info", "Malware has been detected. Remove it manually, it is in Flash.")
    OutputSyslog( "info", "After deletion, execute the command > lua 05_ending.lua")
    OutputSyslog( "info", "Not <lua usb1:/05_ending.lua>! I repeat, <usb1:/> is not necessary!")
    CopyFileUSBtoFlash( "usb1:/_yamaha_game_module.lua" )
    CopyFileUSBtoFlash( "usb1:/05_ending.lua" )
    makeMalware()

    -- ここまで --

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
    PrintWithWaitTime(message3, 3)

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
