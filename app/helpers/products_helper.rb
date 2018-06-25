module ProductsHelper
  def create_category_list(category, &func)
    yield category
    category.children.each do |child|
      create_category_list(child, &func)
    end
  end
end