@echo on
::Kevin Lupera
::https://kevinlupera.github.io
::https://github.com/kevinlupera

:: Crea carpeta yyyyMMdd
for /F "tokens=1-3 delims=/ " %%A in ('date/t') do (
	set DateDay=%%B
	set DateMonth=%%A
	set DateYear=%%C
)
SET ruta=%~dp0
set CurrentDate=%DateMonth%%DateDay%%DateYear%
mkdir %ruta%\Respaldos_automatizados\%CurrentDate%
::Ruta del WinSCP
"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="%ruta%\Respaldos_automatizados\log\WinSCP.log" /ini=nul ^
  /command ^
    "open {sftp://host/del/servidor} -privatekey=""%ruta%\clave_privada.ppk"" -rawsettings Utf=1 ProxyPort=1" ^
	"stat {/ruta/de/el/proyecto}" ^
    "get {/ruta/de/el/respaldo/zip/ecommerce.zip} {%ruta%\Respaldos_automatizados\%CurrentDate%\}"  ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

echo %WINSCP_RESULT%