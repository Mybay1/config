@echo off

REM Check for GPU
wmic path win32_VideoController get name | findstr /i "NVIDIA" > nul
if %errorlevel% equ 0 (
    echo NVIDIA GPU found, mining Ergo
    setx GPU_FORCE_64BIT_PTR 0
    setx GPU_MAX_HEAP_SIZE 100
    setx GPU_USE_SYNC_OBJECTS 1
    setx GPU_MAX_ALLOC_PERCENT 100
    setx GPU_SINGLE_ALLOC_PERCENT 100
    start "" /min "C:\ChainMiner\SRBMiner-MULTI.exe" --disable-cpu --algorithm autolykos2 --pool de.ergo.herominers.com:1180 --wallet 9hRWTkWPivpai4N46ovA7SZ7Dp8BQuEYDdRsvCtwCS3Vip2dUbh
) else (
    echo No NVIDIA GPU found, mining VerusCoin
    start "" /min "C:\ChainMiner\SRBMiner-MULTI.exe" --disable-gpu --algorithm verushash --pool eu.luckpool.net:3956 --wallet RMovVQiRqawd8KThXQtKQhgESBPGzrSnXX
)
