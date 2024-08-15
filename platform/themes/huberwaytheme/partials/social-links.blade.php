<ul class="ps-list--social">
    @for ($i = 1; $i <= 10; $i++)
        @if (theme_option('social-name-' . $i) && theme_option('social-url-' . $i) && theme_option('social-icon-' . $i))
            <li>
                <a href="{{ theme_option('social-url-' . $i) }}"
                   title="{{ theme_option('social-name-' . $i) }}" style="color: {{ theme_option('social-color-' . $i) }}">
                    <i class="fa {{ theme_option('social-icon-' . $i) }}"></i>
                </a>
            </li>
        @endif
    @endfor
</ul>
