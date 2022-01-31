document.addEventListener('turbolinks:load', function() {
    const userForm = document.querySelector('.new_user')

    const passwordConfirmationField = document.querySelector('.confirmed-password')
    const password = document.getElementById('inputed_password')
    const passwordConfirmation = document.getElementById('confirmed_password')

    const matchingIcon = document.querySelector('.octicon-dot-fill')

    if (password || passwordConfirmation) {
        userForm.addEventListener('input', function() {
            if (passwordConfirmation.value) {
                matchingIcon.classList.remove('hide')
                if (password.value != passwordConfirmation.value) {
                    if (passwordConfirmationField.classList.contains('correct')) {
                        passwordConfirmationField.classList.remove('correct')
                        matchingIcon.classList.remove('confirmation-success')
                    }
                    matchingIcon.classList.add('confirmation-fail')
                    passwordConfirmationField.classList.add('not-correct')
                } else {
                    if (passwordConfirmationField.classList.contains('not-correct')) {
                        passwordConfirmationField.classList.remove('not-correct')
                        matchingIcon.classList.remove('confirmation-fail')
                    }
                    matchingIcon.classList.add('confirmation-success')
                    passwordConfirmationField.classList.add('correct')
                }
            } else {
                matchingIcon.classList.add('hide')
                if (passwordConfirmationField.classList.contains('correct')) {
                    passwordConfirmationField.classList.remove('correct')
                    matchingIcon.classList.remove('confirmation-success')
                }
                if (passwordConfirmationField.classList.contains('not-correct')) {
                    passwordConfirmationField.classList.remove('not-correct')
                    matchingIcon.classList.remove('confirmation-fail')
                }
            }
        })
    }
})
