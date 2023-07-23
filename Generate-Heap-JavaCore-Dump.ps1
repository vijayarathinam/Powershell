# WebSphere Application Server credentials details
$wasUser = "wsadmin"
$wasPassword = "admin123"
$wasAdminHost = "localhost"
$wasAdminPort = "8879"

# Jython script code for generating the heap dump and thread dump
$jythonCode = @"
jvm = AdminControl.completeObjectName('type=JVM,process=server1,*')
AdminControl.invoke(jvm, 'generateHeapDump')
AdminControl.invoke(jvm, 'dumpThreads')
"@

# Save the Jython code to a permanent .py file
$pyScriptFile = "F:\HeapDump.py" # Specify the path and file name of the .py file
$jythonCode | Out-File $pyScriptFile -Encoding ASCII

# Build the command to execute wsadmin.bat with the Jython script
$wsadminPath = "F:\IBM\WebSphere\AppServer\profiles\Dmgr01\bin\wsadmin.bat" # Adjust the path based on your environment
$wsadminCommand = "$wsadminPath -lang jython -user $wasUser -password $wasPassword -host $wasAdminHost -port $wasAdminPort -f $pyScriptFile"

# Execute the wsadmin.bat with the Jython script and wait for the process to complete
Start-Process -FilePath $wsadminPath -ArgumentList "-lang jython -user $wasUser -password $wasPassword -host $wasAdminHost -port $wasAdminPort -f $pyScriptFile" -Wait

# You can remove the .py script file if desired, but it's kept permanently in this version
Remove-Item $pyScriptFile
