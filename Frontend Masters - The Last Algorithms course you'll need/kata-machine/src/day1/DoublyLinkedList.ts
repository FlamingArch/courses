type Node<T> = {
    value: T;
    prev?: Node<T>;
    next?: Node<T>;
};

export default class DoublyLinkedList<T> {
    public length: number;
    private head?: Node<T>;
    private tail?: Node<T>;

    constructor() {
        this.length = 0;
        this.head = this.tail = undefined;
    }

    prepend(item: T): void {}
    insertAt(item: T, idx: number): void {}
    append(item: T): void {}
    remove(item: T): T | undefined {}
    get(idx: number): T | undefined {
        let current = this.head;
        for (let i = 0; i < idx && current; i++) {
            current = current.next;
        }
        return current?.value;
    }
    removeAt(idx: number): T | undefined {}
}
