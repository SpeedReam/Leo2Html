cls
if "%1" == "log" goto LOG
if "%1" == "LOG" goto LOG
call git status
pause
call git add . --dry-run
pause
call git commit -m "Minor changes."
goto DONE
:LOG
git log --reverse
@echo.
@echo.
:DONE

