<?php

namespace HuberwayCMS\Setting\Http\Requests;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class EmailTemplateRequest extends Request
{
    public function rules(): array
    {
        return [
            'email_subject' => ['nullable', 'string', 'required_with:email_subject_key'],
            'email_content' => ['required', 'string'],
            'module' => ['required', 'string', 'alpha_dash'],
            'template_file' => ['required', 'string', 'alpha_dash'],
            'status' => [new OnOffRule()],
        ];
    }
}
