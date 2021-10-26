REM Prepare a newly compiled version for commit

set _version=3.2.2

REM Delete the old version ...
del ..\*.oxt
del ..\*.xml

REM Copy the update information to the central location
REM where old installations might look for it ...
copy /Y ..\oxt\*.xml ..\..\curly\oxt-en-GB\

REM Put the new version to the official update location ...
move ..\oxt\*.oxt ..\
move ..\oxt\*.xml ..\

REM Copy the home page template and set the version
copy ..\docs\template\index.md ..\docs
python set_version.py %_version%

pause