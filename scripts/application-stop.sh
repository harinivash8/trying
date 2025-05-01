#!/bin/bash
# Check if the PID file exists
if [ -f /opt/twig-app/application.pid ]; then
    pid=$(cat /opt/twig-app/application.pid)
    
    # Check if the process is still running
    if ps -p $pid > /dev/null; then
        echo "Stopping application with PID $pid"
        kill $pid
        # Wait for the process to terminate gracefully
        sleep 5
        
        # Force kill if still running
        if ps -p $pid > /dev/null; then
            echo "Force killing application with PID $pid"
            kill -9 $pid
        fi
    else
        echo "Application not running with PID $pid"
    fi
    
    # Remove PID file
    rm -f /opt/twig-app/application.pid
else
    echo "No PID file found, application may not be running"
    
    # Try to find and kill any running java processes with the jar name
    pkill -f "java -jar twig-.*-core.jar" || echo "No matching processes found"
fi

echo "Application stop script completed"
