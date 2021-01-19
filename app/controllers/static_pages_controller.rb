

class StaticPagesController < ApplicationController
    before_action :init_flickr, only: [:search]

    def search
        if params[:user_id]
            begin
                @photos = @flickr.photos.search :user_id => params[:user_id]
            rescue Flickr::FailedResponse => e
                flash.now[:alert] = "No user found with ID #{params[:user_id]}. Please try again"
                @search_success = false
            end
        else
            @photos = @flickr.interestingness.getList(per_page: 18).photos
            @search_success = true
        end
    end

    private

    def init_flickr
        @flickr = Flickr.new
    end
end
