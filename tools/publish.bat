REM Prepare a newly compiled version for commit

REM Delete the old version ...
del ..\*.oxt
del ..\*.xml

REM Copy the update information to the central location
REM where old installations might look for it ...
copy /Y ..\oxt\*.xml ..\..\curly\oxt-en-GB\

REM Put the new version to the official update location ...
move ..\oxt\*.oxt ..\
move ..\oxt\*.xml ..\

pause