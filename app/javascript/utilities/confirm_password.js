document.addEventListener('turbolinks:load', function() {
    var passwordField = document.querySelector('.inputed-password')
    var passwordConfirmationField = document.querySelector('.confirmed-password')

    if(passwordField && passwordConfirmationField) { 
        passwordField.addEventListener('input', comparePasswords)
        passwordConfirmationField.addEventListener('input', comparePasswords)
    }
})

function comparePasswords() {
    var field = document.querySelector('.confirmed-password')
    var passwordText = document.getElementById('inputed_password').value
    var passwordConfirmationText = document.getElementById('confirmed_password').value
    var matchingIcon = document.querySelector('.octicon-dot-fill')
    if (passwordConfirmationText) {
        matchingIcon.classList.remove('hide')
        if (passwordText != passwordConfirmationText) {
            if (field.classList.contains('correct')) {
                field.classList.remove('correct')
                matchingIcon.classList.remove('confirmation-success')
            }
            matchingIcon.classList.add('confirmation-fail')
            field.classList.add('not-correct')
        } else {
            if (field.classList.contains('not-correct')) {
                field.classList.remove('not-correct')
                matchingIcon.classList.remove('confirmation-fail')
            }
            matchingIcon.classList.add('confirmation-success')
            field.classList.add('correct')
        }
    } else {
        matchingIcon.classList.add('hide')
        if (field.classList.contains('correct')) {
            field.classList.remove('correct')
            matchingIcon.classList.remove('confirmation-success')
        }
        if (field.classList.contains('not-correct')) {
            field.classList.remove('not-correct')
            matchingIcon.classList.remove('confirmation-fail')
        }
    }
}
