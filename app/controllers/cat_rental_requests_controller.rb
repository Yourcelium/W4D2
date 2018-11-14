class CatRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all

    render :index
  end

  def show
    @request = CatRentalRequest.find(params[:id])
    render :show
  end

  def new
    @whatever = CatRentalRequest.new

    render :new
  end

  def create
    cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

    if cat_rental_request.save
      redirect_to cat_rental_request_url(cat_rental_request)
    else
      render json: cat_rental_request.errors.full_messages, status: 422
    end
  end

  def edit
    @request = CatRentalRequest.find(params[:id])

    render :edit
  end

  def update
    cat_rental_request = CatRentalRequest.find(params[:id])

    if cat_rental_request.update(cat_rental_request_params)
      redirect_to cat_rental_request_url(cat_rental_request)
    else
      render json: cat_rental_request.errors.full_messages, status: 422
    end
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
