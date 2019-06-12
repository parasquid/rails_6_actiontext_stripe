# Set your secret key: remember to change this to your live secret key in production
# See your keys here: https://dashboard.stripe.com/account/apikeys
Stripe.api_key = Rails.application.credentials.stripe[:api_key]
