import LoanValidator from "../interfaces/validator";

export default class BusinessLoanValidator implements LoanValidator {
  constructor(public balance: number) { }

  validateLoan(amount: number): boolean {
    return this.balance >= 50000
  }
}
