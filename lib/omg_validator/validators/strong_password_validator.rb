module OmgValidator
  module Validators
    # Checks whether password input is a strong password
    # Must contain a least one number, one lower case letter and one upper case letter and must be at least 8 characters
    #
    # validates :password, strong_password: true
    #
    # matches: ASdj3j3jsS, 8#adCje3, pwd#fdJa9, To34zNbsr30,
    # does not match: password, sdfsdfs3, Jsdsdsdj, G3hn$h
    class StrongPasswordValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return nil if value.nil?
        reg = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/
        unless reg.match(value)
          record.errors[attribute] = "must contain at least a number, a lower case letter, a upper case letter and must be at least 8 characters"
        end
      end
    end
  end
end

ActiveModel::Validations::StrongPasswordValidator = OmgValidator::Validators::StrongPasswordValidator