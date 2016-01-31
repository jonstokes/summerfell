class CreateTransaction
  include Troupe

  expects :guest, :transaction_information_params

  provides :transaction_info do
    TransactionInformation.new(transaction_information_params)
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
    context.fail!(error: transaction.errors) unless transaction.valid?
  end
end