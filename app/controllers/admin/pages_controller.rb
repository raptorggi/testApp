module Admin
  class PagesController < Admin::ApplicationController
    def index
      @pages = Page.all
    end

    def show
      @page = Page.friendly.find(params[:id])
    end

    def edit
      @page = Page.find(params[:id])
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)
      if @page.save
        redirect_to admin_page_path(@page)
      else
        render :new
      end
    end

    def destroy
      Page.delete(params[:id])
      redirect_to admin_pages_path
    end

    def update
      @page = Page.friendly.find(params[:id])
      if @page.update(page_params)
        redirect_to admin_page_path(@page)
      else
        render :edit
      end
    end

    def page_params
      params.require(:page).permit(:title, :text)
    end
  end
end
