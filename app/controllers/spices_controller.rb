class SpicesController < ApplicationController
    def index
        render json: Spice.all, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    private

    def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
    end
end
