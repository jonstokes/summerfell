class CreateTransaction
  include Troupe

  expects :guest, :params

  provides :transaction_info do
    TransactionInformation.new(transaction_params)
  end

  provides :transaction do
    Recurly::Transaction.create(
      :amount_in_cents => guest.package.price_cents,
      :currency        => guest.package.currency,
      :account         => {
        :account_code => guest.id,
        :billing_info => transaction_info.to_recurly_billing_info
      }
    )
  end

  def call
    return if guest.plan.free?
    context.fail!(error: transaction_info.errors) unless transaction_info.valid?
    context.fail!(error: transaction.errors) unless transaction.valid?
  end

  def transaction_params
    params.slice(
      :cc_number,
      :security_code,
      :cc_expiry_month,
      :cc_expiry_year,
      :first_name,
      :last_name,
      :company_name,
      :address_line_1,
      :address_line_2,
      :city,
      :state,
      :zip,
      :country
    )
  end

end