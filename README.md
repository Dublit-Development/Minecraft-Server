
# Minecraft Server Installation Script

This bash script automates the process of installing a Minecraft server on a Debian-based system. It installs the required dependencies, sets up the server, and provides guidance on managing it.

## Install git
1. Install git
   `sudo apt install git`

## Installation

1. Clone this repository to your local machine:
   `git clone https://github.com/Dublit-Development/Minecraft-Server.git`
2. Change into the repository directory:
  `cd your-repo-name`
3. Make the scripts executable
  `chmod +x serverinstall.sh` and `chmod +x prerequisites.sh`
4. Run the scripts with sudo privileges (Run prerequisites.sh first)

   `sudo ./prerequisites.sh`

   `sudo ./serverinstall.sh`

## Usage
1. After running the script, follow the prompts to install OpenJDK, 'screen', and set up the server.
2. A 'screen' session named "minecraft" will start. To detach from the session while keeping it running, press Ctrl + A followed by D.
3. Edit the server properties by opening the server.properties file with the nano text editor:
  `nano server.properties`
4. When you're ready to start your server, reattach to the 'screen' session using:
  `screen -r <session_ID>`

Then start the server with:
`java -Xms1024M -Xmx1024M -jar minecraft_server_1.20.1.jar nogui`

## Backup and Restore Server Files (Optional)
#### If you are interested in backing up your server files to an compatiable object storage using the AWSCLI: 

Install AWSCLI and configure credentials:

`sudo ./awsCLI_configure.sh`

Upload to S3

`sudo ./upload_to_s3.sh`

## Reminder
Remember to keep your 'screen' instance active by detaching (Ctrl + A + D) when not actively working in it. For further server starts, re-run the command provided in step 4 above.

Feel free to modify the script and instructions to fit your preferences or system requirements.

Disclaimer: Always review scripts and instructions before executing them on your system to ensure they match your environment and needs.

## Object Store and Virtual Machine Platforms

Compute and Virtual Machine Instances:  [Valdi](https://valdi.ai/signup?ref=YZl7RDQZ)

Object Store Provider:  [Storj](https://storj.io)

