@echo off
title [GOKUL.R] Portfolio Auto-Installer
color 0A
cls

echo.
echo  ================================================================
echo   ___  ___  _  ___  _ _     ___
echo  / __^|/ _ \^| ^|/ / ^| ^| ^|   ^| _ \
echo  ^| (_ ^| (_) ^| ' ^<^| ^|_^| ^|__ ^|   /
echo   \___^|\___/^|_^|\_\\___/^|____^|^|_^|_\
echo.
echo   CYBERSECURITY PORTFOLIO - AUTO INSTALLER
echo  ================================================================
echo.
echo  [*] This script will:
echo      1. Create the portfolio project folder
echo      2. Write the complete website code
echo      3. Open it in VS Code
echo      4. Launch a local server + open in browser
echo.
echo  ================================================================
echo.
pause

:: ─────────────────────────────────────────────
:: SET VARIABLES
:: ─────────────────────────────────────────────
set "PROJECT_DIR=%USERPROFILE%\Desktop\gokul-portfolio"
set "HTML_FILE=%PROJECT_DIR%\index.html"

:: ─────────────────────────────────────────────
:: CREATE PROJECT FOLDER
:: ─────────────────────────────────────────────
echo.
echo  [1/5] Creating project folder...
if exist "%PROJECT_DIR%" (
    echo  [!] Folder already exists. Overwriting files...
) else (
    mkdir "%PROJECT_DIR%"
)
echo  [+] Folder: %PROJECT_DIR%
echo.

:: ─────────────────────────────────────────────
:: WRITE THE COMPLETE HTML FILE
:: ─────────────────────────────────────────────
echo  [2/5] Writing portfolio code...

(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>Gokul.R ^| Cybersecurity Enthusiast ^& Developer^</title^>
echo     ^<style^>
echo         :root {
echo             --primary: #00ff41;
echo             --primary-dim: #00cc33;
echo             --secondary: #00e5ff;
echo             --accent: #ff0055;
echo             --bg-dark: #0a0a0f;
echo             --bg-card: #0d1117;
echo             --bg-card-hover: #161b22;
echo             --text: #c9d1d9;
echo             --text-dim: #8b949e;
echo             --border: #30363d;
echo             --glow-green: 0 0 10px #00ff4180, 0 0 40px #00ff4120;
echo             --glow-cyan: 0 0 10px #00e5ff80, 0 0 40px #00e5ff20;
echo             --font-mono: 'Courier New', monospace;
echo             --font-sans: 'Segoe UI', system-ui, sans-serif;
echo         }
echo         *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
echo         html { scroll-behavior: smooth; scrollbar-width: thin; scrollbar-color: var(--primary-dim^) var(--bg-dark^); }
echo         ::-webkit-scrollbar { width: 6px; }
echo         ::-webkit-scrollbar-track { background: var(--bg-dark^); }
echo         ::-webkit-scrollbar-thumb { background: var(--primary-dim^); border-radius: 3px; }
echo         body { font-family: var(--font-sans^); background: var(--bg-dark^); color: var(--text^); overflow-x: hidden; line-height: 1.6; }
echo         #matrix-canvas { position: fixed; top: 0; left: 0; width: 100%%; height: 100%%; z-index: 0; opacity: 0.07; pointer-events: none; }
echo         .cursor-glow { position: fixed; width: 300px; height: 300px; border-radius: 50%%; background: radial-gradient(circle, rgba(0,255,65,0.06^) 0%%, transparent 70%%^); pointer-events: none; z-index: 1; transform: translate(-50%%, -50%%^); transition: opacity 0.3s; }
echo         .navbar { position: fixed; top: 0; width: 100%%; z-index: 1000; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center; background: rgba(10,10,15,0.85^); backdrop-filter: blur(20px^); border-bottom: 1px solid transparent; transition: all 0.3s ease; }
echo         .navbar.scrolled { border-bottom-color: var(--primary-dim^); box-shadow: 0 2px 20px rgba(0,255,65,0.1^); }
echo         .nav-logo { font-family: var(--font-mono^); font-size: 1.4rem; font-weight: 700; color: var(--primary^); text-decoration: none; }
echo         .nav-logo::before { content: '^> '; color: var(--secondary^); animation: blink 1s infinite; }
echo         @keyframes blink { 0%%, 100%% { opacity: 1; } 50%% { opacity: 0; } }
echo         .nav-links { display: flex; list-style: none; gap: 2rem; }
echo         .nav-links a { color: var(--text-dim^); text-decoration: none; font-family: var(--font-mono^); font-size: 0.85rem; letter-spacing: 1px; text-transform: uppercase; padding: 0.5rem 0; transition: color 0.3s; }
echo         .nav-links a::before { content: '[ '; color: var(--primary^); opacity: 0; transition: opacity 0.3s; }
echo         .nav-links a::after { content: ' ]'; color: var(--primary^); opacity: 0; transition: opacity 0.3s; }
echo         .nav-links a:hover { color: var(--primary^); }
echo         .nav-links a:hover::before, .nav-links a:hover::after { opacity: 1; }
echo         .hamburger { display: none; flex-direction: column; cursor: pointer; gap: 5px; }
echo         .hamburger span { width: 25px; height: 2px; background: var(--primary^); transition: all 0.3s; }
echo         .hero { min-height: 100vh; display: flex; align-items: center; justify-content: center; position: relative; z-index: 2; padding: 2rem; }
echo         .hero-content { text-align: center; max-width: 900px; }
echo         .hero-badge { display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.4rem 1.2rem; border: 1px solid var(--primary-dim^); border-radius: 50px; font-family: var(--font-mono^); font-size: 0.75rem; color: var(--primary^); margin-bottom: 2rem; background: rgba(0,255,65,0.05^); animation: fadeInUp 0.6s ease forwards; opacity: 0; }
echo         .hero-badge .dot { width: 6px; height: 6px; background: var(--primary^); border-radius: 50%%; animation: pulse-dot 2s infinite; }
echo         @keyframes pulse-dot { 0%%, 100%% { box-shadow: 0 0 0 0 rgba(0,255,65,0.7^); } 50%% { box-shadow: 0 0 0 6px rgba(0,255,65,0^); } }
echo         .hero-name { font-size: clamp(3rem, 8vw, 6rem^); font-weight: 800; line-height: 1.1; margin-bottom: 1rem; animation: fadeInUp 0.6s ease 0.2s forwards; opacity: 0; }
echo         .hero-name .first { color: #fff; display: block; }
echo         .hero-name .last { color: var(--primary^); text-shadow: var(--glow-green^); }
echo         .glitch { position: relative; }
echo         .glitch::before, .glitch::after { content: attr(data-text^); position: absolute; left: 0; top: 0; width: 100%%; overflow: hidden; }
echo         .glitch::before { animation: glitch-1 3s infinite linear alternate-reverse; clip-path: inset(0 0 80%% 0^); color: var(--secondary^); text-shadow: -2px 0 var(--accent^); }
echo         .glitch::after { animation: glitch-2 3s infinite linear alternate-reverse; clip-path: inset(80%% 0 0 0^); color: var(--accent^); text-shadow: 2px 0 var(--secondary^); }
echo         @keyframes glitch-1 { 0%%, 100%% { transform: translateX(0^); } 20%% { transform: translateX(-3px^); } 40%% { transform: translateX(3px^); } 60%% { transform: translateX(-1px^); } 80%% { transform: translateX(1px^); } }
echo         @keyframes glitch-2 { 0%%, 100%% { transform: translateX(0^); } 20%% { transform: translateX(3px^); } 40%% { transform: translateX(-3px^); } 60%% { transform: translateX(1px^); } 80%% { transform: translateX(-1px^); } }
echo         .hero-title { font-family: var(--font-mono^); font-size: clamp(1rem, 3vw, 1.5rem^); color: var(--secondary^); margin-bottom: 1.5rem; animation: fadeInUp 0.6s ease 0.4s forwards; opacity: 0; }
echo         .hero-title .typed-text { border-right: 2px solid var(--secondary^); padding-right: 4px; animation: cursor-blink 0.8s infinite; }
echo         @keyframes cursor-blink { 0%%, 100%% { border-color: var(--secondary^); } 50%% { border-color: transparent; } }
echo         .hero-desc { font-size: 1.1rem; color: var(--text-dim^); max-width: 600px; margin: 0 auto 2.5rem; animation: fadeInUp 0.6s ease 0.6s forwards; opacity: 0; }
echo         .hero-buttons { display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; animation: fadeInUp 0.6s ease 0.8s forwards; opacity: 0; }
echo         .btn-primary { padding: 0.8rem 2rem; background: var(--primary^); color: var(--bg-dark^); border: none; border-radius: 4px; font-family: var(--font-mono^); font-weight: 700; font-size: 0.9rem; cursor: pointer; text-decoration: none; transition: all 0.3s; text-transform: uppercase; letter-spacing: 1px; }
echo         .btn-primary:hover { box-shadow: var(--glow-green^); transform: translateY(-2px^); }
echo         .btn-outline { padding: 0.8rem 2rem; background: transparent; color: var(--primary^); border: 1px solid var(--primary-dim^); border-radius: 4px; font-family: var(--font-mono^); font-weight: 700; font-size: 0.9rem; cursor: pointer; text-decoration: none; transition: all 0.3s; text-transform: uppercase; letter-spacing: 1px; }
echo         .btn-outline:hover { background: rgba(0,255,65,0.1^); box-shadow: var(--glow-green^); transform: translateY(-2px^); }
echo         .scroll-indicator { position: absolute; bottom: 2rem; left: 50%%; transform: translateX(-50%%^); display: flex; flex-direction: column; align-items: center; gap: 0.5rem; animation: fadeInUp 0.6s ease 1s forwards, float 2s ease-in-out infinite; opacity: 0; }
echo         .scroll-indicator span { font-family: var(--font-mono^); font-size: 0.7rem; color: var(--text-dim^); letter-spacing: 2px; }
echo         .scroll-arrow { width: 20px; height: 20px; border-right: 2px solid var(--primary^); border-bottom: 2px solid var(--primary^); transform: rotate(45deg^); }
echo         @keyframes float { 0%%, 100%% { transform: translateX(-50%%^) translateY(0^); } 50%% { transform: translateX(-50%%^) translateY(10px^); } }
echo         @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px^); } to { opacity: 1; transform: translateY(0^); } }
echo         section { position: relative; z-index: 2; padding: 6rem 2rem; }
echo         .section-header { text-align: center; margin-bottom: 4rem; }
echo         .section-label { font-family: var(--font-mono^); font-size: 0.8rem; color: var(--primary^); letter-spacing: 3px; text-transform: uppercase; margin-bottom: 0.5rem; }
echo         .section-title { font-size: clamp(2rem, 5vw, 3rem^); font-weight: 800; color: #fff; }
echo         .section-line { width: 60px; height: 3px; background: linear-gradient(90deg, var(--primary^), var(--secondary^)^); margin: 1rem auto 0; border-radius: 2px; }
echo         .about-grid { max-width: 1100px; margin: 0 auto; display: grid; grid-template-columns: 1fr 1fr; gap: 4rem; align-items: center; }
echo         .about-terminal { background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; overflow: hidden; }
echo         .terminal-header { display: flex; align-items: center; gap: 8px; padding: 0.8rem 1rem; background: rgba(255,255,255,0.03^); border-bottom: 1px solid var(--border^); }
echo         .terminal-dot { width: 12px; height: 12px; border-radius: 50%%; }
echo         .terminal-dot.red { background: #ff5f57; }
echo         .terminal-dot.yellow { background: #febc2e; }
echo         .terminal-dot.green { background: #28c840; }
echo         .terminal-title { font-family: var(--font-mono^); font-size: 0.75rem; color: var(--text-dim^); margin-left: 0.5rem; }
echo         .terminal-body { padding: 1.5rem; font-family: var(--font-mono^); font-size: 0.85rem; line-height: 1.8; }
echo         .terminal-line { margin-bottom: 0.3rem; opacity: 0; animation: terminalFade 0.3s ease forwards; }
echo         .terminal-line .prompt { color: var(--primary^); }
echo         .terminal-line .command { color: var(--secondary^); }
echo         .terminal-line .output { color: var(--text-dim^); padding-left: 1rem; }
echo         .terminal-line .highlight { color: var(--primary^); }
echo         @keyframes terminalFade { from { opacity: 0; transform: translateX(-10px^); } to { opacity: 1; transform: translateX(0^); } }
echo         .about-text h3 { font-size: 1.8rem; color: #fff; margin-bottom: 1rem; }
echo         .about-text h3 span { color: var(--primary^); }
echo         .about-text p { color: var(--text-dim^); margin-bottom: 1rem; font-size: 1rem; }
echo         .about-stats { display: grid; grid-template-columns: repeat(3, 1fr^); gap: 1rem; margin-top: 2rem; }
echo         .stat-box { text-align: center; padding: 1rem; background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; transition: all 0.3s; }
echo         .stat-box:hover { border-color: var(--primary-dim^); box-shadow: var(--glow-green^); }
echo         .stat-number { font-family: var(--font-mono^); font-size: 1.8rem; font-weight: 700; color: var(--primary^); }
echo         .stat-label { font-size: 0.75rem; color: var(--text-dim^); text-transform: uppercase; letter-spacing: 1px; margin-top: 0.3rem; }
echo         .skills-container { max-width: 1100px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr^)^); gap: 2rem; }
echo         .skill-category { background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; padding: 2rem; transition: all 0.3s; position: relative; overflow: hidden; }
echo         .skill-category::before { content: ''; position: absolute; top: 0; left: 0; right: 0; height: 3px; background: linear-gradient(90deg, var(--primary^), var(--secondary^)^); opacity: 0; transition: opacity 0.3s; }
echo         .skill-category:hover { border-color: var(--primary-dim^); transform: translateY(-5px^); box-shadow: 0 10px 40px rgba(0,255,65,0.1^); }
echo         .skill-category:hover::before { opacity: 1; }
echo         .skill-icon { font-size: 2.5rem; margin-bottom: 1rem; }
echo         .skill-category h3 { font-family: var(--font-mono^); font-size: 1.1rem; color: var(--primary^); margin-bottom: 1.5rem; letter-spacing: 1px; }
echo         .skill-item { display: flex; align-items: center; justify-content: space-between; margin-bottom: 1.2rem; }
echo         .skill-info { display: flex; align-items: center; gap: 0.8rem; }
echo         .skill-info span { font-size: 0.9rem; color: var(--text^); }
echo         .skill-bar-bg { flex: 1; max-width: 120px; height: 4px; background: rgba(255,255,255,0.05^); border-radius: 2px; overflow: hidden; }
echo         .skill-bar-fill { height: 100%%; border-radius: 2px; background: linear-gradient(90deg, var(--primary^), var(--secondary^)^); width: 0%%; transition: width 1.5s ease; }
echo         .skill-percent { font-family: var(--font-mono^); font-size: 0.75rem; color: var(--primary^); min-width: 35px; text-align: right; }
echo         .projects-grid { max-width: 1100px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr^)^); gap: 2rem; }
echo         .project-card { background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; overflow: hidden; transition: all 0.4s; }
echo         .project-card:hover { border-color: var(--primary-dim^); transform: translateY(-8px^); box-shadow: 0 20px 60px rgba(0,255,65,0.1^); }
echo         .project-image { height: 200px; background: linear-gradient(135deg, var(--bg-card^) 0%%, rgba(0,255,65,0.05^) 100%%^); display: flex; align-items: center; justify-content: center; font-size: 4rem; border-bottom: 1px solid var(--border^); position: relative; overflow: hidden; }
echo         .project-image::after { content: ''; position: absolute; inset: 0; background: linear-gradient(45deg, transparent 40%%, rgba(0,255,65,0.03^) 50%%, transparent 60%%^); background-size: 200%% 200%%; animation: shimmer 3s infinite; }
echo         @keyframes shimmer { 0%% { background-position: -200%% -200%%; } 100%% { background-position: 200%% 200%%; } }
echo         .project-content { padding: 1.5rem; }
echo         .project-tags { display: flex; gap: 0.5rem; margin-bottom: 1rem; flex-wrap: wrap; }
echo         .project-tag { font-family: var(--font-mono^); font-size: 0.65rem; padding: 0.2rem 0.6rem; border: 1px solid var(--primary-dim^); border-radius: 3px; color: var(--primary^); text-transform: uppercase; letter-spacing: 1px; }
echo         .project-tag.cyan { border-color: var(--secondary^); color: var(--secondary^); }
echo         .project-tag.red { border-color: var(--accent^); color: var(--accent^); }
echo         .project-content h3 { font-size: 1.2rem; color: #fff; margin-bottom: 0.5rem; }
echo         .project-content p { font-size: 0.9rem; color: var(--text-dim^); line-height: 1.6; }
echo         .project-links { display: flex; gap: 1rem; margin-top: 1rem; padding-top: 1rem; border-top: 1px solid var(--border^); }
echo         .project-link { font-family: var(--font-mono^); font-size: 0.8rem; color: var(--primary^); text-decoration: none; transition: all 0.3s; }
echo         .project-link:hover { color: var(--secondary^); text-shadow: var(--glow-cyan^); }
echo         .contact-container { max-width: 800px; margin: 0 auto; }
echo         .contact-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; }
echo         .contact-info h3 { font-size: 1.5rem; color: #fff; margin-bottom: 1rem; }
echo         .contact-info p { color: var(--text-dim^); margin-bottom: 2rem; }
echo         .contact-item { display: flex; align-items: center; gap: 1rem; margin-bottom: 1.5rem; padding: 1rem; background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; transition: all 0.3s; text-decoration: none; color: inherit; }
echo         .contact-item:hover { border-color: var(--primary-dim^); background: var(--bg-card-hover^); }
echo         .contact-icon { font-size: 1.5rem; width: 45px; height: 45px; display: flex; align-items: center; justify-content: center; background: rgba(0,255,65,0.1^); border-radius: 8px; }
echo         .contact-item-text h4 { font-family: var(--font-mono^); font-size: 0.8rem; color: var(--primary^); text-transform: uppercase; letter-spacing: 1px; }
echo         .contact-item-text p { color: var(--text^); font-size: 0.9rem; margin: 0; }
echo         .contact-form { display: flex; flex-direction: column; gap: 1rem; }
echo         .form-group input, .form-group textarea { width: 100%%; padding: 0.8rem 1rem; background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 4px; color: var(--text^); font-family: var(--font-mono^); font-size: 0.9rem; outline: none; transition: all 0.3s; }
echo         .form-group textarea { min-height: 120px; resize: vertical; }
echo         .form-group input:focus, .form-group textarea:focus { border-color: var(--primary^); box-shadow: 0 0 0 3px rgba(0,255,65,0.1^); }
echo         .form-group input::placeholder, .form-group textarea::placeholder { color: var(--text-dim^); }
echo         .footer { position: relative; z-index: 2; text-align: center; padding: 3rem 2rem; border-top: 1px solid var(--border^); }
echo         .footer-links { display: flex; justify-content: center; gap: 2rem; margin-bottom: 1rem; }
echo         .footer-links a { color: var(--text-dim^); font-size: 1.3rem; text-decoration: none; transition: all 0.3s; }
echo         .footer-links a:hover { color: var(--primary^); text-shadow: var(--glow-green^); }
echo         .footer p { font-family: var(--font-mono^); font-size: 0.75rem; color: var(--text-dim^); }
echo         .footer p span { color: var(--accent^); }
echo         .reveal { opacity: 0; transform: translateY(40px^); transition: all 0.8s cubic-bezier(0.16, 1, 0.3, 1^); }
echo         .reveal.visible { opacity: 1; transform: translateY(0^); }
echo         .particles { position: fixed; top: 0; left: 0; width: 100%%; height: 100%%; pointer-events: none; z-index: 1; }
echo         .particle { position: absolute; width: 2px; height: 2px; background: var(--primary^); border-radius: 50%%; opacity: 0; animation: particle-float linear infinite; }
echo         @keyframes particle-float { 0%% { opacity: 0; transform: translateY(100vh^) scale(0^); } 10%% { opacity: 0.6; } 90%% { opacity: 0.6; } 100%% { opacity: 0; transform: translateY(-100vh^) scale(1^); } }
echo         .timeline { max-width: 800px; margin: 0 auto; position: relative; }
echo         .timeline::before { content: ''; position: absolute; left: 20px; top: 0; bottom: 0; width: 2px; background: linear-gradient(to bottom, var(--primary^), var(--secondary^), var(--accent^)^); }
echo         .timeline-item { display: flex; gap: 2rem; margin-bottom: 3rem; padding-left: 20px; position: relative; opacity: 0; transform: translateX(-20px^); transition: all 0.6s ease; }
echo         .timeline-item.visible { opacity: 1; transform: translateX(0^); }
echo         .timeline-dot { position: absolute; left: 12px; top: 5px; width: 18px; height: 18px; border-radius: 50%%; background: var(--bg-dark^); border: 2px solid var(--primary^); z-index: 1; box-shadow: var(--glow-green^); }
echo         .timeline-content { background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; padding: 1.5rem; margin-left: 1.5rem; flex: 1; transition: all 0.3s; }
echo         .timeline-content:hover { border-color: var(--primary-dim^); }
echo         .timeline-date { font-family: var(--font-mono^); font-size: 0.75rem; color: var(--primary^); margin-bottom: 0.5rem; }
echo         .timeline-content h3 { font-size: 1.1rem; color: #fff; margin-bottom: 0.3rem; }
echo         .timeline-content h4 { font-size: 0.9rem; color: var(--secondary^); margin-bottom: 0.8rem; font-weight: 400; }
echo         .timeline-content p { color: var(--text-dim^); font-size: 0.9rem; }
echo         .certs-grid { max-width: 1100px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr^)^); gap: 1.5rem; }
echo         .cert-card { background: var(--bg-card^); border: 1px solid var(--border^); border-radius: 8px; padding: 1.5rem; text-align: center; transition: all 0.3s; }
echo         .cert-card:hover { border-color: var(--secondary^); transform: translateY(-5px^); box-shadow: 0 10px 30px rgba(0,229,255,0.1^); }
echo         .cert-icon { font-size: 2.5rem; margin-bottom: 1rem; }
echo         .cert-card h4 { color: #fff; font-size: 1rem; margin-bottom: 0.5rem; }
echo         .cert-card p { color: var(--text-dim^); font-size: 0.8rem; }
echo         .cert-status { display: inline-block; margin-top: 0.8rem; padding: 0.2rem 0.8rem; font-family: var(--font-mono^); font-size: 0.7rem; border-radius: 3px; text-transform: uppercase; letter-spacing: 1px; }
echo         .cert-status.active { background: rgba(0,255,65,0.1^); color: var(--primary^); border: 1px solid var(--primary-dim^); }
echo         .cert-status.learning { background: rgba(0,229,255,0.1^); color: var(--secondary^); border: 1px solid var(--secondary^); }
echo         @media (max-width: 768px^) {
echo             .hamburger { display: flex; }
echo             .nav-links { position: fixed; top: 0; right: -100%%; height: 100vh; width: 70%%; background: rgba(10,10,15,0.97^); backdrop-filter: blur(20px^); flex-direction: column; justify-content: center; align-items: center; transition: right 0.4s ease; border-left: 1px solid var(--border^); }
echo             .nav-links.active { right: 0; }
echo             .about-grid { grid-template-columns: 1fr; gap: 2rem; }
echo             .contact-grid { grid-template-columns: 1fr; }
echo         }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<canvas id="matrix-canvas"^>^</canvas^>
echo     ^<div class="cursor-glow" id="cursorGlow"^>^</div^>
echo     ^<div class="particles" id="particles"^>^</div^>
echo     ^<nav class="navbar" id="navbar"^>
echo         ^<a href="#" class="nav-logo"^>gokul.r^</a^>
echo         ^<ul class="nav-links" id="navLinks"^>
echo             ^<li^>^<a href="#about" onclick="closeNav()"^>About^</a^>^</li^>
echo             ^<li^>^<a href="#skills" onclick="closeNav()"^>Skills^</a^>^</li^>
echo             ^<li^>^<a href="#projects" onclick="closeNav()"^>Projects^</a^>^</li^>
echo             ^<li^>^<a href="#journey" onclick="closeNav()"^>Journey^</a^>^</li^>
echo             ^<li^>^<a href="#contact" onclick="closeNav()"^>Contact^</a^>^</li^>
echo         ^</ul^>
echo         ^<div class="hamburger" id="hamburger" onclick="toggleNav()"^>
echo             ^<span^>^</span^>^<span^>^</span^>^<span^>^</span^>
echo         ^</div^>
echo     ^</nav^>
echo     ^<section class="hero" id="hero"^>
echo         ^<div class="hero-content"^>
echo             ^<div class="hero-badge"^>^<span class="dot"^>^</span^> AVAILABLE FOR OPPORTUNITIES^</div^>
echo             ^<h1 class="hero-name"^>
echo                 ^<span class="first"^>I'm ^</span^>
echo                 ^<span class="last glitch" data-text="Gokul.R"^>Gokul.R^</span^>
echo             ^</h1^>
echo             ^<div class="hero-title"^>^<span class="typed-text" id="typedText"^>^</span^>^</div^>
echo             ^<p class="hero-desc"^>Passionate about breaking and building secure systems. I combine development skills with cybersecurity knowledge to create robust, secure solutions.^</p^>
echo             ^<div class="hero-buttons"^>
echo                 ^<a href="#projects" class="btn-primary"^>View My Work^</a^>
echo                 ^<a href="#contact" class="btn-outline"^>Get In Touch^</a^>
echo             ^</div^>
echo         ^</div^>
echo         ^<div class="scroll-indicator"^>^<span^>SCROLL^</span^>^<div class="scroll-arrow"^>^</div^>^</div^>
echo     ^</section^>
echo     ^<section id="about"^>
echo         ^<div class="section-header reveal"^>
echo             ^<p class="section-label"^>// who am i^</p^>
echo             ^<h2 class="section-title"^>About Me^</h2^>
echo             ^<div class="section-line"^>^</div^>
echo         ^</div^>
echo         ^<div class="about-grid"^>
echo             ^<div class="about-terminal reveal"^>
echo                 ^<div class="terminal-header"^>
echo                     ^<span class="terminal-dot red"^>^</span^>
echo                     ^<span class="terminal-dot yellow"^>^</span^>
echo                     ^<span class="terminal-dot green"^>^</span^>
echo                     ^<span class="terminal-title"^>gokul@kali:~^</span^>
echo                 ^</div^>
echo                 ^<div class="terminal-body"^>
echo                     ^<div class="terminal-line" style="animation-delay:0.1s"^>^<span class="prompt"^>gokul@kali:~$^</span^> ^<span class="command"^>whoami^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:0.3s"^>^<span class="output"^>Cybersecurity Enthusiast ^& Developer^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:0.6s"^>^<span class="prompt"^>gokul@kali:~$^</span^> ^<span class="command"^>cat /etc/skills^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:0.9s"^>^<span class="output"^>Python ^| Java ^| Linux ^| Networking^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:1.2s"^>^<span class="prompt"^>gokul@kali:~$^</span^> ^<span class="command"^>cat /etc/interests^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:1.5s"^>^<span class="output"^>Penetration Testing ^| Network Security^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:1.8s"^>^<span class="output"^>Ethical Hacking ^| Secure Development^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:2.1s"^>^<span class="prompt"^>gokul@kali:~$^</span^> ^<span class="command"^>echo $STATUS^</span^>^</div^>
echo                     ^<div class="terminal-line" style="animation-delay:2.4s"^>^<span class="output"^>^<span class="highlight"^>Ready to hack the future!^</span^>^</span^>^</div^>
echo                 ^</div^>
echo             ^</div^>
echo             ^<div class="about-text reveal"^>
echo                 ^<h3^>Hello, I'm ^<span^>Gokul.R^</span^>^</h3^>
echo                 ^<p^>I'm a cybersecurity enthusiast and developer who thrives at the intersection of code and security. With a strong foundation in Python and Java, coupled with deep knowledge of Linux systems and networking, I bring a unique perspective to building secure applications.^</p^>
echo                 ^<p^>My passion lies in understanding how systems work and how they can be exploited to create better, more secure software.^</p^>
echo                 ^<div class="about-stats"^>
echo                     ^<div class="stat-box"^>^<div class="stat-number" data-target="10"^>0^</div^>^<div class="stat-label"^>Projects^</div^>^</div^>
echo                     ^<div class="stat-box"^>^<div class="stat-number" data-target="5"^>0^</div^>^<div class="stat-label"^>Certifications^</div^>^</div^>
echo                     ^<div class="stat-box"^>^<div class="stat-number" data-target="500"^>0^</div^>^<div class="stat-label"^>Commits^</div^>^</div^>
echo                 ^</div^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo     ^<section id="skills"^>
echo         ^<div class="section-header reveal"^>
echo             ^<p class="section-label"^>// sudo apt-get skills^</p^>
echo             ^<h2 class="section-title"^>Technical Arsenal^</h2^>
echo             ^<div class="section-line"^>^</div^>
echo         ^</div^>
echo         ^<div class="skills-container"^>
echo             ^<div class="skill-category reveal"^>
echo                 ^<div class="skill-icon"^>💻^</div^>^<h3^>// Programming^</h3^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Python^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="90"^>^</div^>^</div^>^<span class="skill-percent"^>90%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Java^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="85"^>^</div^>^</div^>^<span class="skill-percent"^>85%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Bash Scripting^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="80"^>^</div^>^</div^>^<span class="skill-percent"^>80%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>SQL^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="75"^>^</div^>^</div^>^<span class="skill-percent"^>75%%^</span^>^</div^>
echo             ^</div^>
echo             ^<div class="skill-category reveal"^>
echo                 ^<div class="skill-icon"^>🔒^</div^>^<h3^>// Cybersecurity^</h3^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Penetration Testing^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="85"^>^</div^>^</div^>^<span class="skill-percent"^>85%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Network Security^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="88"^>^</div^>^</div^>^<span class="skill-percent"^>88%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Vulnerability Assessment^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="82"^>^</div^>^</div^>^<span class="skill-percent"^>82%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Ethical Hacking^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="80"^>^</div^>^</div^>^<span class="skill-percent"^>80%%^</span^>^</div^>
echo             ^</div^>
echo             ^<div class="skill-category reveal"^>
echo                 ^<div class="skill-icon"^>🐧^</div^>^<h3^>// Systems ^& Networks^</h3^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Linux Admin^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="92"^>^</div^>^</div^>^<span class="skill-percent"^>92%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Networking (TCP/IP^)^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="87"^>^</div^>^</div^>^<span class="skill-percent"^>87%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Wireshark / Nmap^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="83"^>^</div^>^</div^>^<span class="skill-percent"^>83%%^</span^>^</div^>
echo                 ^<div class="skill-item"^>^<div class="skill-info"^>^<span^>Docker / VM^</span^>^</div^>^<div class="skill-bar-bg"^>^<div class="skill-bar-fill" data-width="78"^>^</div^>^</div^>^<span class="skill-percent"^>78%%^</span^>^</div^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo     ^<section id="projects"^>
echo         ^<div class="section-header reveal"^>
echo             ^<p class="section-label"^>// git log --oneline^</p^>
echo             ^<h2 class="section-title"^>Featured Projects^</h2^>
echo             ^<div class="section-line"^>^</div^>
echo         ^</div^>
echo         ^<div class="projects-grid"^>
echo             ^<div class="project-card reveal"^>
echo                 ^<div class="project-image"^>🛡️^</div^>
echo                 ^<div class="project-content"^>
echo                     ^<div class="project-tags"^>^<span class="project-tag"^>Python^</span^>^<span class="project-tag cyan"^>Security^</span^>^</div^>
echo                     ^<h3^>Network Vulnerability Scanner^</h3^>
echo                     ^<p^>Custom Python tool that scans networks for open ports, identifies services, and detects known vulnerabilities.^</p^>
echo                     ^<div class="project-links"^>^<a href="#" class="project-link"^>View Code^</a^>^</div^>
echo                 ^</div^>
echo             ^</div^>
echo             ^<div class="project-card reveal"^>
echo                 ^<div class="project-image"^>🔐^</div^>
echo                 ^<div class="project-content"^>
echo                     ^<div class="project-tags"^>^<span class="project-tag"^>Java^</span^>^<span class="project-tag red"^>Encryption^</span^>^</div^>
echo                     ^<h3^>Secure File Vault^</h3^>
echo                     ^<p^>Java-based encrypted file storage with AES-256 encryption and multi-factor authentication.^</p^>
echo                     ^<div class="project-links"^>^<a href="#" class="project-link"^>View Code^</a^>^</div^>
echo                 ^</div^>
echo             ^</div^>
echo             ^<div class="project-card reveal"^>
echo                 ^<div class="project-image"^>📡^</div^>
echo                 ^<div class="project-content"^>
echo                     ^<div class="project-tags"^>^<span class="project-tag"^>Python^</span^>^<span class="project-tag cyan"^>Networking^</span^>^</div^>
echo                     ^<h3^>Packet Analyzer^</h3^>
echo                     ^<p^>Real-time network traffic analyzer with Scapy for packet capture, filtering, and anomaly detection.^</p^>
echo                     ^<div class="project-links"^>^<a href="#" class="project-link"^>View Code^</a^>^</div^>
echo                 ^</div^>
echo             ^</div^>
echo             ^<div class="project-card reveal"^>
echo                 ^<div class="project-image"^>🤖^</div^>
echo                 ^<div class="project-content"^>
echo                     ^<div class="project-tags"^>^<span class="project-tag"^>Python^</span^>^<span class="project-tag red"^>Linux^</span^>^</div^>
echo                     ^<h3^>System Hardening Toolkit^</h3^>
echo                     ^<p^>Automated Linux security hardening scripts for firewalls, services, and CIS benchmarks.^</p^>
echo                     ^<div class="project-links"^>^<a href="#" class="project-link"^>View Code^</a^>^</div^>
echo                 ^</div^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo     ^<section id="journey"^>
echo         ^<div class="section-header reveal"^>
echo             ^<p class="section-label"^>// history ^| grep milestones^</p^>
echo             ^<h2 class="section-title"^>My Journey^</h2^>
echo             ^<div class="section-line"^>^</div^>
echo         ^</div^>
echo         ^<div class="timeline"^>
echo             ^<div class="timeline-item"^>^<div class="timeline-dot"^>^</div^>^<div class="timeline-content"^>^<div class="timeline-date"^>PRESENT^</div^>^<h3^>Cybersecurity Researcher^</h3^>^<h4^>Independent / Freelance^</h4^>^<p^>Conducting vulnerability assessments and building security tools.^</p^>^</div^>^</div^>
echo             ^<div class="timeline-item"^>^<div class="timeline-dot"^>^</div^>^<div class="timeline-content"^>^<div class="timeline-date"^>LEARNING PHASE^</div^>^<h3^>Advanced Cybersecurity Studies^</h3^>^<h4^>Self-taught and Certified^</h4^>^<p^>Deep-dived into penetration testing, network security, and Linux admin.^</p^>^</div^>^</div^>
echo             ^<div class="timeline-item"^>^<div class="timeline-dot"^>^</div^>^<div class="timeline-content"^>^<div class="timeline-date"^>THE BEGINNING^</div^>^<h3^>Started Programming^</h3^>^<h4^>Python and Java^</h4^>^<p^>Began the coding journey and discovered the world of cybersecurity.^</p^>^</div^>^</div^>
echo         ^</div^>
echo     ^</section^>
echo     ^<section id="certifications"^>
echo         ^<div class="section-header reveal"^>
echo             ^<p class="section-label"^>// cat /etc/achievements^</p^>
echo             ^<h2 class="section-title"^>Certifications and Focus Areas^</h2^>
echo             ^<div class="section-line"^>^</div^>
echo         ^</div^>
echo         ^<div class="certs-grid"^>
echo             ^<div class="cert-card reveal"^>^<div class="cert-icon"^>🐍^</div^>^<h4^>Python Development^</h4^>^<p^>Advanced scripting, automation, and security tool development^</p^>^<span class="cert-status active"^>Active^</span^>^</div^>
echo             ^<div class="cert-card reveal"^>^<div class="cert-icon"^>☕^</div^>^<h4^>Java Programming^</h4^>^<p^>Object-oriented design and secure coding^</p^>^<span class="cert-status active"^>Active^</span^>^</div^>
echo             ^<div class="cert-card reveal"^>^<div class="cert-icon"^>🐧^</div^>^<h4^>Linux Administration^</h4^>^<p^>System administration and shell scripting^</p^>^<span class="cert-status active"^>Active^</span^>^</div^>
echo             ^<div class="cert-card reveal"^>^<div class="cert-icon"^>🌐^</div^>^<h4^>Network Security^</h4^>^<p^>TCP/IP, firewall config, IDS/IPS^</p^>^<span class="cert-status active"^>Active^</span^>^</div^>
echo             ^<div class="cert-card reveal"^>^<div class="cert-icon"^>🔓^</div^>^<h4^>Ethical Hacking^</h4^>^<p^>Penetration testing and exploit development^</p^>^<span class="cert-status learning"^>Learning^</span^>^</div^>
echo             ^<div class="cert-card reveal"^>^<div class="cert-icon"^>☁️^</div^>^<h4^>Cloud Security^</h4^>^<p^>AWS/Azure security and cloud hardening^</p^>^<span class="cert-status learning"^>Learning^</span^>^</div^>
echo         ^</div^>
echo     ^</section^>
echo     ^<section id="contact"^>
echo         ^<div class="section-header reveal"^>
echo             ^<p class="section-label"^>// ssh gokul@connect^</p^>
echo             ^<h2 class="section-title"^>Get In Touch^</h2^>
echo             ^<div class="section-line"^>^</div^>
echo         ^</div^>
echo         ^<div class="contact-container"^>
echo             ^<div class="contact-grid"^>
echo                 ^<div class="contact-info reveal"^>
echo                     ^<h3^>Let's Connect^</h3^>
echo                     ^<p^>Interested in working together? Drop me a message.^</p^>
echo                     ^<a class="contact-item" href="mailto:gokularun201@gmail.com"^>^<div class="contact-icon"^>📧^</div^>^<div class="contact-item-text"^>^<h4^>Email^</h4^>^<p^>gokularun201@gmail.com^</p^>^</div^>^</a^>
echo                     ^<a class="contact-item" href="https://github.com/gokularun201-creator" target="_blank"^>^<div class="contact-icon"^>🐙^</div^>^<div class="contact-item-text"^>^<h4^>GitHub^</h4^>^<p^>gokularun201-creator^</p^>^</div^>^</a^>
echo                     ^<a class="contact-item" href="https://linkedin.com/in/gokulr" target="_blank"^>^<div class="contact-icon"^>💼^</div^>^<div class="contact-item-text"^>^<h4^>LinkedIn^</h4^>^<p^>Gokul R^</p^>^</div^>^</a^>
echo                 ^</div^>
echo                 ^<form class="contact-form reveal" onsubmit="handleSubmit(event)"^>
echo                     ^<div class="form-group"^>^<input type="text" placeholder="// Your Name" required^>^</div^>
echo                     ^<div class="form-group"^>^<input type="email" placeholder="// Your Email" required^>^</div^>
echo                     ^<div class="form-group"^>^<input type="text" placeholder="// Subject"^>^</div^>
echo                     ^<div class="form-group"^>^<textarea placeholder="// Your Message" required^>^</textarea^>^</div^>
echo                     ^<button type="submit" class="btn-primary" style="width:100%%"^>Send Message^</button^>
echo                 ^</form^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo     ^<footer class="footer"^>
echo         ^<div class="footer-links"^>
echo             ^<a href="https://github.com/gokularun201-creator" target="_blank"^>🐙^</a^>
echo             ^<a href="mailto:gokularun201@gmail.com"^>📧^</a^>
echo             ^<a href="https://linkedin.com/in/gokulr" target="_blank"^>💼^</a^>
echo         ^</div^>
echo         ^<p^>2026 Gokul.R ^| Built with ❤ and lots of ☕^</p^>
echo     ^</footer^>
echo     ^<script^>
echo         const canvas=document.getElementById('matrix-canvas');const ctx=canvas.getContext('2d');function resizeCanvas(){canvas.width=window.innerWidth;canvas.height=window.innerHeight;}resizeCanvas();window.addEventListener('resize',resizeCanvas);const matrixChars='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$';const fontSize=14;const columns=Math.floor(canvas.width/fontSize);const drops=Array(columns).fill(1);function drawMatrix(){ctx.fillStyle='rgba(10,10,15,0.05)';ctx.fillRect(0,0,canvas.width,canvas.height);ctx.fillStyle='#00ff41';ctx.font=fontSize+'px monospace';for(let i=0;i^<drops.length;i++){const text=matrixChars[Math.floor(Math.random()*matrixChars.length)];ctx.fillText(text,i*fontSize,drops[i]*fontSize);if(drops[i]*fontSize^>canvas.height^&^&Math.random()^>0.975){drops[i]=0;}drops[i]++;}}setInterval(drawMatrix,50);
echo         const cursorGlow=document.getElementById('cursorGlow');document.addEventListener('mousemove',(e)=^>{cursorGlow.style.left=e.clientX+'px';cursorGlow.style.top=e.clientY+'px';});
echo         const titles=['Cybersecurity Enthusiast','Python Developer','Java Programmer','Linux Power User','Network Analyst','Ethical Hacker','Security Researcher'];let titleIndex=0;let charIndex=0;let isDeleting=false;const typedText=document.getElementById('typedText');function typeEffect(){const currentTitle=titles[titleIndex];if(isDeleting){typedText.textContent=currentTitle.substring(0,charIndex-1);charIndex--;}else{typedText.textContent=currentTitle.substring(0,charIndex+1);charIndex++;}let typeSpeed=isDeleting?50:100;if(!isDeleting^&^&charIndex===currentTitle.length){typeSpeed=2000;isDeleting=true;}else if(isDeleting^&^&charIndex===0){isDeleting=false;titleIndex=(titleIndex+1)%%titles.length;typeSpeed=500;}setTimeout(typeEffect,typeSpeed);}typeEffect();
echo         window.addEventListener('scroll',()=^>{const navbar=document.getElementById('navbar');if(window.scrollY^>50){navbar.classList.add('scrolled');}else{navbar.classList.remove('scrolled');}});
echo         function toggleNav(){document.getElementById('navLinks').classList.toggle('active');}function closeNav(){document.getElementById('navLinks').classList.remove('active');}
echo         const revealElements=document.querySelectorAll('.reveal');const timelineItems=document.querySelectorAll('.timeline-item');const observer=new IntersectionObserver((entries)=^>{entries.forEach(entry=^>{if(entry.isIntersecting){entry.target.classList.add('visible');}});},{threshold:0.1,rootMargin:'0px 0px -50px 0px'});revealElements.forEach(el=^>observer.observe(el));timelineItems.forEach(el=^>observer.observe(el));
echo         const skillBars=document.querySelectorAll('.skill-bar-fill');const skillObserver=new IntersectionObserver((entries)=^>{entries.forEach(entry=^>{if(entry.isIntersecting){const width=entry.target.getAttribute('data-width');entry.target.style.width=width+'%%';}});},{threshold:0.5});skillBars.forEach(bar=^>skillObserver.observe(bar));
echo         const counters=document.querySelectorAll('.stat-number');const counterObserver=new IntersectionObserver((entries)=^>{entries.forEach(entry=^>{if(entry.isIntersecting){const target=+entry.target.getAttribute('data-target');const increment=target/60;let current=0;const timer=setInterval(()=^>{current+=increment;if(current^>=target){entry.target.textContent=target+'+';clearInterval(timer);}else{entry.target.textContent=Math.ceil(current);}},30);counterObserver.unobserve(entry.target);}});},{threshold:0.5});counters.forEach(counter=^>counterObserver.observe(counter));
echo         const particlesContainer=document.getElementById('particles');for(let i=0;i^<30;i++){const particle=document.createElement('div');particle.classList.add('particle');particle.style.left=Math.random()*100+'%%';particle.style.animationDuration=(Math.random()*10+10)+'s';particle.style.animationDelay=Math.random()*10+'s';particle.style.width=(Math.random()*3+1)+'px';particle.style.height=particle.style.width;if(Math.random()^>0.5){particle.style.background='#00e5ff';}particlesContainer.appendChild(particle);}
echo         function handleSubmit(e){e.preventDefault();const btn=e.target.querySelector('button');btn.textContent='Message Sent!';btn.style.background='var(--secondary)';setTimeout(()=^>{btn.textContent='Send Message';btn.style.background='var(--primary)';e.target.reset();},3000);}
echo         document.querySelectorAll('a[href^="#"]').forEach(anchor=^>{anchor.addEventListener('click',function(e){e.preventDefault();const target=document.querySelector(this.getAttribute('href'));if(target){target.scrollIntoView({behavior:'smooth',block:'start'});}});});
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) > "%HTML_FILE%"

echo  [+] Code written successfully!
echo.

:: ─────────────────────────────────────────────
:: OPEN IN VS CODE
:: ─────────────────────────────────────────────
echo  [3/5] Opening in VS Code...
where code >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    code "%PROJECT_DIR%"
    timeout /t 2 >nul
    code "%HTML_FILE%"
    echo  [+] VS Code opened with project!
) else (
    echo  [!] VS Code not found. Trying Notepad...
    notepad "%HTML_FILE%"
)
echo.

