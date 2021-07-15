class Timer {
  constructor() {
    this.timer = document.querySelector(".timer")
    this.timerCheck(this.timer)
}

  timerCheck = timer => {
    if (timer) {
      let timerSeconds = parseInt(timer.dataset.seconds);
      function submitAnswerForm() {
        let form = document.querySelector('#answer-form')
        form.submit()
      }
      setInterval(function() {

        if (timerSeconds == 0) { submitAnswerForm() }

        let seconds = timerSeconds % 60;
        let minutes = (timerSeconds - seconds) / 60;

        timer.textContent = minutes + ':' + (seconds < 10 ? '0' + seconds : seconds);

        timerSeconds--;
        }, 1000);
    }
  }
}
export default Timer