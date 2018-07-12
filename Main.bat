@echo off



CALL :readFileContent
CALL :askUserForInputParameters
CALL :displayFunc


pause
EXIT /B %ERRORLEVEL% 

:displayFunc
echo ========================================
echo "eagleId" 	: "%eagleId%"
echo "citbox" 	: "%citbox%"
echo "puttyDir" 	: "%puttyDir%"
echo ========================================
EXIT /B 0

:readFileContent
	FOR /f "delims=, tokens=1,2,3" %%a in (parameters.txt) do (
		SET eagleId=%%a
		SET citbox=%%b
		SET puttyDir=%%c
	)
EXIT /B 0

:askUserForInputParameters
	IF %eagleId%==NULL (
		SET /p eagleId="Enter eagleId: "
		CALL :saveUserInputToFile
	)
	IF %citbox%==NULL (
		SET /p citbox="Enter citbox: "
		CALL :saveUserInputToFile
	)
	IF %puttyDir%==NULL (
		SET /p puttyDir="Enter puttyDir: "
		CALL :saveUserInputToFile
	)
EXIT /B 0

:saveUserInputToFile
	@echo %eagleId%,%citbox%,%puttyDir%> parameters.txt
	echo Successfully save new parameters to parameters.txt
EXIT /B 0