function simpleDecorator(constructor: Function) {
  console.log("My Decorator called")
}

function propertyDecorator(target: any, propertyKey: string) {
  console.log(`Target: ${target}`)
  console.log(`Target Constructor: ${target.constructor}`)
  console.log(`Property Name: ${propertyKey}`)
}

function methodDecorator(target: any, methodName: string, descriptor?: PropertyDescriptor) {
  console.log(`Method Descriptor: ${methodName} called`)
}

@simpleDecorator
class WithDecorator {
  @propertyDecorator
  productId: number = 1

  constructor() {
    console.log("Inside Constructor")
  }

  @methodDecorator
  print() {
    console.log("Print Called")
  }
}

const instance = new WithDecorator()
instance.print()
