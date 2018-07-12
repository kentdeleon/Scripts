@echo off



CALL :readFileContent
CALL :askUserForInputParameters
CALL :displayFunc


pause
EXIT /B %ERRORLEVEL% 

:displayFunc
echo ========================================
echo "userId" 	: "%userId%"
echo "server" 	: "%server%"
echo "puttyDir" 	: "%puttyDir%"
echo ========================================
EXIT /B 0

:readFileContent
	FOR /f "delims=, tokens=1,2,3" %%a in (parameters.txt) do (
		SET userId=%%a
		SET server=%%b
		SET puttyDir=%%c
	)
EXIT /B 0

:askUserForInputParameters
	IF %eagleId%==NULL (
		SET /p userId="Enter userId: "
		CALL :saveUserInputToFile
	)
	IF %citbox%==NULL (
		SET /p server="Enter server: "
		CALL :saveUserInputToFile
	)
	IF %puttyDir%==NULL (
		SET /p puttyDir="Enter puttyDir: "
		CALL :saveUserInputToFile
	)
EXIT /B 0

:saveUserInputToFile
	@echo %userId%,%server%,%puttyDir%> parameters.txt
	echo Successfully save new parameters to parameters.txt
EXIT /B 0
