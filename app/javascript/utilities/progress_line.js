document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.progress-line')

    if (control) {
        control.max = 100
        control.value = control.dataset.currentQuestionNumber / control.dataset.total * 100
    }
})
