export class FormInline {
    constructor(Test) {
        this.test = Test
        this.control = this.test.addEventListener('click', this.formInlineLinkHandler)
    }

    errorHandler() {
        const errors = document.querySelector('.resource-errors')

        if (errors) {
            const resourceId = errors.dataset.resourceId
            this.formInlineHandler(resourceId)
        }
    }

    formInlineLinkHandler(event) {
        event.preventDefault()

        const testId = this.dataset.testId
        this.formInlineHandler(testId)
    }

    formInlineHandler(testId) {
        const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
        const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
        const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

        if (formInline.classList.contains('hide')) {
            testTitle.classList.add('hide')
            formInline.classList.remove('hide')
            link.textContent = 'Cancel'
        } else {
            testTitle.classList.remove('hide')
            formInline.classList.add('hide')
            link.textContent = 'Edit'
        }
    }

}