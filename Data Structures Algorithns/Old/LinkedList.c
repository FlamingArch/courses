#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int data;
    struct Node *next;
} Node;

int getChoiceFromMenu();
int performAction(Node **, int);
void insertBeginning(Node **, int);
void insertEnd(Node **, int);
void insert(Node **, int, int);
void print(Node *);

// Bitch Lasagna
int main(int argc, char const *argv[])
{
    printf("LINKED LIST");
    Node *head = NULL;
    int runMore = 1;
    while (runMore)
        runMore = performAction(&head, getChoiceFromMenu());
    return 0;
}

int getChoiceFromMenu()
{
    int choice = 69420;
    printf("\n1. Insert Element at Beginning\n");
    printf("2. Insert Element at End\n");
    printf("3. Insert Element at Position\n");
    printf("4. Display List\n");
    printf("5. Exit\n > ");
    scanf("%d", &choice);
    return choice;
}

int performAction(Node **head, int choice)
{
    int runMore = 1;
    int n, i;
    switch (choice)
    {
    case 1:
        printf("\nEnter element to insert: > ");
        scanf("%d", &n);
        insertBeginning(head, n);
        break;
    case 2:
        printf("\nEnter element to insert: > ");
        scanf("%d", &n);
        insertEnd(head, n);
        break;
    case 3:
        printf("\nEnter element to insert: > ");
        scanf("%d", &n);
        printf("\nEnter position to insert: > ");
        scanf("%d", &i);
        insert(head, n, i);
    case 4:
        print(*head);
        break;
    case 5:
        runMore = 0;
        break;
    default:
        break;
    }
    return runMore;
}

void insertBeginning(Node **head, int data)
{
    Node *temp = (Node *)malloc(sizeof(Node));
    temp->data = data;
    temp->next = *head != NULL ? *head : NULL;
    *head = temp;
}
void insertEnd(Node **head, int data)
{
    Node *temp = (Node *)malloc(sizeof(Node));
    temp->data = data;
    temp->next = NULL;
    Node *current = *head != NULL ? *head : NULL;
    while (current->next != NULL)
    {
        current = current->next;
    }

    current->next = temp;
}
void insert(Node **head, int data, int iter)
{
    Node *temp = (Node *)malloc(sizeof(Node));
    temp->data = data;
    temp->next = NULL;
    Node *current = *head;
    for (int i = 0; i < iter; i++)
    {
        current = current->next;
    }

    current->next = temp;
}

void print(Node *head)
{
    if (head == NULL)
    {
        printf("List is Empty\n");
        return;
    }
    else
    {
        do
        {
            printf("%d ", head->data);
            head = head->next;
        } while (head->next != NULL);
    }
}