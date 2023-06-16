# Use the appropriate base image for Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set the working directory
WORKDIR C:\xampp

# Download XAMPP installer from Apache Friends website
ADD https://www.apachefriends.org/xampp-files/7.4.16/xampp-windows-x64-7.4.16-0-VC15-installer.exe xampp-installer.exe

# Run the XAMPP installer in unattended mode
RUN xampp-installer.exe /S /COMPONENTS="xampp" /DIR="C:\xampp"

# Expose ports for Apache (80) and MySQL (3306)
EXPOSE 80 3306

# Start the XAMPP services when the container starts
CMD ["C:\\xampp\\apache\\bin\\httpd.exe", "-k", "start"]
CMD ["C:\\xampp\\mysql\\bin\\mysqld.exe"]

# Optional: You can add any additional configuration or setup steps here
