$(() => {
    let isExporting = false

    $(document).on('click', '.btn-export-data', function (event) {
        event.preventDefault()

        if (isExporting) {
            return
        }

        const $this = $(event.currentTarget)
        const $content = $this.html()

        HuberwayCMS.showButtonLoading($this)
        isExporting = true

        $httpClient
            .make()
            .withResponseType('blob')
            .post($this.attr('href'))
            .then(({ data }) => {
                let a = document.createElement('a')
                let url = window.URL.createObjectURL(data)
                a.href = url
                a.download = $this.data('filename')
                document.body.append(a)
                a.click()
                a.remove()
                window.URL.revokeObjectURL(url)
            })
            .finally(() => {
                $this.html($content)
                HuberwayCMS.hideButtonLoading($this)
                isExporting = false
            })
    })
})
