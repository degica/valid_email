require 'active_model'
require 'active_model/validations'
require 'valid_email/validate_email'

class DomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    r = ValidateEmail.domain_valid?(value)
    record.errors.add attribute, (options[:message] || I18n.t('activerecord.errors.messages.invalid_email')) unless r

    r
  end
end

