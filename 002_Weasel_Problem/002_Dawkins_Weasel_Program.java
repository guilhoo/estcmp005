import java.util.Arrays;
import java.util.Random;

public class Weasel {
    final static char[] TARGET = {'M','E','T','H','I','N','K','S',' ','I','T',' ','I','S',' ','L','I','K','E',' ','A',' ','W','E','A','S','E','L'};
    final static char[] ALPHABET = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' '};
    final static float MUTATION_RATE = 0.05f;
    final static int COPIES_PER_GENERATION = 100;
    final static Random random = new Random();

    private static char[] mutate(char[] word) {
        for(int i = 0; i < TARGET.length; i++) {
            if (random.nextFloat() <= MUTATION_RATE) {
                word[i] = ALPHABET[random.nextInt(ALPHABET.length)];
            }
        }
        return word;
    }

    private static char[][] reproduce(char[] word) {
        char[][] copies = new char[COPIES_PER_GENERATION][TARGET.length];
        for (int i = 0; i < COPIES_PER_GENERATION; i++) {
            copies[i] = mutate(word.clone());
        }
        return copies;
    }

    private static int getScore(char[] word) {
        int score = 0;
        for (int i = 0; i < TARGET.length; i++) {
            if (word[i] == TARGET[i]) {
                score++;
            }
        }
        return score;
    }

    private static char[] generateInitalWord() {
        char[] initialWord = new char[TARGET.length];
        for(int i = 0; i < TARGET.length; i++){
            initialWord[i] = ALPHABET[random.nextInt((ALPHABET.length))];
        }
        return initialWord;
    }

    private static char[] selectBestMutation(char[][] copies) {
        char[] bestMutation = null;
        int bestScore = -1; 
        for(int i = 0; i < COPIES_PER_GENERATION; i++) {
            int score = getScore(copies[i]);
            if (score > bestScore) {
                bestMutation = copies[i];
                bestScore = score;
            }
        }
        return bestMutation;
    }

    public static void main(String[] args) {
        char[] initialWord = generateInitalWord();
        char[] bestMutation = new char[TARGET.length];
        char[][] copies;
        int generation = 0;

        while (getScore(bestMutation) < TARGET.length) {
            copies = reproduce(initialWord);
            bestMutation = selectBestMutation(copies);
            System.out.println("Generation " + generation + " -- " + new String(bestMutation) + " -- score: " + getScore(bestMutation));
            initialWord = bestMutation;
            generation++;
        }
    }
}