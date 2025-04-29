#!/bin/bash
set -e

echo "After installation script started"

# Find the JAR file
JAR_FILE=$(find /opt/app -name "*.jar" | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "No JAR file found in /opt/app directory!"
  exit 1
else
  echo "Found JAR file: $JAR_FILE"
fi

# Set permissions
chmod +x "$JAR_FILE"
echo "Set execute permission on JAR file"

# Create a symlink to the application
ln -sf "$JAR_FILE" /opt/app/application.jar
echo "Created symlink to application.jar"

# Create service file
cat > /etc/systemd/system/twig-demo.service << EOF
[Unit]
Description=Twig Demo Application
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /opt/app/application.jar
User=root
Type=simple
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

echo "Created systemd service file"

# Reload systemd
systemctl daemon-reload
echo "Reloaded systemd"

echo "After installation script completed"
