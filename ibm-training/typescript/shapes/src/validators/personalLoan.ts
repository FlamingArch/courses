import LoanValidator from "../interfaces/validator";

export default class PersonalLoanValidator implements LoanValidator {
  constructor(public balance: number) { }

  validateLoan(amount: number): boolean {
    return this.balance >= 5000
  }
}