:: ─────────────────────────────────────────────
:: START LOCALHOST SERVER
:: ─────────────────────────────────────────────
echo  [4/5] Starting localhost server...

:: Try Python first
where python >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo  [+] Using Python HTTP Server on port 8080
    echo  [+] Server: http://localhost:8080
    echo.
    echo  [5/5] Opening in Chrome...
    timeout /t 1 >nul
    start "" "http://localhost:8080"
    echo.
    echo  ================================================================
    echo   YOUR PORTFOLIO IS LIVE!
    echo.
    echo   VS Code:    OPEN with project files
    echo   Browser:    http://localhost:8080
    echo   GitHub:     https://gokularun201-creator.github.io/gokul-portfolio/
    echo   Folder:     %PROJECT_DIR%
    echo.
    echo   Press Ctrl+C to stop the server when done.
    echo  ================================================================
    echo.
    cd /d "%PROJECT_DIR%"
    python -m http.server 8080
    goto :end
)

:: Try Python3
where python3 >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo  [+] Using Python3 HTTP Server on port 8080
    start "" "http://localhost:8080"
    cd /d "%PROJECT_DIR%"
    python3 -m http.server 8080
    goto :end
)

:: Fallback: open HTML directly
echo  [!] Python not found. Opening HTML directly in browser...
start "" "%HTML_FILE%"
echo.
echo  ================================================================
echo   YOUR PORTFOLIO IS READY!
echo.
echo   VS Code:    OPEN with project files
echo   Browser:    Opened index.html directly
echo   GitHub:     https://gokularun201-creator.github.io/gokul-portfolio/
echo   Folder:     %PROJECT_DIR%
echo.
echo   TIP: Install Python to use localhost server
echo  ================================================================
echo.
pause

:end
