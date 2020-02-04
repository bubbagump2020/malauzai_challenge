class SearchesController < ApplicationController

    def index
        @searches = Search.all
        render 'index'
    end

    def new
        @search = Search.new
        render 'new'
    end

    def create
        @search = Search.create(search_params)
        if @search.save
            flash[:success]
        else
            flasj[:failure]
        end
    end

    def show

    end

    private

    def search_params
        params.require(:search).permit(:name, :lat, :long)
    end


end