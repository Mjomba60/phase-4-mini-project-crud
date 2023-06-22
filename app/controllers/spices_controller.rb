class SpicesController < ApplicationController
    def index
        render json: Spice.all, status: :ok
    end
end
