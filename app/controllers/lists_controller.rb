class ListsController < ApplicationController
# A user can see all the lists GET "lists"
# A user can see the details of a given list and its name GET "lists/42"
# A user can create a new list GET "lists/new"
# POST "lists"

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
