$job = Start-Job -ScriptBlock {
    ninja monitor
}

# Đợi 30 giây
Start-Sleep -Seconds 30

# Nếu job vẫn đang chạy, dừng lại
if (Get-Job -Id $job.Id | Where-Object { $_.State -eq "Running" }) {
    Stop-Job -Id $job.Id -Force
}

# Xoá job để giải phóng tài nguyên
Remove-Job -Id $job.Id