#!/bin/bash
# Install Java 21 if not already installed
if ! command -v java &> /dev/null || ! java -version 2>&1 | grep -q "version \"21"; then
    echo "Installing Java 21..."
    sudo amazon-linux-extras install java-openjdk21 -y || sudo yum install -y java-21-amazon-corretto
fi

# Create application directory if it doesn't exist
mkdir -p /opt/twig-app

# Clean up previous deployment if exists
if [ -d "/opt/twig-app/target" ]; then
    rm -rf /opt/twig-app/target
fi

# Ensure permissions are correct
chown -R ec2-user:ec2-user /opt/twig-app
chmod -R 755 /opt/twig-app
