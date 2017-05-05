@echo off

For /D %%D in ("%cd%\..\elpa\irony-2*") Do Set "Dir=%%~fD\server"

md build
cd build
echo "Compiling irony-server.exe"
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC/vcvarsall.bat" amd64
cmake -G "Visual Studio 15 Win64" %Dir%
cmake --build . --use-stderr --config Release
echo "Copy files..."
xcopy /S /Y bin\Release\irony-server.exe ..\bin
cd ..
rmdir /S /Q build
pause
