$proc = Start-Process "idf.py" -ArgumentList "monitor -p COM9" -PassThru
$timeout = 30
$pid = $proc.Id

try {
    Wait-Process -Id $pid -Timeout $timeout
} catch {
    # Nếu quá timeout mà vẫn chạy, thì dừng lại
    Stop-Process -Id $pid -Force
}
