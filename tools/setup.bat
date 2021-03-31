cd ..\..\curly\tools\help
call convert.bat
cd ..\..\..\curly-en-GB\tools

xcopy /Y /s ..\..\curly\oxt ..\oxt\
copy /Y ..\..\curly\src\*.xba ..\oxt\curly_en-GB\

