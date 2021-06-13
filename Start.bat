echo off
rem
rem *****************************************
rem **  EtherVIC Startup Batch file V1.00  **
rem *****************************************
rem
rem *****************************************
rem
rem Instructions
rem
rem If using MSIAfterburner, use Profile1 for default settings and Profile 2 for OC settings. Verify the application path.
rem
rem If using Nvidia Inspector, please setup Default and OC settings here. Make sure the file path is correct too.
rem
rem We suggest starting this batch as an Admin so you dont need to always confirm any call to MSIAfterburner
rem

EtherVic.exe  -P stratum2+tcp://0x6120e7b3591787dbb527e113be3590dc14d49655.EtherVic@eth-eu1.nanopool.org:9999  -R --HWMON 2 -v 3 --display-interval 30

goto end



rem Not used yet
echo Start mining...
rem check if MSI Afterburner is running
rem
QPROCESS "MSIAfterburner.exe">NUL
IF %ERRORLEVEL% EQU 0 goto Afterburner

rem check if NvidiaInspector is running
rem
QPROCESS "nvidiaInspector.exe">NUL
IF %ERRORLEVEL% EQU 0 goto NvidiaInspector

echo No GPU handler is running
start "" "C:\Users\Rig4\Desktop\New Miner\V9\EtherVic.exe"  -P stratum2+tcp://0x6120e7b3591787dbb527e113be3590dc14d49655.EtherVic@eth-eu1.nanopool.org:9999  -R --HWMON 2 -v 3 --display-interval 30

goto end


:Afterburner
rem
echo MSIAfterburner handler

echo Setting default profile on MSIAfterburner (Profile 1)
start "" "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" -profile1

Timeout 5

rem start miner
start "" "C:\Users\Rig4\Desktop\New Miner\V9\nsfminer.exe" -P stratum2+tcp://0x6120e7b3591787dbb527e113be3590dc14d49655.EtherVic@eth-eu1.nanopool.org:9999  -R --HWMON 2 -v 3 --display-interval 30

rem Wait 30 seconds
echo Waiting for DAG completed...
Timeout 30

echo Setting overclock profile on Afterburner (Profile 2)
start "" "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" -profile2
goto end

:NvidiaInspector
rem
echo Nvidia Inspector handler

rem
echo Setting default profile on Nvidia Inspector
rem use only as needed
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:0,0,0 -setMemoryClockOffset:0,0,0 -setPowerTarget:0,100 -setTempTarget:0,0,80 -setFanSpeed:0,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:1,0,0 -setMemoryClockOffset:1,0,0 -setPowerTarget:1,100 -setTempTarget:1,0,80 -setFanSpeed:1,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:2,0,0 -setMemoryClockOffset:2,0,0 -setPowerTarget:2,100 -setTempTarget:2,0,80 -setFanSpeed:2,43
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:3,0,0 -setMemoryClockOffset:3,0,0 -setPowerTarget:3,100 -setTempTarget:3,0,80 -setFanSpeed:3,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:4,0,0 -setMemoryClockOffset:4,0,0 -setPowerTarget:4,100 -setTempTarget:4,0,80 -setFanSpeed:4,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:5,0,0 -setMemoryClockOffset:5,0,0 -setPowerTarget:5,100 -setTempTarget:5,0,80 -setFanSpeed:5,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:6,0,0 -setMemoryClockOffset:6,0,0 -setPowerTarget:6,100 -setTempTarget:6,0,80 -setFanSpeed:6,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:7,0,0 -setMemoryClockOffset:7,0,0 -setPowerTarget:7,100 -setTempTarget:7,0,80 -setFanSpeed:7,35
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:8,0,0 -setMemoryClockOffset:8,0,0 -setPowerTarget:8,100 -setTempTarget:8,0,80 -setFanSpeed:8,35

Timeout 5

rem start miner
EtherVic  -P stratum2+tcp://0x6120e7b3591787dbb527e113be3590dc14d49655.EtherVic@eth-eu1.nanopool.org:9999  -R --HWMON 2 -v 3 --display-interval 30

rem Wait 30 seconds
echo Waiting for DAG completed...
Timeout 30

