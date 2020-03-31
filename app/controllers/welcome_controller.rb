class WelcomeController < CrudController
  def index
    @tags = Item.tag_counts_on(:tags)
  end
end
