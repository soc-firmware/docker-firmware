# 🚀 firmware Docker Builder - raspberry pi

Welcome to the **firmware Docker Builder**, a streamlined, containerized environment for building firmware projects using Docker. This project provides a **lightning-fast, reproducible, and isolated** setup, ensuring a **hassle-free** experience for firmware builds. Say goodbye to dependency hell and inconsistent environments! 🚀🔥

## 🏗️ Features

- **Firmware-specific toolchain** pre-installed 🛠️
- **Cross-compilation support** for embedded targets
- **Build artifact caching** for faster iterations
- **Integrated debug tools** for firmware validation
- **Fully containerized build environment** 🐳
- **Minimal host dependencies** (Just Docker & Docker Compose!)
- **Reproducible builds** across machines and environments
- **Automatic volume management** for persistent storage
- **Preconfigured for firmware builds** (but flexible for other needs)
- **Multi-architecture support** (x86_64, ARM, etc.)
- **Optimized caching** to reduce build times

## 📦 Prerequisites

Ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🚀 Quick Start

1. Clone this repository:
   ```bash
   git clone git@github.com:soc-pi/docker-pi.git
   cd docker-pi
   ```

2. Configure your firmware settings:
   ```bash
   cp config/firmware-config.template.json config/firmware-config.json
   # Edit firmware-config.json with your settings
   ```

3. Build the Docker image:
   ```bash
   docker-compose build
   ```

4. Run the container:
   ```bash
   docker-compose up -d
   ```

5. Enter the build environment:
   ```bash
   docker exec -it firmware-builder bash
   ```

6. Start your firmware build inside the container:
   ```bash
   source /build/env-setup.sh && bitbake <your-target>
   ```

## 🔧 Firmware Build Configuration

### Supported Targets
- Raspberry Pi (all models)
- Custom embedded boards (via toolchain configuration)
- RISC-V development boards

### Build Options
```bash
# Basic firmware build
make firmware

# Debug build with symbols
make firmware-debug

# Clean build artifacts
make clean-firmware
```

## 🛠️ Configuration

### Dockerfile
- **Based on Ubuntu/Debian** for maximum compatibility
- **Preinstalled build dependencies** to avoid long setup times
- **User permissions handled** to avoid root access issues

### `docker-compose.yml`
- **Mounts local directories** for persistent data storage
- **Customizable environment variables** for project-specific needs

Modify `docker-compose.override.yml` to tweak the setup according to your needs.

## 📂 Folder Structure
```
.
├── Dockerfile             # Defines the build environment
├── docker-compose.yml     # Defines the service
├── volumes/               # Persistent storage for builds
├── scripts/               # Custom helper scripts
└── README.md              # You are here 🚀
```

## 🚀 Advanced Usage

### Clean up old containers
```bash
docker-compose down --volumes --remove-orphans
```

### Rebuild the environment
```bash
docker-compose build --no-cache
```

### Stop and remove the container
```bash
docker-compose down
```

## 🔄 Updating Docker Compose

Remove the current Docker Compose:

```
sudo rm /usr/local/bin/docker-compose
```
Install the latest version of Docker Compose:

```
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Verify the installation:
```
docker-compose --version
```

## 📚 Debugging Tools
- Built-in GDB support
- JTAG interface compatibility
- Firmware validation tools
- Memory analysis utilities

## 🔥 Why Use This?

- **No more broken dependencies!**
- **Consistent, repeatable builds across teams.**
- **Easy integration with CI/CD pipelines.**
- **Lightweight and efficient compared to VM-based setups.**

## 🤝 Contributing
PRs are welcome! Open an issue if you find a bug or have a feature request.

## 📜 License
MIT - Go wild! 🚀
