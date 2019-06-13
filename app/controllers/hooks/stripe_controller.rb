class Hooks::StripeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def events
    payload = request.body.read
    endpoint_secret = Rails.application.credentials.stripe[:endpoint_secret]
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      status 400
      return
    end

    # Handle the checkout.session.completed event
    if event['type'] == 'checkout.session.completed'
      session = event['data']['object']

      # Fulfill the purchase...
      # byebug
    end
  end
end
