class SearchesController < ApplicationController

    def show
        @url = Url.site
        @search = Search.find_by_id(params[:id])
        @full_url = RestClient.get("#{@url}json?input=#{@search.name}&inputtype=textquery&field=name,type,locations,language&locationbias=point:#{@search.latitude},#{@search.longitude}&key=AIzaSyBAnEpGMdG4aeb-chrxedvGa74BYhpY2DI")
        @response = JSON.parse(@full_url.body)
        print @response
    end

    def index
        @searches = Search.all
        render 'index'
    end

    def create
        @search = Search.new(search_params)
        if @search.save
            redirect_to '/'
        else
            flash[:failure] = "You Failed!"
        end
    end

    private

    def search_params
        params.require(:search).permit(:name, :latitude, :longitude)
    end

end