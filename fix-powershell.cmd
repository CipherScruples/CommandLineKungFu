@echo OFF
PowerShell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Bypass -Force -ErrorAction SilentlyContinue"
PowerShell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Enable-PsRemoting -SkipNetworkProfileCheck -Force -ErrorAction SilentlyContinue"
PowerShell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Set-WSManQuickConfig -SkipNetworkProfileCheck -Force -ErrorAction SilentlyContinue"