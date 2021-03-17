class PagesController < ApplicationController
  def index
      @set_page_title = true
      @page_title = "pages/index"
  end

  def about
  end
end
