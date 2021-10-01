set SOLUTION_NAME="Tempest"
set APPLICATION_PLUGINS_PATH="%programdata%\Autodesk\ApplicationPlugins"
set BUILDED_PLUGIN_PATH="build\%SOLUTION_NAME%.bundle\Contents\Program"
set PACKAGE="src\startup\manifest\PackageContents.xml"
set MANIFEST="src\startup\manifest\%SOLUTION_NAME%.addin"

dotnet build

rd /s /q "build"
md "build\%SOLUTION_NAME%.bundle\Contents\Program"

xcopy /y /r %PACKAGE% "build\%SOLUTION_NAME%.bundle"
xcopy /y /r %MANIFEST% "build\%SOLUTION_NAME%.bundle\Contents"

xcopy /y /r /c "src\startup\bin\x64\Debug\net48\BimGen.%SOLUTION_NAME%.Startup.dll" %BUILDED_PLUGIN_PATH%

xcopy /y /r /s /h /c "build" %APPLICATION_PLUGINS_PATH%