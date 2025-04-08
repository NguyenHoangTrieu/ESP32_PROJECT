$proc = Start-Process "idf.py" -ArgumentList "monitor -p COM9" -NoNewWindow -PassThru
Start-Sleep -Seconds 30
Stop-Process -Id $proc.Id
