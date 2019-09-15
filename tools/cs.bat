rem @echo off
REM cs.bat
REM summary: Collects everything for a OOTyW_en-GB release
REM          and puts it into localized setup directories to be zipped.
REM author: Peter Triesberger
REM see: https://github.com/peter88213/OOTyW_en-GB
REM license: The MIT License (https://opensource.org/licenses/mit-license.php)
REM copyright: (c) 2019, Peter Triesberger

set _release=2.0.0

set _project=OOTyW_en-GB

set _root=..

rem ********************************************************
rem English/international release
rem ********************************************************

rem --------------------------------------------------------
rem Set up directory structure
rem --------------------------------------------------------

set _source=%_root%\
set _target=%_root%\build\OOTyW_en-GB_v%_release%

mkdir %_target%
del /s /q %_target%

mkdir %_target%\program
del /s /q %_target%\program

rem mkdir %_target%\add-on
rem del /s /q %_target%\add-on
rem copy %_source%\add-on\*.* %_target%\add-on\

rem --------------------------------------------------------
rem Generate english README file with release info
rem --------------------------------------------------------

echo # OOTyW_en-GB - OOTyW language pack (en-GB) v%_release%>%_target%\README.txt
echo For further information see https://github.com/peter88213/OOTyW/wiki/>>%_target%\README.txt

rem --------------------------------------------------------
rem Copy language dependent release items 
rem --------------------------------------------------------

set _file=%_root%\tools\Install.bat
set _dest=%_target%\
call :copyFile

set _file=%_root%\tools\Uninstall.bat
set _dest=%_target%\
call :copyFile

set _file=%_root%\oxt\OOTyW_en-GB-%_release%.oxt
set _dest=%_target%\program\
call :copyFile

set _file=%_root%\oxt\OOTyW_en-GB-A-%_release%.oxt
set _dest=%_target%\program\
call :copyFile

set _file=%_root%\oxt\OOTyW_en-GB-L-%_release%.oxt
set _dest=%_target%\program\
call :copyFile

set _file=%_root%\LICENSE
set _dest=%_target%\
call :copyFile

set _file=%_source%\ott\yWriter.ott
set _dest=%_target%\program\
call :copyFile

set _file=%_source%\ott\CustomizeTemplate.md
set _dest=%_target%\
call :copyFile

exit /b


:copyFile

rem --------------------------------------------------------
rem Copy a file
rem --------------------------------------------------------

if not exist %_file% goto error
copy /y  %_file% %_dest%
exit /b


:error

rmdir /s /q %_target%
echo ERROR: %_file% does not exist!
pause
exit

:end