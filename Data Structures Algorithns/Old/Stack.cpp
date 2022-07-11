#include <iostream>

class Node
{
public:
    Node *next;
    void *data;
    Node(void *data)
    {
        this->data = data;
        this->next = NULL;
    }
    ~Node();
};

class Stack
{
private:
    Node *start;
    int count;

public:
    Stack()
    {
        this->start = NULL;
        this->count = 0;
    }
    void push(void *data)
    {
        Node *node = new Node(data);
        if (this->start)
        {
            Node *current = this->start;
            this->start = node;
            node->next = current;
        }
        else
            this->start = node;
        this->count++;
    }
    void *peek()
    {
        return this->start->data;
    }
    void *pop()
    {
        Node *node = this->start;
        this->start = this->start->next;
        this->count--;
        return node->data;
    }
    int getCount() { return this->count; }
};

int main(int argc, char const *argv[])
{
    Stack s;
    int a = 1;
    int b = 2;
    ;
    int c = 3;
    s.push(&a);
    s.push(&b);
    s.push(&c);

    std::cout << *(int *)(s.peek()) << std::endl;
    std::cout << *(int *)(s.pop()) << std::endl;
    std::cout << *(int *)(s.pop()) << std::endl;
    std::cout << *(int *)(s.pop()) << std::endl;
    return 0;
}
