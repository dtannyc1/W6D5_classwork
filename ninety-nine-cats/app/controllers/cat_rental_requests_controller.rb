
class CatRentalRequestsController < ApplicationController 
    
    def new 
        if params[:cat_id]
            @cat_rental_request = CatRentalRequest.new(cat_id: params[:cat_id])
        else
            @cat_rental_request = CatRentalRequest.new
        end
        render :new
    end

    def create
        @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
            if @cat_rental_request.save
                @cat = Cat.find_by(id: @cat_rental_request.cat_id)
                redirect_to cat_url(@cat)
            else
                render :new 
            end
    end

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end

end