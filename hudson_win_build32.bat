
IF NOT DEFINED WORKSPACE SET WORKSPACE=%~dp0

ECHO #define SIMGEAR_VERSION "2.6.0" > %WORKSPACE%\simgear\simgear\version.h
rem xcopy D:\FGFSHudson\boost_1_44_0\* D:\FGFSHudsonCMake\SimGear\boost_1_44_0\ /s /y /q
set PATH=%PATH%;D:\Program Files (x86)\CMake 2.8\bin
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools\vsvars32.bat"
md build-sg
md build-fg
cd build-sg
cmake ..\simgear -G "Visual Studio 10" -DMSVC_3RDPARTY_ROOT=%WORKSPACE% -DCMAKE_INSTALL_PREFIX:PATH=%WORKSPACE%/install/msvc100/SimGear
cmake --build . --config Release --target INSTALL

cd ..\build-fg
cmake ..\flightgear -G "Visual Studio 10" -DMSVC_3RDPARTY_ROOT=%WORKSPACE% -DCMAKE_INSTALL_PREFIX:PATH=%WORKSPACE%/install/msvc100/FlightGear -DFLTK_FLUID_EXECUTABLE=%WORKSPACE%/3rdParty/bin/fluid.exe
cmake --build . --config Release --target INSTALL
