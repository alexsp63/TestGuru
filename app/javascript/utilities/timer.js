document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.timer')

    if (control) {
        const endTime = new Date(control.dataset.endTime)
        const timer = setInterval(function() {
            let startTime = new Date()
            let rest = (endTime - startTime) / 1000
            if (rest >= 0) {
                const hour = Math.floor(rest / 60 / 60)
                const min = Math.floor((rest - hour * 60 * 60) / 60)
                const sec = Math.floor(rest - hour * 60 * 60 - min * 60)
                control.innerHTML = hour.toString().padStart(2, '0') + ":" + min.toString().padStart(2, '0') + ":" + sec.toString().padStart(2, '0')
            } else {
                control.innerHTML = "Time is over"
            }
        }, 1000)
    }
})

