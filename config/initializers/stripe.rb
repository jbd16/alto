if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ' pk_test_ewIBmInEbUbT6tub6KAeXZt7',
    :secret_key => ' sk_test_GT64FQuCOtokcLpWB43HA5B8'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
