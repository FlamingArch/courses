import LoanRequestHandler from "./handlers/loanRequest";
import Rectangle from "./rectangle";
import Shape from "./shape";
import Triangle from "./triangle";
import LoanType from "./types/LoanType";
import BusinessLoanValidator from "./validators/businessLoan";
import PersonalLoanValidator from "./validators/personalLoan";

class Main {
  static display(shape: Shape) {
    console.log(`Area of ${shape} is ${shape.calculateArea()}`);
  }

  static processLoanApplication(loanAmount: number, type: LoanType) {
    console.log(type);
    const handler = new LoanRequestHandler(loanAmount)
    switch (type) {
      case LoanType.personal:
        handler.approveLoan(new PersonalLoanValidator(loanAmount))
      case LoanType.business:
        handler.approveLoan(new BusinessLoanValidator(loanAmount))
      default:
        throw new Error("Invalid Loan Type")
    }
  }

}

const rectangle = new Rectangle(23.4, 34.5);
const triangle = new Triangle(23.4, 34.5);

Main.display(rectangle);
Main.display(triangle);

Main.processLoanApplication(10000, LoanType.personal);

// There is no separate child node constructed for child nodes.


