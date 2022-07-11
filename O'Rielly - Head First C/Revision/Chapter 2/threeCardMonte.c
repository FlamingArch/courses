#include <stdio.h>

int main(int argc, char const *argv[])
{
    char cards[] = "JQK";
    char a_card = cards[2]; // K    // Wrongfully Thought Q, Didn't Read Properly
    cards[2] = cards[1];    // JQQ  
    cards[1] = cards[0];    // JJQ
    cards[0] = cards[2];    // QJQ
    cards[2] = cards[1];    // QJJ  // Was correct until now in shuffling
    cards[1] = a_card;      // QkJ  //Initial Mistake at Line 6 Resulted in Guessing QQJ, which was wrong.
    puts(cards);
    return 0;
}