class CustomersController < ApplicationController
    def show
        @search = CustomerSearch.find_by_customer_id(params[:id])
        @customer = Customer.find_by_id(params[:id])
        @atm_request = " "
        @bank_request = " "
        @locations = {}
        if @customer.response == "xml"
            if @customer.bank_type == "atm"
                @atm_request = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/#{@customer.response}?&location=#{@search.latitude},#{@search.longitude}&radius=2500&language=#{@customer.language}&type=#{@customer.bank_type}&key=AIzaSyBAnEpGMdG4aeb-chrxedvGa74BYhpY2DI")
                @locations = Nokogiri::HTML(open(@atm_request))
            elsif @customer.bank_type == "bank"
                @bank_request = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/#{@customer.response}?&location=#{@search.latitude},#{@search.longitude}&radius=2500&language=#{@customer.language}&type=#{@customer.bank_type}&key=AIzaSyBAnEpGMdG4aeb-chrxedvGa74BYhpY2DI")
            end
        elsif @customer.response == "json"
            if @customer.bank_type == "atm"
                @atm_request = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/#{@customer.response}?&location=#{@search.latitude},#{@search.longitude}&radius=2500&language=#{@customer.language}&type=#{@customer.bank_type}&key=AIzaSyBAnEpGMdG4aeb-chrxedvGa74BYhpY2DI")
                @locations = JSON.parse(@atm_request)
            elsif @customer.bank_type == "bank"
                @bank_request = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/#{@customer.response}?&location=#{@search.latitude},#{@search.longitude}&radius=2500&language=#{@customer.language}&type=#{@customer.bank_type}&key=AIzaSyBAnEpGMdG4aeb-chrxedvGa74BYhpY2DI")
                @locations = JSON.parse(@bank_request.body)
            end
        end
        binding.pry
        # @locations["results"].each do |result|
        #     print result["name"]
        # end
  
        render 'show'
    end
end