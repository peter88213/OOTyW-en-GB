@echo off
REM
REM summary: Installation script for the OOTyW_en-GB software package.
REM 
REM author: Peter Triesberger
REM see: https://github.com/peter88213/OOTyW_en-GB
REM license: The MIT License (https://opensource.org/licenses/mit-license.php)
REM copyright: (c) 2019, Peter Triesberger
REM 
REM note: This script is to be executed manually.
REM 
REM Preconditions:
REM * OpenOffice.org 3.x or Apache OpenOffice 4.x or LibreOffice 6.x is installed.
REM * OOTyW is installed.
REM 
REM Postconditions:
REM * OOTyW_en-GB is installed.

set _release=2.0.1

set _OpenOffice4_w64=c:\Program Files (x86)\OpenOffice 4
set _OpenOffice4_w32=c:\Program Files\OpenOffice 4
set _OpenOffice3_w64=c:\Program Files (x86)\OpenOffice.org 3
set _OpenOffice3_w32=c:\Program Files\OpenOffice.org 3
set _LibreOffice6_w64=c:\Program Files (x86)\LibreOffice
set _LibreOffice6_w32=c:\Program Files\LibreOffice

set _OpenOffice4_Userprofile=AppData\Roaming\OpenOffice\4\user
set _OpenOffice3_Userprofile=AppData\Roaming\OpenOffice.org\3\user
set _LibreOffice_Userprofile=AppData\Roaming\LibreOffice\4\user

echo -----------------------------------------------------------------
echo OOTyW (OpenOffice typography tools for yWriter users) v%_release%
echo Installing software package ...
rem Detect Combination of Windows and Office 
echo -----------------------------------------------------------------
if exist "%_OpenOffice4_w64%\program\swriter.exe" goto OpenOffice4-Win64
if exist "%_OpenOffice4_w32%\program\swriter.exe" goto OpenOffice4-Win32
if exist "%_OpenOffice3_w64%\program\swriter.exe" goto OpenOffice3-Win64
if exist "%_OpenOffice3_w32%\program\swriter.exe" goto OpenOffice3-Win32
if exist "%_LibreOffice6_w64%\program\swriter.exe" goto LibreOffice6-Win64
if exist "%_LibreOffice6_w32%\program\swriter.exe" goto LibreOffice6-Win32
echo ERROR: No supported version of OpenOffice/LibreOffice found!
echo Installation aborted.
goto end

:OpenOffice4-Win64
set _writer=%_OpenOffice4_w64%
set _user=%USERPROFILE%\%_OpenOffice4_Userprofile%
set _ext=OOTyW_en-GB-A-%_release%.oxt
echo OpenOffice 4.x - Windows (64 bit)
goto settings_done

:OpenOffice4-Win32
set _writer=%_OpenOffice4_w32%
set _user=%USERPROFILE%\%_OpenOffice4_Userprofile%
set _ext=OOTyW-A_en-GB-%_release%.oxt
echo OpenOffice 4.x - Windows (32 bit)
goto settings_done

:OpenOffice3-Win64
set _writer=%_OpenOffice3_w64%
set _user=%USERPROFILE%\%_OpenOffice3_Userprofile%
set _ext=OOTyW_en-GB-%_release%.oxt
echo OpenOffice 3.x - Windows (64 bit)
goto settings_done

:OpenOffice3-Win32
set _writer=%_OpenOffice3_w32%
set _user=%USERPROFILE%\%_OpenOffice3_Userprofile%
set _ext=OOTyW_en-GB-%_release%.oxt
echo OpenOffice 3.x - Windows (32 bit)
goto settings_done

:LibreOffice6-Win64
set _writer=%_LibreOffice6_w64%
set _user=%USERPROFILE%\%_LibreOffice_Userprofile%
set _ext=OOTyW_en-GB-L-%_release%.oxt
echo LibreOffice 6.x
goto settings_done

:LibreOffice6-Win32
set _writer=%_LibreOffice6_w32%
set _user=%USERPROFILE%\%_LibreOffice_Userprofile%
set _ext=OOTyW_en-GB-L-%_release%.oxt
echo LibreOffice 6.x
goto settings_done

:settings_done

echo Installing OpenOffice extension %_ext% ...

"%_writer%\program\unopkg" add -f program\%_ext%

echo Copying template to %_user%\template ...

if not exist "%_user%\template" mkdir "%_user%\template"
copy /-y program\yWriter.ott "%_user%\template"

echo -----------------------------------------------------------------
echo #
echo # Installation of OOTyW_en-GB v%_release% finished.
echo #
echo -----------------------------------------------------------------
pause



:end
