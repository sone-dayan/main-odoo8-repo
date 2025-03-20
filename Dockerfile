# Use a base image with Python 2.7 (required for Odoo 8)
FROM python:2.7-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libxslt1-dev \
    libzip-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libpq-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone your GitHub repository (read-only access)
RUN git clone https://github.com/sone-dayan/main-odoo8-repo.git /opt/odoo

# Set the working directory
WORKDIR /opt/odoo/odoo

# Install Odoo dependencies
RUN pip install -r requirements.txt

# Expose the Odoo port
EXPOSE 8069

# Set the entrypoint to run Odoo
CMD ["python", "odoo.py"]