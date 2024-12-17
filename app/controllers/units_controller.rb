class UnitsController < ApplicationController
  before_action :set_unit, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  def index
    @units = Unit.all

    respond_to do |format|
      format.html
      format.json { render :json => @units }
    end
  end

  def show
    if @unit.present?
      render json: @unit
    else
      render status: :not_found
    end
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save!
      render json: @unit, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def update
    if @unit.update(unit_params)
      render json: @unit
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @unit.destroy
  end

  private

  def set_unit
    @unit = Unit.find params[:id]
  end

  def unit_params
    params.require(:unit).permit(:property_id, :bedroom_count, :bathroom_count, :square_footage, :rent_price)
  end
end
