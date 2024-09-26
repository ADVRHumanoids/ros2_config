# ros2_config
Configuration files and docker containers for ros2

## Usage with Docker

1. **Setup environment:**  `export ROS2_IP=10.24.x.x` (add to .bashrc for convenience)
2. **Build the container:**
    ```bash
    cd docker/noble-ros2  # or noble-ros2-xeno for RT
    docker compose build
    source setup.bash  # for the "ros2" alias (or setup-nvidia.bash )
    ```
3. **Bootstrap:** this will compile a forest_ws with all required software inside the container; the workspace is inside a mounted directory for persistent storage over container restart
   ```bash
   ros2
   ./bootstrap.sh
   ```
4. **Run the container:** `ros2`
5. **Stop the container:**  `docker stop <img-name>` (use TAB for completion)


## Usage with host machine

```bash
mkdir build && cd build
cmake .. -DROS2_IP="10.24.x.x"  # this generates the xml file for CycloneDDS with the correct network address
sudo cmake --install . --component sysctl_rules  # install sysctl rules for optimized kernel configuration
sudo sysctl --system  # reload kernel configuration
source dds/cyclonedds/setup.bash  # add to .bashrc for convenience
```
