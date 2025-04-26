FROM ubuntu:22.04

# Install required system packages and dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    tar \
    sudo \
    git \
    wget \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    libicu70 \
    libssl3 \
    libkrb5-3 \
    libunwind8 \
    libcurl4 \
    && apt-get clean

# -------------------------------
# Install PowerShell manually for ARM64
# -------------------------------
RUN mkdir -p /opt/microsoft/powershell/7 \
  && curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/powershell-7.4.1-linux-arm64.tar.gz \
     | tar -xz -C /opt/microsoft/powershell/7 \
  && ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh

# -------------------------------
# Install Azure PowerShell modules to AllUsers scope
# -------------------------------
RUN pwsh -Command "\
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; \
    Install-Module Az.Accounts -Force -Scope AllUsers -AllowClobber; \
    Install-Module Az.Resources -Force -Scope AllUsers -AllowClobber"

# -------------------------------
# Install Bicep CLI (ARM64)
# -------------------------------
RUN curl -Lo bicep https://github.com/Azure/bicep/releases/latest/download/bicep-linux-arm64 \
    && chmod +x bicep \
    && mv bicep /usr/local/bin/bicep

# -------------------------------
# Create a non-root user and group
# -------------------------------
RUN groupadd agentgroup && useradd -m -g agentgroup agentuser

# Set working directory
WORKDIR /agent

# Copy the start script and make it executable
COPY start-agent.sh /agent/start-agent.sh
RUN chmod +x /agent/start-agent.sh

# Download and extract Azure DevOps agent
RUN curl -L https://vstsagentpackage.azureedge.net/agent/4.253.0/vsts-agent-linux-arm64-4.253.0.tar.gz -o agent.tar.gz \
    && tar -xzf agent.tar.gz \
    && rm agent.tar.gz

# Change ownership to non-root user
RUN chown -R agentuser:agentgroup /agent

# Switch to non-root user
USER agentuser

# Run the startup script (which configures and runs the agent)
ENTRYPOINT ["./start-agent.sh"]
