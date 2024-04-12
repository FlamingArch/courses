import Shape from "./shape";

export default class Triangle extends Shape {
  calculateArea(): number {
    return 0.5 * this.width * this.height
  }
}

new Triangle(2, 2)
