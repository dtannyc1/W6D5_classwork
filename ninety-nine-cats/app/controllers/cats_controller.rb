class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index 
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def edit
        
    end

    def update
    end

    def new
    end

    def create
    end

    private
    def cat_params
        params.require(:cats).permit(:name, :color, :sex, :birth_date, :description)
    end

end