import LoanValidator from "../interfaces/validator";

export default class LoanRequestHandler {
  constructor(private balance: number) { }

  approveLoan(validator: LoanValidator): boolean {
    return validator.validateLoan(this.balance)
  }
  
}
