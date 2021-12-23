# frozen_string_literal: true

class ErrorsController < ApplicationController
  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
