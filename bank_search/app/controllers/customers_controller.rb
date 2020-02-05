class CustomersController < ApplicationController
    def show
        @search = CustomerSearch.find_by_customer_id(params[:id])
        @customer = Customer.find_by_id(params[:id])
        render 'show'
    end
end