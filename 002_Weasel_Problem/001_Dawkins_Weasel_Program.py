import random

TARGET = ['M','E','T','H','I','N','K','S',' ','I','T',' ','I','S',' ','L','I','K','E',' ','A',' ','W','E','A','S','E','L']
ALPHABET = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ']
MUTATION_RATE = 0.05
COPIES_PER_GENERATION = 100

def mutate (word):
    for i in range(len(TARGET)):
        if (random.random() < MUTATION_RATE):
            word[i] = ALPHABET[random.randrange(0, len(ALPHABET))]
    return word

def reproduce(word):
    copies = []

    for i in range(COPIES_PER_GENERATION):
        copies.append(mutate(word[:]))
    return copies

def get_score(word):
    score = 0

    for i in range(len(TARGET)):
        if word[i] == TARGET[i]:
            score += 1
    return score

def generate_initial_word():
    initial_word = []

    for i in range(len(TARGET)):
        initial_word.append(ALPHABET[random.randrange(0, len(ALPHABET))])
    return initial_word

def select_best_mutation(copies):
    best_mutation = None
    best_score = -1

    for i in range(COPIES_PER_GENERATION):
        score = get_score(copies[i])
        if score > best_score:
            best_mutation = copies[i]
            best_score = score
    return best_mutation

initial_word = generate_initial_word()
best_mutation = ['' for i in range(len(TARGET))]
generation = 0

while get_score(best_mutation) < len(TARGET):
    copies = reproduce(initial_word)
    best_mutation = select_best_mutation(copies)
    print("Generation " + str(generation) + " -- " + "".join(best_mutation) + " -- score: " + str(get_score(best_mutation)))
    initial_word = best_mutation
    generation += 1
