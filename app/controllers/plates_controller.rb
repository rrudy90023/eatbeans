class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @plates = Plate.all.order("created_at DESC")
  end


  def show
  end


  def new
    @plate = current_user.plates.build
  end


  def edit
  end


  def create
    @plate = current_user.plates.build(plate_params)

    
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


   def correct_user
      @plate = current_user.plates.find_by(id: params[:id])
      redirect_to plates_path, notice: "Not authorized to edit this plate" if @plate.nil?
    end


    def plate_params
      params.require(:plate).permit(:description, :recipe, :image)
    end
end
