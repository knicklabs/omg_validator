require 'active_model'

class Thing
  include ActiveModel::Validations

  attr_accessor :alpha, :alpha_numeric, :alpha_dash, :zip_code, :postal_or_zip_code, :postal_code,
    :decimal, :integer, :numeric, :email, :ip_address, :url, :phone

  validates :alpha, alpha: true
  validates :alpha_numeric, alpha_numeric: true
  validates :alpha_dash, alpha_dash: true
  validates :zip_code, zip_code: true
  validates :postal_or_zip_code, postal_or_zip_code: true
  validates :postal_code, postal_code: true
  validates :decimal, decimal: true
  validates :integer, integer: true
  validates :numeric, numeric: true
  validates :email, email: true
  validates :ip_address, ip_address: true
  validates :url, url: true
  validates :phone, phone_number: true

  def initialize(options = {})
    @alpha = options[:alpha] unless options[:alpha].nil?
    @alpha_numeric = options[:alpha_numeric] unless options[:alpha_numeric].nil?
    @alpha_dash = options[:alpha_dash] unless options[:alpha_dash].nil?
    @zip_code = options[:zip_code] unless options[:zip_code].nil?
    @postal_or_zip_code = options[:postal_or_zip_code] unless options[:postal_or_zip_code].nil?
  end
end