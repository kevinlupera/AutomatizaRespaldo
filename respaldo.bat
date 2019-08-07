@echo on
::Kevin Lupera
::https://kevinlupera.github.io
::https://github.com/kevinlupera

:: Crea carpeta yyyyMMdd
for /F "tokens=1-4 delims=/ " %%A in ('date/t') do (
	set DateDay=%%B
	set DateMonth=%%A
	set DateYear=%%C
)
SET ruta=%~dp0
set CurrentDate=%DateMonth%%DateDay%%DateYear%
mkdir %ruta%\Respaldos_automatizados
mkdir %ruta%\Respaldos_automatizados\%CurrentDate%
::Abre putty y carga la sesión
>%ruta%\Respaldos_automatizados\%CurrentDate%\log%CurrentDate%.log (plink {nombre de la sesion de putty} -m %ruta%\commands.txt)
>%ruta%\Respaldos_automatizados\%CurrentDate%\logFilezilla%CurrentDate%.log (call %ruta%\automateFilezilla.bat)
echo Respaldo %CurrentDate% ejecutado exitosamente! 
echo Confirmar el respaldo.
&pause