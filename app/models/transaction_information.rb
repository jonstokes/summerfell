class TransactionInformation
  include Virtus.model

  attribute :cc_number
  attribute :security_code
  attribute :cc_expiry_month
  attribute :cc_expiry_year
  attribute :first_name
  attribute :last_name
  attribute :company_name
  attribute :address_line_1
  attribute :address_line_2
  attribute :city
  attribute :state
  attribute :zip
  attribute :country

  def to_recurly_billing_info
    {
      first_name: first_name,
      last_name: last_name,
      company_name: company_name,
      address1: address_line_1,
      address2: address_line_2,
      city: city,
      state: state,
      zip: zip,
      country: country,
      number: cc_number,
      verification_value: security_code,
      month: cc_expiry_month,
      year: cc_expiry_year
    }
  end
end