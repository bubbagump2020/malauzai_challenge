class SearchesController < ApplicationController

    def index

    end

    def new
        render 'new'
    end

    def create
        @search = Search.new(search_params)
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
        params.permit(:name, :lat, :long)
    end


end