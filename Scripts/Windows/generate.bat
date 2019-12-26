set ROOT_DIR=%~dp0

cd %ROOT_DIR%

set SOURCE_DIR=%ROOT_DIR%/../../SampleProjectCPP
set BUILD_DIR_WIN32=%SOURCE_DIR%/build/Win32

rem create build directory for Win32
if not exist "%BUILD_DIR_WIN32%" mkdir "%BUILD_DIR_WIN32%"
cd "%BUILD_DIR_WIN32%"

rem clear CMake cache
del "CMakeCache.txt"

call cmake ^
-G "Visual Studio 15 2017" -T v141 ^
-DCMAKE_CONFIGURATION_TYPES="Debug;Release" ^
-DCMAKE_SYSTEM_VERSION=8.1 ^
"%SOURCE_DIR%"

set BUILD_DIR_X64=%SOURCE_DIR%/build/x64

rem create build directory for Win32
if not exist "%BUILD_DIR_X64%" mkdir "%BUILD_DIR_X64%"
cd "%BUILD_DIR_X64%"

rem clear CMake cache
del "CMakeCache.txt"

call cmake ^
-G "Visual Studio 15 2017 Win64" -T v141 ^
-DCMAKE_CONFIGURATION_TYPES="Debug;Release" ^
-DCMAKE_SYSTEM_VERSION=8.1 ^
"%SOURCE_DIR%"

pause