import Shape from "./shape";

export default class Rectangle extends Shape {
  override calculateArea(): number {
    return this.width * this.height
  }
}

new Rectangle(2, 2)
