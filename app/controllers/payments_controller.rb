class PaymentsController < ApplicationController
  def new
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      subscription_data: {
        items: [{
          plan: Rails.application.credentials.stripe[:subscription_plan_id],
        }],
      },
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel',
    )
  end
end
