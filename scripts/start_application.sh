#!/bin/bash
set -e

echo "Application start script started"

# Start the service
systemctl start twig-demo.service
systemctl enable twig-demo.service

echo "Application service started and enabled"

# Verify it's running
if systemctl is-active --quiet twig-demo.service; then
  echo "Application is running successfully"
else
  echo "Failed to start application!"
  exit 1
fi

echo "Application start script completed"
