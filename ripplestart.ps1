# WebSphere Application Server credentials and cluster details
# WebSphere Application Server credentials and application details
$wasUser = "wsadmin"
$wasPassword = "admin123"
$wasAdminHost = "localhost"
$wasAdminPort = "8879"
$clusterName = "Maximo-Cluster"

# Connect to the WebSphere Application Server using the wsadmin tool
$wsadminPath = "F:\IBM\WebSphere\AppServer\profiles\Dmgr01\bin\wsadmin.bat" # Adjust the path based on your environment
$wsadminCommand = "$wsadminPath -lang jython -user $wasUser -password $wasPassword -host $wasAdminHost -port $wasAdminPort"

# Build the ripple start command for the cluster
$rippleStartCommand = "AdminControl.invoke('WebSphere:name=Maximo-Cluster,process=dmgr,platform=common,node=LAPTOP-COVBJ15NCellManager01,version=9.0.0.0,type=Cluster,mbeanIdentifier=Maximo-Cluster,cell=LAPTOP-COVBJ15NCell01,spec=1.0', 'rippleStart')"

# Execute the command
$fullCommand = "$wsadminCommand -c `" $rippleStartCommand `""
Invoke-Expression $fullCommand

# Display the output in the PowerShell console
Write-Host "Ripple start of the cluster '$clusterName' completed."
Write-Host "Output:"
Write-Host $output


