class SpicesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

    def index
        spice = Spice.all
        render json: spice, status: :ok
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

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end


    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def render_not_found_message
        render json: { error: 'spice not Found' }, status: :not_found
    end

end

# GET /spices: return an array of all spices
# POST /spices: create a new spice
# PATCH /spices/:id: update an existing spice
# DELETE /spices/:id: delete an existing spice
