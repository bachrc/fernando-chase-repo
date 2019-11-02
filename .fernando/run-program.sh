#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
    echo "Nombre d'arguments invalide : l'argument du script doit être le numéro du problème !"
    exit 1
fi

PROBLEM_NUMBER=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INPUT_FILE_REGEX='input([[:digit:]]*)\.txt$'
EPREUVE_FOLDER="$DIR/epreuve-$PROBLEM_NUMBER"

for filename in "$EPREUVE_FOLDER"/input*.txt; do
  echo "Lecture du fichier : $filename"
  if [[ $filename =~ $INPUT_FILE_REGEX ]]; then
    input_file_number="${BASH_REMATCH[1]}"
    expected_output_file="$EPREUVE_FOLDER/output$input_file_number.txt"

    if ! test -f "$expected_output_file"; then
      echo "Erreur technique : fichier output correspondant à $filename introuvable." >&2
      exit 1
    fi

    echo "Lecture du fichier : $expected_output_file."
    expected_output=$(cat "$expected_output_file")

    echo "Execution du programme en cours..."
    program_output=$(mvn compile test exec:java -Dexec.mainClass=fr.lacombe.fernandochase.Main -f "$DIR/.." -Dexec.args="$filename" -q)

    if [ "$program_output" = "$expected_output" ]; then
      echo "Le programme a bien retourné la valeur attendue !"
    else
      echo "Le programme a retourné une valeur inattendue pour le test $input_file_number."
      echo "Valeur attendue : $expected_output"
      echo "Valeur renvoyée par le programme : $program_output"
      echo "Epreuve non validée." >&2
      exit 1
    fi
  else
    echo "Erreur technique : mauvais formattage du nom de $filename" >&2
    exit 1
  fi

done

