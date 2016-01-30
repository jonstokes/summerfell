class CreateGuest
  include Troupe

  expects :guest_params, :transaction_information_params

  provides :guest do
    Guest.create(guest_params)
  end

  provides :transaction_info do
    TransactionInformation.new(transaction_information_params)
  end

  provides :transaction

  def call
    context.fail!(error: guest.errors) unless guest.valid?

    self.transaction = Recurly::Transaction.create(
      :amount_in_cents => guest.package.price_cents,
      :currency        => guest.package.currency,
      :account         => {
        :account_code => guest.id,
        :billing_info => transaction_info.billing_info
      }
    )
  end
end