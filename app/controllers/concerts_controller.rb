class ConcertsController < ApplicationController
  def index
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new
  end

  private
    def concert_params
      params.require(:concert).permit(:title)
    end
end
