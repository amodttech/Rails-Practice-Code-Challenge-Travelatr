class BloggersController < ApplicationController

    # def index

    # end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        @blogger.save
        redirect_to blogger_path(@blogger)
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age, :likes)
    end

end