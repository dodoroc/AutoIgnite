@echo off
start php ^
-S localhost:8000 ^
-d error_reporting=E_ALL ^
-d display_errors=off ^
-d log_errors=on ^
-d error_log=./err.txt ^
App.php

exit 0