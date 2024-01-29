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

キー は「4」「5」「6」「+」 デ ナリマス

3
2
1
ドウゾ

]]
local message3 = [[

oO( …ふふ 素晴らしい
君らしい演奏 を聞けて嬉しいよ… )

どこからか、懐かしい声がきこえた気がした…



=============================
###      ##
## ##
#        ###      #####
####       ##     ##  ##
##        ##     ##  ##
##        ##     ##  ##
####      ####    ##  ##
=============================

制作 : kamera25
協力 : Global Game Jam 2024 瀬戸内会場 in 広島

                         
      .......    　  . .:: ::::::::               
    .............. :    .::  :::::::::.            
  ....          ....      :::::::::::::           
 ...           .   ....    ::::::::::::            
 ...         .      ...  :::::::-:::::::             
 ...       .          ...:::::::.     -::-        
  ...     ::         -:...::::::          .       
   ....   :::      :::::....::::         .  .      
      ....:::     ::::::::...::::       .   .....  
          .::   :::::::::::....:::     .       ... 
           :-   :::::::::::::...:::   .         .. 
           .:   :::::::::::::::...   :          ...
            ::  :::::::::::::::: ....         ... 
              ::-::::::::::::::    .............  
               ::::::::::::::::     .  .......      
                  ::::::::::::::::.               
                      :::::::::       
                      
                      
    遊んでくれてありがとう！ - Thank you for Playing!
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
それどころではない、先にマルウェアを見つけ出さなければ。

もしわからなければ ミシマ の 犯行メッセージ をもう一回聞くしかないな
> lua usb1:/04_game.lua <さっき入力したモールス信号>

]]

    PrintWithWaitTime(message1, 1)
end 

local function main()

    if not IsExistFile("malware.bin") and IsExistFile("05_ending.lua") then
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
