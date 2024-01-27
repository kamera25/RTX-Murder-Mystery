

-- wait - 指定秒数待機します
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
