SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ros2(){
    cd $SCRIPT_DIR
    echo "Running docker image from $PWD..."
    docker compose -f compose-nvidia.yml up -d
    docker compose exec dev bash
}
