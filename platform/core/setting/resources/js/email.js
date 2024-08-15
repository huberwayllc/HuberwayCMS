$(document).ready(function () {
    $('[data-bb-toggle="test-email-send"]').on('click', (event) => {
        event.preventDefault()
        let _self = $(event.currentTarget)
        let form = new FormData(_self.closest('form')[0])

        HuberwayCMS.showButtonLoading(_self)

        $httpClient
            .make()
            .postForm(route('settings.email.update'), form)
            .then(({ data }) => {
                HuberwayCMS.showSuccess(data.message)
                $('#send-test-email-modal').modal('show')
            })
            .finally(() => {
                HuberwayCMS.hideButtonLoading(_self)
            })
    })

    $('#send-test-email-btn').on('click', (event) => {
        event.preventDefault()
        let _self = $(event.currentTarget)

        HuberwayCMS.showButtonLoading(_self)

        $httpClient
            .make()
            .post(route('settings.email.test.send'), {
                email: _self.closest('.modal-content').find('input[name=email]').val(),
            })
            .then(({ data }) => {
                HuberwayCMS.showSuccess(data.message)
                _self.closest('.modal').modal('hide')
            })
            .finally(() => {
                HuberwayCMS.hideButtonLoading(_self)
            })
    })
})
