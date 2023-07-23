# Powershell
This PowerShell script automates the process of generating a heap dump and thread dump for an application running on IBM WebSphere Application Server. Let me break down the script for you step by step:

The script starts by defining the credentials and server details for WebSphere Application Server. It sets the variables $wasUser, $wasPassword, $wasAdminHost, and $wasAdminPort with appropriate values. These credentials will be used to connect to the WebSphere Admin Console later.

The script then defines the Jython script code that will be used to generate the heap dump and thread dump. The Jython code is enclosed within the @" and "@ delimiters, allowing it to span multiple lines. This Jython code uses WebSphere's AdminControl API to invoke the functions for generating the heap dump and thread dump.

The Jython code is saved to a permanent .py file using the Out-File cmdlet. The file path and name are specified by the variable $pyScriptFile.

Next, the script builds the command to execute wsadmin.bat, which is the WebSphere Admin Console's script for running administrative commands. The command includes the Jython script file created earlier and the necessary connection parameters (user, password, host, and port) obtained from the previously defined variables.

The script then executes wsadmin.bat with the Jython script using the Start-Process cmdlet. The -Wait parameter ensures that the script waits for the wsadmin.bat process to complete before continuing.

After executing the Jython script, the script removes the .py script file using the Remove-Item cmdlet. This is done to clean up the temporary Jython script file, though the script comments that in this version, it's kept permanently.
