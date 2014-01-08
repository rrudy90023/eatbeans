class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]


  def index
    @plates = Plate.all
  end


  def show
  end


  def new
    @plate = Plate.new
  end


  def edit
  end


  def create
    @plate = Plate.new(plate_params)

    
      if @plate.save
        redirect_to @plate, notice: 'Plate was successfully created.'

      else
        render action: 'new'

      end

  end


  def update
 
      if @plate.update(plate_params)
        redirect_to @plate, notice: 'Plate was successfully updated.' 
 
      else
        render action: 'edit'

      end
    
  end


  def destroy
    @plate.destroy
  
      redirect_to plates_url

  end



  private

    def set_plate
      @plate = Plate.find(params[:id])
    end


    def plate_params
      params.require(:plate).permit(:description, :recipe)
    end
end
