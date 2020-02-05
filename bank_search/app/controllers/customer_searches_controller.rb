class CustomerSearchesController < ApplicationController

    def index
        @searches = CustomerSearch.all
        render 'index'
    end

    def create
        @customer = Customer.find_by_name(search_params[:name])
        if @customer != nil
            @search = CustomerSearch.new({
            customer_id: @customer.id,
            name: @customer.name,
            latitude: search_params[:latitude],
            longitude: search_params[:longitude]
        })
            if @search.save
                redirect_to "/customer_searches"
            end
        else
            flash[:notice] = "User Does Not Exist"
        end
    end

    def show
        @customer = Customer.find_by(:customer_id)
        binding.pry
        render 'show'
    end

    private

    def search_params
        params.permit(:commit, :name, :latitude, :longitude)
    end

end
