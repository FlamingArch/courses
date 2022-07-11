class Stack {
  constructor() {
    this.top = -1;
    this.items = {};
  }

  get peek() {
    return this.items[this.top];
  }

  push(value) {
    this.top += 1;
    this.items[this.top] = value;
  }

  pop(value) {
    let item = this.items[this.top];
    this.items[this.top] = undefined;
    this.top -= 1;
    return item;
  }
}

describe("My Stack", () => {
  let stack;

  // Runs before each test,
  // gives a new object before each test
  beforeEach(() => {
    stack = new Stack();
  });

  //   it.todo("is created empty");
  it("is created empty", () => {
    // const stack = new Stack();

    expect(stack.top).toBe(-1); // Check for Reference
    expect(stack.items).toEqual({}); // Check for Value Equality
  });

  //   it.todo("can push to the top")
  it("can push to the top", () => {
    stack.push("🥑");
    expect(stack.top).toBe(0);
    expect(stack.peek).toBe("🥑");
  });

  //   it.todo("can pop off");
  it("can pop off", () => {
    stack.push("🥑");
    let item = stack.pop();
    expect(stack.top).toBe(-1);
    expect(item).toBe("🥑");
  });
});
