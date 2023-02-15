
normalize_text() {
  awk '{print tolower($0);}' | sed -e "s/’/'/g" -e "s/′/'/g" -e "s/''/ /g" -e "s/'/ ' /g" -e "s/“/\"/g" -e "s/”/\"/g" \
  -e 's/"/ " /g' -e 's/\./ \. /g' -e 's/<br \/>/ /g' -e 's/, / , /g' -e 's/(/ ( /g' -e 's/)/ ) /g' -e 's/\!/ \! /g' \
  -e 's/\?/ \? /g' -e 's/\;/ /g' -e 's/\:/ /g' -e 's/-/ - /g' -e 's/=/ /g' -e 's/=/ /g' -e 's/*/ /g' -e 's/|/ /g' \
  -e 's/«/ /g' | tr 0-9 " "
}

for i in `ls '/mnt/d/Spring 2023 Big Files/1-billion-word-language-modeling-benchmark-r13output/training-monolingual.tokenized.shuffled'`; do
  normalize_text < "/mnt/d/Spring 2023 Big Files/1-billion-word-language-modeling-benchmark-r13output/training-monolingual.tokenized.shuffled/$i" >> "/mnt/d/Spring 2023 Big Files/data.txt"
done

gcc word2vec.c -o word2vec -lm -pthread -O3 -march=native -funroll-loops

./word2vec -train "/mnt/d/Spring 2023 Big Files/data.txt" -output vectors.bin -cbow 1 -size 500 -window 10 -negative 10 -hs 0 -sample 1e-5 -threads 40 -binary 1 -iter 3 -min-count 10