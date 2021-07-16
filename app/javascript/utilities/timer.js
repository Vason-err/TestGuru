export default class Timer {
  constructor(timer) {
    this.timer = timer
    this.timerCheck(this.timer)
  }

  timerCheck = (timer) => {
    if (timer) {
      let timerSeconds = parseInt(timer.dataset.seconds);
      setInterval(function() {

        if (timerSeconds == 0) { Timer.submitAnswerForm() }

        let seconds = timerSeconds % 60;
        let minutes = (timerSeconds - seconds) / 60;

        timer.textContent = minutes + ':' + (seconds < 10 ? '0' + seconds : seconds);

        timerSeconds--;
      }, 1000);
    }
  }

  static submitAnswerForm() {
    let form = document.querySelector('#answer-form')
    form.submit()
  }
}