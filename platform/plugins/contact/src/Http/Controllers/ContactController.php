<?php

namespace HuberwayCMS\Contact\Http\Controllers;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Contact\Enums\ContactStatusEnum;
use HuberwayCMS\Contact\Forms\ContactForm;
use HuberwayCMS\Contact\Http\Requests\ContactReplyRequest;
use HuberwayCMS\Contact\Http\Requests\EditContactRequest;
use HuberwayCMS\Contact\Models\Contact;
use HuberwayCMS\Contact\Models\ContactReply;
use HuberwayCMS\Contact\Tables\ContactTable;
use Illuminate\Validation\ValidationException;

class ContactController extends BaseController
{
    public function index(ContactTable $dataTable)
    {
        $this->pageTitle(trans('plugins/contact::contact.menu'));

        return $dataTable->renderTable();
    }

    public function edit(Contact $contact)
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/contact::contact.menu'), route('contacts.index'));

        $this->pageTitle(trans('plugins/contact::contact.edit'));

        return ContactForm::createFromModel($contact)->renderForm();
    }

    public function update(Contact $contact, EditContactRequest $request)
    {
        ContactForm::createFromModel($contact)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('contacts.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Contact $contact)
    {
        return DeleteResourceAction::make($contact);
    }

    public function postReply(Contact $contact, ContactReplyRequest $request)
    {
        $message = BaseHelper::clean($request->input('message'));

        if (! $message) {
            throw ValidationException::withMessages(['message' => trans('validation.required', ['attribute' => 'message'])]);
        }

        EmailHandler::send($message, sprintf('Re: %s', $contact->subject), $contact->email);

        ContactReply::query()->create([
            'message' => $message,
            'contact_id' => $contact->getKey(),
        ]);

        $contact->status = ContactStatusEnum::READ();
        $contact->save();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/contact::contact.message_sent_success'));
    }
}
