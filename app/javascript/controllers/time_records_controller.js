import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ ]

  connect() {
    $('.timers').each((index, e) => {
      const studentId = $(e).data('student-id')
      const startTime = $(e).data('start-time')
      if (!!startTime) {
        let sec = startTime;
        function pad ( val ) { return val > 9 ? val : "0" + val; }
        setInterval( function(){
            $(`#second-${studentId}`).html(':' + pad(++sec%60))
            $(`#minutes-${studentId}`).html(pad(parseInt(sec/60,10)))
        }, 1000)
      }
    })
  }
}