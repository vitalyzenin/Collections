class WelcomeController < CrudController
  def index
    @tags = Item.tag_counts_on(:tags)
    @latest_items = Item.all.order(created_at: :desc).limit(5)
  end
end
