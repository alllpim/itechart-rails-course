class PersonsController < ApplicationController
  def profile
  end
  class OrdersController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    def index
      # do something
    end

    def show
      # do something
    end

    def create
      # do something
    end
  end
end
