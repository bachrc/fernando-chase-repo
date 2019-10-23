#!/usr/bin/env bash

PROBLEM_NUMBER=$1

INPUT_FILE_REGEX="input(\d*)\.txt"
EPREUVE_FOLDER="./epreuve-$PROBLEM_NUMBER"

for filename in "$EPREUVE_FOLDER"/input*.txt; do
  echo "je me lance pour $filename"
  if [[ $filename =~ $INPUT_FILE_REGEX ]]; then
    input_file_number="${BASH_REMATCH[1]}"
    expected_output=$(cat "$EPREUVE_FOLDER/output$input_file_number.txt")

    program_output=$(../mvnw compile test exec:java -Dexec.mainClass=fr.lacombe.fernandochase.Main -f ".." -Dexec.args="$filename" -q)

    if [ "$program_output" = "$expected_output" ]; then
      echo "oui c'est bien"
    else
      echo "non c'est pas bien" >&2
    fi
  else
    echo "pas de fichier output correspondant au fichier input"
  fi

done

