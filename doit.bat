@cls
@if "%1" == "log" goto LOG
@if "%1" == "LOG" goto LOG
@if "%1" == "branch" goto BRANCH
@if "%1" == "BRANCH" goto BRANCH
@if "%1" == "switch" goto SWITCH
@if "%1" == "SWITCH" goto SWITCH
@
call git status
@pause
call git add . --dry-run
@pause
call git commit -m "Edward's 2nd rewrite, the continuation of the simplification process. Edward says this may be as simple as it gets."
goto DONE
:LOG
call git log --reverse
goto DONE
:BRANCH @rem creates a new branch
@rem call git checkout -b all_in_leo
@rem call git checkout -b quantal_scripting
goto DONE
:SWITCH @ rem switches to a different branch
@rem call git checkout all_in_leo
@rem call git checkout quantal_scripting
goto DONE
@echo.
@echo.
:DONE

