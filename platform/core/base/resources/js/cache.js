class CacheManagement {
    init() {
        $(document).on('click', '.btn-clear-cache', (event) => {
            event.preventDefault()

            let _self = $(event.currentTarget)

            HuberwayCMS.showButtonLoading(_self)

            $httpClient
                .make()
                .post(_self.data('url'), { type: _self.data('type') })
                .then(({ data }) => HuberwayCMS.showSuccess(data.message))
                .finally(() => HuberwayCMS.hideButtonLoading(_self))
        })
    }
}

$(() => {
    new CacheManagement().init()
})
