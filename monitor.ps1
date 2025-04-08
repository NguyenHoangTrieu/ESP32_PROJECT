# Cấu hình
$port = "COM9"
$baud = "115200"
$timeout = 30 # Thời gian chạy monitor (giây)

Write-Host "⚙️  Starting monitor on $port at $baud baud for $timeout seconds..."

# Khởi động monitor
$proc = Start-Process "idf.py" -ArgumentList "monitor -p $port -b $baud" -PassThru -NoNewWindow

# Đợi timeout
Start-Sleep -Seconds $timeout

# Nếu process vẫn còn, dừng lại
if (Get-Process -Id $proc.Id -ErrorAction SilentlyContinue) {
    Write-Host "⏱️ Timeout reached. Stopping monitor..."
    Stop-Process -Id $proc.Id -Force
} else {
    Write-Host "✅ Monitor exited before timeout."
}

Write-Host "📬 Monitor completed. Jenkins can now continue to post-processing (e.g., send email)."
