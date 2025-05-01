#!/bin/bash
# Change to application directory
cd /opt/twig-app

# Start the application in the background and redirect output
nohup java -jar twig-0.0.4-core.jar > /opt/twig-app/application.log 2>&1 &

# Save the process ID
echo $! > /opt/twig-app/application.pid

echo "Application started with PID $(cat /opt/twig-app/application.pid)"
