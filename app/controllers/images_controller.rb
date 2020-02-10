class ImagesController < ApplicationController
  def new
    @image = Image.new
    @image.images.new
  end
end
