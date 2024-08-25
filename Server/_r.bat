@echo off
@ /b flag changes ctrl c handling so we don't get the message to abort and starts the program in current window
start /b php ^
-S localhost:8000 ^
-d error_reporting=E_ALL ^
-d display_errors=off ^
-d log_errors=on ^
-d error_log=./err.txt ^
App.php


exit 0