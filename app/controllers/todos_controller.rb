class TodosController < ApplicationController
  def index
    @todos = List.all
  end

  def show 
    @todo = List.find(params[:id])
  end

  def new 
    @todo = List.new
  end

  def create
    @todo = List.new(article_params)

    if @todo.save
      redirect_to todo_path(@todo)
    else
      render :new
    end
  end

  def edit
    @todo = List.find(params[:id])
  end

  def update
    @todo = List.find(params[:id])

    if @todo.update(article_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def destroy
    @todo = List.find(params[:id])
    @todo.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:list).permit(:title, :body)
    end
end
