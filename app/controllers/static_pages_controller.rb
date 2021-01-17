require 'flickr'

class StaticPagesController < ApplicationController
    before_action :init_flickr, only: [:search]

    def index
    end

    def show
    end

    def search
        if params[:user_id]
            @photos = @flickr.photos.search :user_id => params[:user_id]
            p @photos
        end
    end

    private

    def init_flickr
        @flickr = Flickr.new
        p "This worked"
    end
end
