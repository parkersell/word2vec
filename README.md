# word2vec
 CSE 582 HW
 
The vectors.bin file was too large. The file can be downloaded from here [Google Drive Download](https://drive.google.com/file/d/1tFiJTMCdbCTgiwX-Gi4WHa47tvKgPdUk/view?usp=share_link)
# Answers to Questions: 
- How does CBOW compose context embeddings?
  - It randomly initializes the context embedding or syn0 vector. This is a projection vector layer that converts to a dense embedding vector
- How does it compute word probability given context?
  - It uses the unigram table and makes a large table from 0 to 100M. This table is filled the words index value in that large vocab matrix.
- How does it implement negative sampling?
  - it randomly selects a value from the unigram table and labels it as 0. Then it updates the syn01neg weights
- Any other parameters apart from the word embeddings and context
embeddings?
  - The other parameters that can be changed are normal machine learning paramters like layer size and initialization of weights. As input to the distance (inference of the cbow word embeddings) code, you just need word and context embeddings
- What input format does Word2Vec require?
  - It requires a text file specifically one that is normalized and with many substitions to get rid of nonalphanumeric characters. This can be seen in the demo-train-big-mode-v1.sh at the top. 
  - These then get converted to a vocabulary to refer to each word as a number
# The vectors.bin file is the trained values for the part 2 with the 1 billion data
# Submission for the top-10 for cat
            Word       Cosine distance
    ----------------------------------------------------------------
            cats              0.664037
          feline              0.625016
           tabby              0.614264
             dog              0.576002
         felines              0.539936
       dachshund              0.538806
         kittens              0.538335
      pomeranian              0.525441
         raccoon              0.516531
         scaredy              0.515840
# Submission for top-10 for she

            Word       Cosine distance
    ----------------------------------------------------------------
             her              0.812731
         herself              0.711759
          mother              0.640641
           woman              0.639382
            hers              0.620397
         husband              0.610614
              he              0.610271
        daughter              0.588481
            girl              0.557479
         someone              0.535139
# Submission for top-10 for like
            Word       Cosine distance
    ----------------------------------------------------------------
           maybe              0.568072
          really              0.567571
           weird              0.567114
           crazy              0.552401
            nice              0.531335
           stuff              0.529642
          pretty              0.528631
            kind              0.526991
            sort              0.524159
           silly              0.521286
