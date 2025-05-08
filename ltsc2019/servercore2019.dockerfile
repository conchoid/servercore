FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY ./setup.ps1 C:/
RUN powershell -File C:/setup.ps1
