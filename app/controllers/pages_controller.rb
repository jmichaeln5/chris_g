class PagesController < ApplicationController
  def index
      @set_landing_page = true
      @page_title = "pages/index"
  end

  def about
  end
end
