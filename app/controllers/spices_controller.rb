class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        render json: Spice.all, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :ok
    end

    private

    def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found
        render json: {error: "Spice not found"}, status: :not_found
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end
end
