export class ProgressBar {
    constructor(progressBarId) {
        this.progressBar = document.getElementById(progressBarId)
    }

    updateProgress() {
        if (this.progressBar) {
            const progress = this.progressBar.dataset.progress
            this.progressBar.style.width = progress + "%"
        }
    }
}