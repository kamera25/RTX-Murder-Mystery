-----------------------------------------------
-- ヤマハルータ向け、ゲーム制作モジュール
-----------------------------------------------

-- 異常終了した事を通知して、プログラムを強制終了します。
local function exception()
    local message = [[
        想定されていない問題が発生しました。ゲームを中断します
        ※再度、同じプログラムを実行してください。
    ]]
    print (message)
    os.exit(1)
end

-- 指定秒数待機します
-- 引数 : 秒(seconds)
function wait(seconds)
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
function printWithWaitTime( str, waitSeconds)

    for line in str:gmatch("(.-)\n") do
        print(line)
        wait(waitSeconds)
    end
end

-- Configに書き込みを行います
-- PCで実行されている場合、同じファイル配下のテキストに書き込みます
function writeConfig( str )
    -- ヤマハルータかどうか検知する。
    local firm = _RT_FIRM_REVISION

    -- PCで実行されている場合
    if firm == nil then
        local f = io.open('conf.txt', 'w')
        f:write(str)
        f:close()
    else
    -- Yamahaルータで実行されている場合
        rtn, str = rt.command(cmd)
        if (not rtn) or (not str) then
          exception()
        end
    end

end
