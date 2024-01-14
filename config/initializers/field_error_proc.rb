# TODO: We'll want a better solution to this epecially the monkey patch
ActionView::Base.field_error_proc = proc do |html_tag, instance|
  content_tag :div, class: 'has-validation' do
    concat html_tag
    concat content_tag(:div, instance.error_message.join(', '), class: 'invalid-feedback')
  end
end

module ActionView::Helpers::ActiveModelInstanceTag
  def error_message
    object.errors.full_messages_for(@method_name)
  end
end
