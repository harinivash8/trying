#!/bin/bash
set -e

echo "Application stop script started"

# Check if service exists
if systemctl list-units --all | grep -q twig-demo.service; then
  # Stop the service if it's running
  if systemctl is-active --quiet twig-demo.service; then
    echo "Stopping application service"
    systemctl stop twig-demo.service
  else
    echo "Application service is not running"
  fi
else
  echo "Application service does not exist yet"
fi

echo "Application stop script completed"
