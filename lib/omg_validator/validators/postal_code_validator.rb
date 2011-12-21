module OmgValidator
  module Validators
    class PostalCodeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return nil if value.nil?
        reg = /^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$/i
        unless reg.match(value)
          record.errors[attribute] = "must be a valid postal code"
        end
      end
    end
  end
end

ActiveModel::Validations::PostalCodeValidator = OmgValidator::Validators::PostalCodeValidator