rem
echo Setting overclock profile on Nvidia Inspector
rem use only as needed
echo rem set overclocked profile on Nvidia Inspector
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:0,0,-200 -setMemoryClockOffset:0,0,775 -setPowerTarget:0,50 -setTempTarget:0,0,80 -setFanSpeed:0,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:1,0,-200 -setMemoryClockOffset:1,0,755 -setPowerTarget:1,50 -setTempTarget:1,0,80 -setFanSpeed:1,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:2,0,-200 -setMemoryClockOffset:2,0,800 -setPowerTarget:2,50 -setTempTarget:2,0,80 -setFanSpeed:2,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:3,0,-200 -setMemoryClockOffset:3,0,625 -setPowerTarget:3,50 -setTempTarget:3,0,80 -setFanSpeed:3,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:4,0,-200 -setMemoryClockOffset:4,0,790 -setPowerTarget:4,50 -setTempTarget:4,0,80 -setFanSpeed:4,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:5,0,-200 -setMemoryClockOffset:5,0,815 -setPowerTarget:5,50 -setTempTarget:5,0,80 -setFanSpeed:5,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:6,0,-200 -setMemoryClockOffset:6,0,850 -setPowerTarget:6,51 -setTempTarget:6,0,80 -setFanSpeed:6,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:7,0,-200 -setMemoryClockOffset:7,0,615 -setPowerTarget:7,50 -setTempTarget:7,0,80 -setFanSpeed:7,-1
start C:\Users\miner01\Desktop\nvidiaInspector\nvidiaInspector.exe -setBaseClockOffset:8,0,-200 -setMemoryClockOffset:8,0,815 -setPowerTarget:8,50 -setTempTarget:8,0,80 -setFanSpeed:8,-1


:end

rem End of program

exit /b 

rem
rem MSI Afterburner arguments
rem

-profile1
-profile2
-profile3
-profile4
-profile5

rem
rem Nvidia Inspector arguments
rem

CommandLine Usage:


-setGPUClock:			<gpuIndex>,<levelIndex>,<value>

-setMemoryClock:		<gpuIndex>,<levelIndex>,<value>

-setShaderClock:		<gpuIndex>,<levelIndex>,<value>

-setVoltage:			<gpuIndex>,<levelIndex>,<value> (value -> mV)

-setFanSpeed:			<gpuIndex>,<value> (value -> percent [-1 = auto])

-setHigherPStates:		<gpuIndex>,<levelindex>,<fromDefault> (levelindex = source clocks; fromDefault = 0/1)

-restoreAllPStates:		<gpuIndex> (sets all performance states to bios defaults)

-setPStateLimit:		<gpuIndex>,<pStateID> (sets the max pState limit; set P0 (0) to restore)

-forcePState:			<gpuIndex>,<pStateID> (forces the pState; P0=0; Auto=16)

-lockVoltagePoint:		<gpuIndex>,<voltage_uV> (0uV = unlock voltage)

-setVoltagePoints:		<gpuIndex>,<voltage_uV>;<clockOffset_kHz>|... 

-dumpVoltagePoints:		<gpuIndex> (creates a setVoltagePoints.bat with current points config) 

-setBaseClockOffset:	<gpuIndex>,<pstateId>,<offset>

-setMemoryClockOffset:	<gpuIndex>,<pstateId>,<offset>

-setVoltageOffset:		<gpuIndex>,<pstateId>,<offset>

-setOverVoltage:		<gpuIndex>,<pstateId>,<offset>

-setPowerTarget:		<gpuIndex>,<percent>

-setTempTarget:			<gpuIndex>,<priorize>,<degreescelsius> (priorize: 0=false 1=true)

-setIlumination:		<gpuIndex>,<mode>,<level> (level: 0-100; mode: 0=logo 1=slibridge)



-disableOverclocking 	(disables the overclocking button)

-disableWarning 		(disables the overclocking warning)

-alwaysExpanded 		( opens expanded and disables overclocking pane toggle )

-skipMaxBoostTest 		( don't check estimated max boost clock )

-skipUpdateCheck 		(don't check for new versions)

-showMonitoring 		(opens monitoring graphs standalone)

-multiDisplayPowerSaver (starts MDPS)

-restartDisplayDriver 	(Vista/Win7+)




