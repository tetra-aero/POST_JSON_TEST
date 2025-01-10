# ターゲットのNode-REDサーバーURL
$uri = "http://192.168.0.21:1880/json-data"

# カウンターの初期化
$counter1 = 1
$counter2 = 1

# 無限ループ
while ($true) {
    # JSONメッセージを作成
    $json = @{
        parameter1 = $counter1
        parameter2 = $counter2
    } | ConvertTo-Json -Depth 10

    # HTTP POSTリクエストでJSONを送信
    try {
        $response = Invoke-RestMethod -Uri $uri -Method POST -Body $json -ContentType "application/json"
        Write-Host "Sent: $json"
        Write-Host "Response: $response"
    } catch {
        Write-Host "Error sending JSON: $_"
    }

    # カウンターをインクリメント（1～100）
    $counter1++
    $counter2++

    if ($counter1 -gt 100) { $counter1 = 1 }
    if ($counter2 -gt 100) { $counter2 = 1 }

    # 100ms秒待機
    Start-Sleep -Milliseconds 100
}

# Power shellからの実行コマンド
# PowerShell -ExecutionPolicy RemoteSigned .\IncrementJsonSend.ps1
