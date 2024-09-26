SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ros2(){
    cd $SCRIPT_DIR
    echo "Running docker image from $PWD..."
    docker compose up -d
    docker compose exec dev bash
}
