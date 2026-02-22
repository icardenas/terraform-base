# Stage 1: Get Terraform and AWS CLI from their official images
FROM hashicorp/terraform:1.7.4 AS terraform_source
FROM amazon/aws-cli:latest AS aws_source

# Stage 2: Final lightweight image
FROM debian:bookworm-slim

# Install base dependencies for Azure CLI and networking
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates python3 python3-pip python3-venv \
    iputils-ping traceroute git unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy Terraform from Stage 1
COPY --from=terraform_source /bin/terraform /usr/local/bin/terraform

# Copy AWS CLI from Stage 1 (it's self-contained in /usr/local/aws-cli)
COPY --from=aws_source /usr/local/aws-cli /usr/local/aws-cli
RUN ln -s /usr/local/aws-cli/v2/current/bin/aws /usr/local/bin/aws

# Install Azure CLI, pre-commit, TFLint, TFSec and Checkov
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir azure-cli pre-commit checkov

# Install TFLint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# Install TFSec
RUN curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash

# Install terraform-docs
RUN curl -sSLo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.17.0/terraform-docs-v0.17.0-linux-amd64.tar.gz \
    && tar -xzf terraform-docs.tar.gz \
    && chmod +x terraform-docs \
    && mv terraform-docs /usr/local/bin/terraform-docs \
    && rm terraform-docs.tar.gz

WORKDIR /workspace
ENTRYPOINT ["/bin/bash"]
