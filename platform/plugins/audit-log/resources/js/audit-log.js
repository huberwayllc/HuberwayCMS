$(() => {
    if (typeof BDashboard !== 'undefined') {
        BDashboard.loadWidget($('#widget_audit_logs').find('.widget-content'), route('audit-log.widget.activities'))
    }

    $(document).on('click', '.empty-activities-logs-button', function (event) {
        event.preventDefault()

        $('#modal-confirm-delete-records').modal('show')

        $('#modal-confirm-delete-records').on('click', '.button-delete-records', (event) => {
            event.preventDefault()
            let _self = $(event.currentTarget)

            $httpClient
                .make()
                .withButtonLoading(_self)
                .get(_self.data('url'))
                .then(({ data }) => {
                    _self.closest('.modal').modal('hide')
                    $('#huberwaycms-audit-log-tables-audit-log-table').DataTable().draw()
                    return HuberwayCMS.showSuccess(data.message)
                })
        })
    })
})
