class VerificationsController < ApplicationController
  def apple
    render body: Rails.application.credentials.apple[:verification],
      content_type: 'text/plain',
      layout: false
  end
end
