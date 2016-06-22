if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ' pk_test_36ZFao4RLUflxcOSymrDCujs Roll Key',
    :secret_key => 'sk_test_9WJK4dQ99zd8x7Ypl6utLBEx'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
