# windows-docker-cli

## 1 : Install WSL

1. Open PowerShell as Administrator.
2. Run the following command to enable WSL:
   ```powershell
   wsl --install --no-distribution
   ```
3. Restart your computer when prompted.
4. After the restart, open PowerShell as Administrator again.
5. Set WSL to use version 2 by default:
   ```powershell
   wsl --set-default-version 2
   ```

## 2 : install docker-lite distribution

1. Open Powershell as Administrator.
2. Run this all in one script to install the docker-lite WSL distribution:
   ```powershell
   ./setup.ps1
   ```
3. Verify the installation by checking the Docker version:
   ```bash
   docker --version
   ```
4. Restart your computer to ensure all changes take effect.


## 3 : Install portainer for GUI management (optional)

1. In your terminal, run the following command to deploy Portainer:
   ```bash
   docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
   ```

2. Open your web browser and navigate to `http://localhost:9000` to access the Portainer web interface.