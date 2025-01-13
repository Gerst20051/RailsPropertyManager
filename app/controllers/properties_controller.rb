class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update ]
  skip_before_action :verify_authenticity_token

  def index
    @search = params[:search]
    @minBedrooms = params[:minBedrooms]

    @properties = Property.joins(:unit)

    if @search.present?
      wildcard_search = "%#{@search}%"
      @properties = @properties.where("address LIKE ? OR city LIKE ? OR state LIKE ?", wildcard_search, wildcard_search, wildcard_search)
    end

    if @minBedrooms.present?
      @properties = @properties.where({
        units: {
          bedroom_count: @minBedrooms..
        }
      }).includes(:unit)
    end

    unless @search.present? or @minBedrooms.present?
      @properties = @properties.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @properties, include: :unit }
    end
  end

  def show
    if @property.present?
      render json: @property, include: :unit
    else
      render status: :not_found
    end
  end

  def create
    @property = Property.includes(:unit).new(property_params)
    if @property.save!
      render json: @property, include: :unit, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      render json: @property, include: :unit
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find params[:id]
    if @property.present?
      @property.destroy
      head :no_content
    else
      render status: :not_found
    end
  end

  private

  def set_property
    @property = Property.includes(:unit).where(id: params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :city, :state)
  end
end
