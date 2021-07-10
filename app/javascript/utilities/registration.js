export class PasswordConfirmation {
    constructor() {
        this.password = document.querySelector('#user_password')
        this.passwordConfirmation = document.querySelector('#user_password_confirmation')
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
