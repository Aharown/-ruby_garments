class BookingsController < ApplicationController
  before_action :set_garment, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.where(garment_id: params[:garment_id])
  end

  def show
  end

  def new
    @booking = @garment.bookings.build
    @booking.user = current_user
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking marked. 🗒️"
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to garments_path, notice: "Booking canceled. ❌"
  end

  private

  def set_garment
    @garment = Garment.find(params[:garment_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
