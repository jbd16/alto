if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_live_6sav0oNF3xvmgcyv6vUOuGaL',
    :secret_key => 'sk_live_QlWL6GbOFhweMfo5xrtPUK76'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
