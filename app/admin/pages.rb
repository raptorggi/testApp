ActiveAdmin.register Page do
  # collection_action :index, :method => :get do
  #   scope = Page.scoped.all
  #   @collection = scope.page() if params[:q].blank?
  #   @search = scope.metasearch(clean_search_params(params[:q]))
  # end

  index do
    selectable_column
    column :title
    colimn :text do |object|
      object.description.slice(0, 200) << '...'
    end
    actions
  end

  # scope :all_pages
  filter :title

  controller do 
    # before_filter :only => [:show] do
    #   @page = Page.friendly.find(params[:id])
    # end
    # def find_resource
    #   scoped_collection.friendly.find(params[:id])
    # end

    def find_resource
      scoped_collection.friendly.find(params[:id])
      scoped_collection.page(params[:page]).per(10)
    end
    # def paginated_collection
    #   end_of_association_chain.where(visibility: true).page(params[:page]).per(10)
    # end
  end
end
