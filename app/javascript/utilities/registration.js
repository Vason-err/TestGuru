export class PasswordConfirmation {
  constructor(passwordFieldId, confirmationFieldId) {
    this.password = document.getElementById(passwordFieldId)
    this.passwordConfirmation = document.getElementById(confirmationFieldId)
    this.passwordCheck()
 }

  passwordCheck() {
    if (this.password && this.passwordConfirmation) {
      this.password.addEventListener('input', this.confirmationValidation)
      this.passwordConfirmation.addEventListener('input', this.confirmationValidation)
    }
  }

  confirmationValidation() {
    if (this.password.value === '') { return }

    if (this.password.value === this.passwordConfirmation.value) {
      this.passwordConfirmation.classList.remove('input--error');
      this.passwordConfirmation.classList.add('input--correct');
    } else {
      this.passwordConfirmation.classList.remove('input--correct');
      this.passwordConfirmation.classList.add('input--error');
    }
  }
}
