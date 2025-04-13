::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcA2RPWq5OpET/+b34OuDsXEvccMbVaqVzqyaQA==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBJHTQWBAE+1EbsQ5+n//NakrkgcWqw2e4C7
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQIYLRpOWEShMG67CNU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCyHPXGuRpYQ7en1jw==
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE3EcxMg9HLA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBJHTQWBAES0A5EO4f7+00lmsEgcFOY6OLvJ27aPLOgc1m3hdIw5lllWncoCQh5Ae3I=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: Se o script for executado com o parâmetro "/limpar", roda limpeza direta
if /I "%~1"=="/limpar" goto limpar_temp

::=== CONFIGURAÇÃO INICIAL ===
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
title Heazt Clean 2025 - By Heazts
mode con: cols=90 lines=35
:: Cor padrão: fundo preto, texto ciano (0B)
color 0B

::=== VERIFICAÇÃO DE ADMIN ===
net session >nul 2>&1 || (
    echo %ESC%[91m[ERRO] Execute como Administrador!%ESC%[0m
    timeout 3 >nul
    exit
)

::=== ANIMAÇÃO DE INICIALIZAÇÃO (Barra laranja) ===
:animacao_inicial
cls
echo %ESC%[36mIniciando Heazt Clean 2025...%ESC%[0m
echo.
<nul set /p "=Carregando: ["
for /l %%i in (1,1,20) do (
    <nul set /p "=%ESC%[38;2;255;165;0m▓"
    ping -n 1 127.0.0.1 >nul
)
echo %ESC%[38;2;255;165;0m] Pronto!%ESC%[0m
timeout 1 >nul

::=== MENU PRINCIPAL ===
:menu
cls
echo %ESC%[36m╔════════════════════════════════════════════════╗%ESC%[0m
echo %ESC%[36m║                Heazt Clean 2025                ║%ESC%[0m
echo %ESC%[36m╠════════════════════════════════════════════════╣%ESC%[0m
echo %ESC%[36m║ 1. Limpar Arquivos Temporários                 ║%ESC%[0m
echo %ESC%[36m║ 2. Limpeza Profunda do Sistema                 ║%ESC%[0m
echo %ESC%[36m║ 3. Limpeza Total                               ║%ESC%[0m
echo %ESC%[36m║ 4. Exibir Informações do Sistema               ║%ESC%[0m
echo %ESC%[36m║ 5. Backup dos Arquivos Temporários             ║%ESC%[0m
echo %ESC%[36m║ 6. Agendar Limpeza                             ║%ESC%[0m
echo %ESC%[36m║ 7. Configurações                               ║%ESC%[0m
echo %ESC%[36m║ 8. GitHub Oficial                              ║%ESC%[0m
echo %ESC%[36m║ 9. Sair                                        ║%ESC%[0m
echo %ESC%[36m╚════════════════════════════════════════════════╝%ESC%[0m
echo.
set /p "op=Escolha [1-9]: "

if "%op%"=="1" goto limpar_temp
if "%op%"=="2" goto limpar_profundo
if "%op%"=="3" goto limpar_total
if "%op%"=="4" goto infosistema
if "%op%"=="5" goto backuptemp
if "%op%"=="6" goto agendalimpeza
if "%op%"=="7" goto configuracoes
if "%op%"=="8" goto github
if "%op%"=="9" goto sair

::=== FUNÇÕES PRINCIPAIS ===
:limpar_temp
call :limpar "%temp%" "TEMP do Usuário"
goto menu

:limpar_profundo
call :limpar "%windir%\Temp" "TEMP do Sistema"
call :limpar "%windir%\Prefetch" "Arquivos Prefetch"
goto menu

:limpar_total
call :limpar "%temp%" "TEMP do Usuário"
call :limpar "%windir%\Temp" "TEMP do Sistema"
call :limpar "%windir%\Prefetch" "Prefetch"
call :limpar "%localappdata%\Temp" "Cache Local"
goto menu

:infosistema
cls
echo %ESC%[36mExibindo Informações do Sistema...%ESC%[0m
echo.
systeminfo | more
echo.
pause
goto menu

:backuptemp
cls
echo %ESC%[36mIniciando backup dos arquivos temporários...%ESC%[0m
set "backup_dir=%userprofile%\HeaztTurboCleanBackup"
if not exist "%backup_dir%" mkdir "%backup_dir%"
echo.
echo Backup do TEMP do Usuário...
xcopy /E /I /Y "%temp%\*" "%backup_dir%\TEMP_Usuario\" >nul
echo Backup do TEMP do Sistema...
xcopy /E /I /Y "%windir%\Temp\*" "%backup_dir%\TEMP_Sistema\" >nul
echo.
echo %ESC%[36mBackup concluído em: %backup_dir%%ESC%[0m
pause
goto menu

:agendalimpeza
cls
echo %ESC%[36mAgendando Limpeza...%ESC%[0m
echo.
set /p "horario=Digite o horário de execução (HH:MM, 24h): "
:: Cria uma tarefa única que chama este script com o parâmetro "/limpar"
schtasks /create /tn "HeaztClean" /tr "\"%~f0\" /limpar" /sc once /st %horario% >nul
if %errorlevel%==0 (
    echo %ESC%[36mTarefa agendada com sucesso para %horario%!%ESC%[0m
) else (
    echo %ESC%[91mFalha ao agendar a limpeza.%ESC%[0m
)
pause
goto menu

:github
start "" "https://github.com/Heazts"
goto menu

:configuracoes
cls
echo %ESC%[36m╔════════════════════════════════════════════════╗%ESC%[0m
echo %ESC%[36m║              CONFIGURAÇÕES CLEAN               ║%ESC%[0m
echo %ESC%[36m╠════════════════════════════════════════════════╣%ESC%[0m
echo %ESC%[36m║ 1. Alterar Cores                               ║%ESC%[0m
echo %ESC%[36m║ 2. Modo Autodestrutivo                         ║%ESC%[0m
echo %ESC%[36m║ 3. Voltar                                      ║%ESC%[0m
echo %ESC%[36m╚════════════════════════════════════════════════╝%ESC%[0m
echo.
set /p "cfg=Opção: "
if "%cfg%"=="1" call :cores
if "%cfg%"=="2" call :autodestruicao
goto menu

::=== FUNÇÃO DE LIMPEZA COM BARRA DE CARREGAMENTO (Barra laranja) ===
:limpar
setlocal enabledelayedexpansion
set "pasta=%~1"
set "mensagem=%~2"

:: Conta total de itens (arquivos e pastas)
set total=0
for /r "%pasta%" %%f in (*) do ( set /a total+=1 )
for /d %%d in ("%pasta%\*") do ( set /a total+=1 )
if %total%==0 set total=1

echo %ESC%[36m[ %mensagem% ]%ESC%[0m
echo.
set count=0
set barSize=20

<nul set /p "=Carregando: ["
call :PrintProgressBar 0 %barSize%
for /r "%pasta%" %%f in (*) do (
    del /f /q "%%f" >nul 2>&1
    set /a count+=1
    call :UpdateProgressBar !count! !total! %barSize%
    ping -n 1 127.0.0.1 >nul
)
for /d %%d in ("%pasta%\*") do (
    rd /s /q "%%d" >nul 2>&1
    set /a count+=1
    call :UpdateProgressBar !count! !total! %barSize%
    ping -n 1 127.0.0.1 >nul
)
echo.
echo.
echo %ESC%[36m╠════════════════════════════════════════════════╗%ESC%[0m
echo %ESC%[36m║ Itens removidos: %count%                       ║%ESC%[0m
echo %ESC%[36m╚════════════════════════════════════════════════╝%ESC%[0m
timeout 2 >nul
endlocal
exit /b

:UpdateProgressBar
:: %1 = item atual, %2 = total, %3 = tamanho da barra
setlocal enabledelayedexpansion
set /a percent=(%1*100)/%2
set /a filled=(%1*%3)/%2
set "bar="
for /L %%i in (1,1,%3%) do (
    if %%i leq !filled! (
        set "bar=!bar!▓"
    ) else (
        set "bar=!bar!░"
    )
)
<nul set /p "= %ESC%[38;2;255;165;0mCarregando: [!bar!] !percent!%% %ESC%[36m`r"
endlocal & exit /b

:PrintProgressBar
:: Imprime a barra inicial preenchida com '░'
setlocal enabledelayedexpansion
set "initBar="
for /L %%i in (1,1,%2%) do (
    set "initBar=!initBar!░"
)
<nul set /p "= %ESC%[38;2;255;165;0m!initBar! ] %ESC%[36m"
echo.
endlocal & exit /b

::=== FUNÇÃO DE ALTERAÇÃO DE CORES (Com aviso se não funcionar) ===
:cores
cls
echo %ESC%[36mAtenção: Para que a alteração de cores funcione, seu terminal deve suportar códigos ANSI.%ESC%[0m
echo %ESC%[36mExemplo de cores: 0 (Preto), 1 (Azul), 2 (Verde), 3 (Ciano), 4 (Vermelho), 5 (Magenta), 6 (Amarelo), 7 (Branco).%ESC%[0m
echo.
set /p "cor=Digite o código desejado (ex: 0A): "
color %cor%
goto menu

::=== FUNÇÃO MODO AUTODESTRUTIVO (Tudo em VERMELHO) ===
:autodestruicao
cls
echo %ESC%[91m╔════════════════════════════════════════════════╗%ESC%[0m
echo %ESC%[91m║              MODO AUTODESTRUTIVO               ║%ESC%[0m
echo %ESC%[91m╠════════════════════════════════════════════════╣%ESC%[0m
echo %ESC%[91m║ 1. Ativar Proteção                             ║%ESC%[0m
echo %ESC%[91m║ 2. Desativar Proteção                          ║%ESC%[0m
echo %ESC%[91m╚════════════════════════════════════════════════╝%ESC%[0m
echo.
set /p "opt=Opção: "
if "%opt%"=="1" (
    set /p "confirma=%ESC%[91mDigite 'SIM' para confirmar: %ESC%[0m"
    if /I "%confirma%"=="SIM" (
        echo set "original_size=%~z0" > config.dat
        echo %ESC%[91mProteção ativada!%ESC%[0m
    ) else (
        echo %ESC%[91mOperação cancelada.%ESC%[0m
    )
) else if "%opt%"=="2" (
    del config.dat 2>nul
    echo %ESC%[91mProteção desativada!%ESC%[0m
)
timeout 2 >nul
goto menu

::=== FUNÇÃO DE SAÍDA COM COPY (Heazt - 2025) e animação de despedida ===
:sair
cls
echo.
echo %ESC%[36mObrigado por usar o Heazt Clean 2025!%ESC%[0m
echo.
for /L %%i in (1,1,3) do (
    echo %ESC%[36m                  Heazt - 2025                  %ESC%[0m
    timeout 1 >nul
)
echo.
pause >nul
exit
