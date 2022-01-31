document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.progress-line')

    if (control) {
        control.max = control.dataset.total
        control.value = control.dataset.currentQuestionNumber
    }
})
