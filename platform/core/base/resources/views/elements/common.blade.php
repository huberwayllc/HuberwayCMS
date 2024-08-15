<script type="text/javascript">
    var HuberwayCMSVariables = HuberwayCMSVariables || {};

    @if (Auth::guard()->check())
        HuberwayCMSVariables.languages = {
            tables: {{ Js::from(trans('core/base::tables')) }},
            notices_msg: {{ Js::from(trans('core/base::notices')) }},
            pagination: {{ Js::from(trans('pagination')) }},
        };
        HuberwayCMSVariables.authorized =
            "{{ setting('membership_authorization_at') && Carbon\Carbon::now()->diffInDays(Carbon\Carbon::createFromFormat('Y-m-d H:i:s', setting('membership_authorization_at'))) <= 7 ? 1 : 0 }}";
    @else
        HuberwayCMSVariables.languages = {
            notices_msg: {{ Js::from(trans('core/base::notices')) }},
        };
    @endif
</script>

@push('footer')
    @if (Session::has('success_msg') || Session::has('error_msg') || (isset($errors) && $errors->any()) || isset($error_msg))
        <script type="text/javascript">
            $(function() {
                @if (Session::has('success_msg'))
                    HuberwayCMS.showSuccess('{{ BaseHelper::clean(addslashes(session('success_msg'))) }}');
                @endif
                @if (Session::has('error_msg'))
                    HuberwayCMS.showError('{{ BaseHelper::clean(addslashes(session('error_msg'))) }}');
                @endif
                @if (isset($error_msg))
                    HuberwayCMS.showError('{{ BaseHelper::clean(addslashes($error_msg)) }}');
                @endif
                @if (isset($errors))
                    @foreach ($errors->all() as $error)
                        HuberwayCMS.showError('{{ BaseHelper::clean(addslashes($error)) }}');
                    @endforeach
                @endif
            })
        </script>
    @endif
@endpush
