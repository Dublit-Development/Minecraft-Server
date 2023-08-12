#!/bin/bash

# Step 1: Add OpenJDK repository
sudo add-apt-repository ppa:openjdk-r/ppa

# Step 2: Update package lists
sudo apt update

# Step 3: Install OpenJDK 17 JRE (headless)
sudo apt install openjdk-17-jre-headless

# Step 4: Install 'screen'
sudo apt install screen

# Step 5: Allow Minecraft port (25565) through firewall
sudo ufw allow 25565

# Step 6: Download the Minecraft server JAR
wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar

# Step 7: Rename the downloaded JAR
mv server.jar minecraft_server_1.20.1.jar

# Step 8: Start a 'screen' session
screen -S minecraft

# Step 9: Start the Minecraft server and generate EULA
java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui

# Step 10: Modify EULA to accept terms
sed -i 's/eula=false/eula=true/g' eula.txt

# Reminder for user
echo "Remember to keep your screen instance active by detaching (Ctrl + A + D)."
echo "You can edit the server properties by editing the server.properties file with nano."
echo "When you are ready to start your server, simply re-run:"
echo "java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui."
