call C:\Users\MSI-VN\esp\esp-idf\export.bat
cd hello_world
rmdir /s /q build
mkdir build
cd build
cmake -G Ninja ..
ninja
ninja flash
set ESPPORT=COM9
set ESPBAUD=460800
ninja flash
set ESPBAUD=115200
powershell -Command "$proc = Start-Process 'idf.py' -ArgumentList '-p COM9 monitor' -NoNewWindow -PassThru; Start-Sleep -Seconds 30; Stop-Process -Id $proc.Id"