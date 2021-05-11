#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const char TARGET[] = {'M','E','T','H','I','N','K','S',' ','I','T',' ','I','S',' ','L','I','K','E',' ','A',' ','W','E','A','S','E','L'};
const char ALPHABET[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' '};
const float MUTATION_RATE = 0.05;
const int COPIES_PER_GENERATION = 100;
const int TARGET_SIZE = sizeof(TARGET)/sizeof(char);
const int ALPHABET_SIZE = sizeof(ALPHABET)/sizeof(char);

char* makeCopy(char* word) {
    char* copy = malloc(TARGET_SIZE*sizeof(char));
    for (int i = 0; i < TARGET_SIZE; i++) {
        copy[i] = word[i];
    }
    return copy;
}

char* mutate (char* word) {
    for (int i = 0; i < TARGET_SIZE; i++) {
        float randomPercent = ((float)rand() / RAND_MAX);
        if (randomPercent <= MUTATION_RATE) {
            int randomIndex = rand() % (ALPHABET_SIZE + 1);
            word[i] = ALPHABET[randomIndex];
        }
    }
    return word;
}

char** reproduce (char* word) {
    char** copies = (char**) malloc((COPIES_PER_GENERATION* sizeof(char*)));

    for (int i = 0; i < COPIES_PER_GENERATION; i++) {
        copies[i] = (char*) malloc(TARGET_SIZE * sizeof(char));
        copies[i] = mutate(makeCopy(word));
    }
    return copies;
}

int getScore(char* word) {
    int score = 0;
    for (int i = 0; i < TARGET_SIZE; i++) {
        if (word[i] == TARGET[i]) {
            score++;
        }
    }
    return score;
}

char* generateInitialWord() {
    char* initialWord = (char*) malloc(TARGET_SIZE * sizeof(char));
    for (int i = 0; i < TARGET_SIZE; i++) {
        int randomIndex = rand() % (ALPHABET_SIZE + 1);
        initialWord[i] = ALPHABET[randomIndex];
    }
    return initialWord;
}

char* selectBestMutation(char** copies) {
    char* bestMutation = (char*) malloc(TARGET_SIZE * sizeof(char));
    int bestScore = -1;
    for (int i = 0; i < COPIES_PER_GENERATION; i++) {
        int score = getScore(copies[i]);
        if (score > bestScore) {
            bestMutation = copies[i];
            bestScore = score;
        }
    }
    return bestMutation;
}

int main () {
    srand((unsigned int)time(NULL));
    char* initialWord = generateInitialWord();
    char* bestMutation = (char*) malloc(TARGET_SIZE * sizeof(char));
    char** copies = (char**) malloc((COPIES_PER_GENERATION* sizeof(char*)));;
    int generation = 0;
    while (getScore(bestMutation) < TARGET_SIZE) {
        copies = reproduce(initialWord);
        bestMutation = selectBestMutation(copies);
        printf("Generation %d -- ", generation);
        for (int i = 0; i < TARGET_SIZE; i++)
            printf("%c", bestMutation[i]);
        printf(" -- score: %d\n",getScore(bestMutation));
        initialWord = bestMutation;
        generation++;
    }
}