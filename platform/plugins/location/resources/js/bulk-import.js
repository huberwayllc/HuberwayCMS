$(() => {
    const container = $(document).find('.bulk-import')
    const $form = container.find('.form-bulk-import')
    const $button = $form.find('button[type="submit"]')
    let failedRows = []

    const validateData = (file, offset = 0, limit = 1000) => {
        if (offset === 0) {
            container.find('.bulk-import-message').text($button.data('validating-text'))
        }

        $httpClient
            .make()
            .post($form.data('validate-url'), {
                file,
                offset,
                limit,
            })
            .then(({ data: response }) => {
                const { data, message } = response

                if (data && data.count > 0) {
                    container.find('.bulk-import-message').text(message)
                    validateData(file, data.offset)
                    failedRows = [...failedRows, ...data.failed]
                } else {
                    if (failedRows.length > 0) {
                        const $listing = container.find('#imported-listing')
                        const $show = container.find('.show-errors')
                        const failureTemplate = $(document).find('#failure-template').html()

                        let result = ''
                        failedRows.forEach((val) => {
                            result += failureTemplate
                                .replace('__row__', val.row)
                                .replace('__errors__', val.errors.join(', '))
                        })

                        $show.show()

                        container.find('.main-form-message').show()
                        $listing.show().html(result)

                        failedRows = []
                        HuberwayCMS.hideLoading($form)
                        HuberwayCMS.hideButtonLoading($button)
                        dropzone.removeAllFiles()
                        container.find('.bulk-import-message').hide()
                    } else {
                        importData(file)
                    }
                }
            })
    }

    const importData = (file, offset = 0, limit) => {
        if (offset === 0) {
            container.find('.bulk-import-message').text($button.data('importing-text'))

            HuberwayCMS.showButtonLoading($button)
            HuberwayCMS.showLoading($form)
        }

        $httpClient
            .make()
            .post($form.data('import-url'), {
                file,
                offset,
                limit,
            })
            .then(({ data: response }) => {
                const { data, message } = response

                if (data && data.count > 0) {
                    importData(file, data.offset)
                } else {
                    HuberwayCMS.showSuccess(message)

                    if (data.total_message) {
                        container.find('.main-form-message').show()
                        container
                            .find('.bulk-import-message')
                            .removeClass('alert-info')
                            .addClass('alert-success')
                            .text(data.total_message)
                        dropzone.removeAllFiles()

                        HuberwayCMS.hideLoading($form)
                        HuberwayCMS.hideButtonLoading($button)
                    }
                }
            })
    }

    const dropzone = new Dropzone('.location-dropzone', {
        url: $form.data('upload-url'),
        method: 'post',
        headers: {
            'X-CSRF-TOKEN': $form.find('input[name=_token]').val(),
        },
        previewTemplate: $(document).find('#preview-template').html(),
        autoProcessQueue: false,
        chunking: true,
        chunkSize: 1048576,
        acceptedFiles: $form.find('.location-dropzone').data('mimetypes'),
        maxFiles: 1,
        maxfilesexceeded: function (file) {
            this.removeFile(file)
        },
        success: function (file, response) {
            const { data, message } = response

            if (data && data.file_path) {
                validateData(data.file_path)
            }
        },
    })

    $(document).on('submit', $form, function (event) {
        event.preventDefault()

        const $button = $form.find('button[type=submit]')

        if (dropzone.getQueuedFiles().length > 0) {
            HuberwayCMS.showLoading($form)
            HuberwayCMS.showButtonLoading($button)

            container.find('.bulk-import-message').removeClass('alert-success').addClass('alert-info').hide()
            container.find('.show-errors').hide()

            dropzone.processQueue()
        }

        dropzone.on('sending', function () {
            container.find('.bulk-import-message').show().text($button.data('uploading-text'))
        })

        dropzone.on('error', function (file, message) {
            HuberwayCMS.showError(message.message)
        })
    })

    let isDownloadingTemplate = false

    $(document).on('click', '.download-template', function (event) {
        event.preventDefault()
        if (isDownloadingTemplate) {
            return
        }
        const $this = $(event.currentTarget)
        const extension = $this.data('extension')
        const $content = $this.html()

        $this.html($this.data('downloading'))
        $this.addClass('text-secondary')
        isDownloadingTemplate = true

        $httpClient
            .make()
            .withResponseType('blob')
            .post($this.data('url'), { extension })
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
                setTimeout(() => {
                    $this.html($content)
                    $this.removeClass('text-secondary')
                    isDownloadingTemplate = false
                }, 2000)
            })
    })

    $(document).on('submit', '.form-import-available-data', (e) => {
        const currentTarget = $(e.currentTarget)

        $httpClient
            .make()
            .withButtonLoading(currentTarget.find('button[type=submit]'))
            .post(currentTarget.prop('action'), currentTarget.serialize())
            .then(({ error,  data }) => {
                if (error) {
                    HuberwayCMS.showError(data.message)

                    return
                }

                HuberwayCMS.showSuccess(data.message)

                currentTarget[0].reset()
            })
    })
})
