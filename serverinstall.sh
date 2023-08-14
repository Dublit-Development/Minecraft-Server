#!/bin/bash

# Step 9: Start the Minecraft server and generate EULA
java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui

# Step 10: Modify EULA to accept terms
sed -i 's/eula=false/eula=true/g' eula.txt

# Reminder for user
echo "The first time will fail.  Be sure to run it again, it needs to accept the EULA first."
echo "Remember to keep your screen instance active by detaching (Ctrl + A + D)."
echo "You can edit the server properties by editing the server.properties file with nano."
echo "When you are ready to start your server, simply re-run:"
echo "java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui."
