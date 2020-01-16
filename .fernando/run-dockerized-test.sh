if [[ "$#" -ne 1 ]]; then
    echo "Nombre d'arguments invalide : l'argument du script doit être le numéro du problème !"
    exit 1
fi

PROBLEM_NUMBER=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run --rm -it $(docker build -q -f "$DIR/Dockerfile" "$DIR/..") /app/fernando-chase/.fernando/run-program.sh "$PROBLEM_NUMBER"
