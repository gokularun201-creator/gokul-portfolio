@echo off
setlocal EnableDelayedExpansion
title [GOKUL.R] Portfolio Auto Launcher
color 0A
cls

echo ================================================================
echo    GOKUL.R - CYBERSECURITY PORTFOLIO AUTO LAUNCHER
echo ================================================================
echo.

set "TARGET_DIR=%USERPROFILE%\Desktop\gokul-portfolio"
set "LOCAL_HTML=%~dp0index.html"

:: 1. Create directory
if not exist "%TARGET_DIR%" (
    echo [*] Creating portfolio directory at: %TARGET_DIR%
    mkdir "%TARGET_DIR%"
)

:: 2. Ensure index.html is present
if exist "%LOCAL_HTML%" (
    echo [*] Copying index.html to %TARGET_DIR%...
    copy /Y "%LOCAL_HTML%" "%TARGET_DIR%\index.html" >nul
) else (
    echo [*] Downloading portfolio from GitHub...
    powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gokularun201-creator/gokul-portfolio/main/index.html' -OutFile '%TARGET_DIR%\index.html' -UseBasicParsing"
)

if not exist "%TARGET_DIR%\index.html" (
    echo [!] Error: index.html could not be loaded.
    pause
    exit /b 1
)

echo [+] Portfolio files ready!
echo.

:: 3. Find and launch VS Code
echo [*] Launching Visual Studio Code...
set "VSCODE_CMD="

where code >nul 2>&1
if !ERRORLEVEL! EQU 0 (
    set "VSCODE_CMD=code"
) else if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd" (
    set "VSCODE_CMD=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
) else if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" (
    set "VSCODE_CMD=%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
) else if exist "%ProgramFiles%\Microsoft VS Code\bin\code.cmd" (
    set "VSCODE_CMD=%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
) else if exist "%ProgramFiles%\Microsoft VS Code\Code.exe" (
    set "VSCODE_CMD=%ProgramFiles%\Microsoft VS Code\Code.exe"
)

if defined VSCODE_CMD (
    start "" "!VSCODE_CMD!" "%TARGET_DIR%" "%TARGET_DIR%\index.html"
    echo [+] VS Code launched successfully with your project!
) else (
    echo [!] VS Code not detected. Opening with default editor...
    start notepad "%TARGET_DIR%\index.html"
)
echo.

:: 4. Start Localhost Server and open in Chrome / Browser
echo [*] Starting local HTTP server on port 8080...
cd /d "%TARGET_DIR%"

where python >nul 2>&1
if !ERRORLEVEL! EQU 0 (
    echo [+] Python detected! Launching server at http://localhost:8080
    start "" "http://localhost:8080"
    echo.
    echo ================================================================
    echo  SERVER IS RUNNING ON http://localhost:8080
    echo  Press Ctrl+C in this window to stop the server when done.
    echo ================================================================
    echo.
    python -m http.server 8080
    goto :done
)

where py >nul 2>&1
if !ERRORLEVEL! EQU 0 (
    echo [+] Python launcher detected! Launching server at http://localhost:8080
    start "" "http://localhost:8080"
    echo.
    echo ================================================================
    echo  SERVER IS RUNNING ON http://localhost:8080
    echo  Press Ctrl+C in this window to stop the server when done.
    echo ================================================================
    echo.
    py -m http.server 8080
    goto :done
)

:: If Python is not installed, use PowerShell embedded lightweight webserver!
echo [!] Python not found. Starting lightweight PowerShell HTTP server...
start "" "http://localhost:8080"
echo.
echo ================================================================
echo  SERVER IS RUNNING ON http://localhost:8080
echo  Press Ctrl+C in this window to stop the server when done.
echo ================================================================
echo.

powershell -NoProfile -Command ^
    "$listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8080/'); $listener.Start(); Write-Host '[+] Server running on http://localhost:8080/ (PowerShell)'; while ($listener.IsListening) { $ctx = $listener.GetContext(); $req = $ctx.Request; $res = $ctx.Response; $path = (Get-Location).Path + ($req.Url.LocalPath.Replace('/', '\')); if (Test-Path -PathType Leaf $path) { $bytes = [System.IO.File]::ReadAllBytes($path); $res.ContentLength64 = $bytes.Length; if ($path.EndsWith('.html')) { $res.ContentType = 'text/html' } elseif ($path.EndsWith('.css')) { $res.ContentType = 'text/css' } elseif ($path.EndsWith('.js')) { $res.ContentType = 'application/javascript' }; $res.OutputStream.Write($bytes, 0, $bytes.Length); } else { $res.StatusCode = 404; $buf = [System.Text.Encoding]::UTF8.GetBytes('File not found'); $res.OutputStream.Write($buf, 0, $buf.Length); } $res.OutputStream.Close(); }"

:done
pause
