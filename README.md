# windows-docker-cli

## Step 1 : install wsl

1. Open PowerShell as Administrator.
2. Run the following command to enable WSL:
   ```powershell
   wsl --install
   ```
3. Restart your computer when prompted.

## Step 2 : install docker

1. Open Powershell
2. Run the following command to access wsl:
   ```powershell
   wsl
   ```
3. Run the following command to install Docker:
   ```bash
   sudo apt update
   sudo apt install docker.io
   ```
4. Add your user to the docker group:
   ```bash
   sudo usermod -aG docker $USER
   ```
5. Restart your WSL instance or run the following command to apply group changes:
   ```bash
   newgrp docker
   ```
6. Verify the installation by checking the Docker version:
   ```bash
   docker --version
   ```

## Step 3 : install docker compose

1. Run the following command to install Docker Compose:
   ```bash
   sudo apt install docker-compose-v2
   ```
2. Verify the installation by checking the version:
   ```bash
   docker compose --version
   ```

## Step 4 : add docker to path

1. Add the `bin` directory of this repository to your system PATH.
   - Open the Start Menu and search for "Environment Variables".
   - Click on "Edit the system environment variables".
   - In the System Properties window, click on the "Environment Variables" button.
   - In the Environment Variables window, find the "Path" variable in the "System variables" section and select it.
   - Click on the "Edit" button.
   - In the Edit Environment Variable window, click on the "New" button and add the path to the `bin` directory of this repository.
   - Click "OK" to close all the windows.
2. Open a new PowerShell window and run the following command to verify that Docker is in your PATH:
   ```powershell
   docker --version
   ```
