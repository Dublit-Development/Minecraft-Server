#!/bin/bash

echo "Welcome to the Minecraft Server Installation Script!"

while true; do
    # Part one - prerequisite's.sh
    echo "Do you want to install the prerequisites? (yes/no/exit): "
    read response_part_one

    if [[ "$response_part_one" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$response_part_one" == "yes" ]]; then
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
    elif [[ "$response_part_one" == "no" ]]; then
        echo "Skipping prerequisite installation."
    else
        echo "Invalid response."
    fi

    # Part two - Serverinstall.sh
    echo "Do you want to install the Minecraft server? (yes/no/exit): "
    read response_part_two

    if [[ "$response_part_two" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$response_part_two" == "yes" ]]; then
        # Step 9: Start the Minecraft server and generate EULA
        java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui

        # Step 10: Modify EULA to accept terms
        sed -i 's/eula=false/eula=true/g' eula.txt
        
        echo "Installation of the Minecraft server completed!"
    elif [[ "$response_part_two" == "no" ]]; then
        echo "Skipping Minecraft server installation."
    else
        echo "Invalid response."
    fi

    # Part three - Serverstart.sh
    echo "Do you want to start the Minecraft server? (yes/no/exit): "
    read response_part_three

    if [[ "$response_part_three" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$response_part_three" == "yes" ]]; then
        # This will initiate the server and start loading.
        java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui

        echo "Server started! Remember to keep your screen instance active by detaching (Ctrl + A + D)."

    elif [[ "$response_part_three" == "no" ]]; then
        echo "Skipping Minecraft server start."
    else
        echo "Invalid response."
    fi

    # Offer to run the script again
    echo "Do you want to run the script again? (yes/no/exit): "
    read run_again

    if [[ "$run_again" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$run_again" != "yes" ]]; then
        echo "Exiting the script."
        exit 0
    fi
done

echo "Script execution completed!"
