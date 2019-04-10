class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end
# methods to edit, update and delete data from db
  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path, notice: "Room succesfully updated"
    else
      render :edit
    end  
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy

    redirect_to rooms_path, notice: "Room succesfully deleted"
  end



  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url, :price_per_night)
    end
end
