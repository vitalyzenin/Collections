class ItemsController < CrudController
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'
  
  def show
    @item = Item.preload(item_option_values: :item_option).find(params.fetch(:id))
    @collection = @item.collection
  end

  def new
    @collection = current_user.collections.find(params.fetch(:collection_id))
    @item = Item.new
    @collection.item_options.each do |item_option|
      @item.item_option_values.new(item_option: item_option)
    end
  end

  def edit
    @collection = current_user.collections.find(params.fetch(:collection_id))
    @item = @collection.items.find(params.fetch(:id))

    existing_item_option_ids = @item.item_option_values.pluck(:item_option_id)
    @collection.item_options.each do |item_option|
      @item.item_option_values.new(item_option: item_option) unless item_option.id.in?(existing_item_option_ids)
    end
  end

  def create
    collection = current_user.collections.find(params.fetch(:collection_id))
    if (collection.user == current_user)
      @item = collection.items.create(item_params)
    end
    redirect_to collection_path(collection)
  end

  def update
    collection = current_user.collections.find(params.fetch(:collection_id))
    item = collection.items.find(params.fetch(:id))
    if (item.collection.user == current_user)
      @item = item.update(item_params)
    end
    redirect_to collection_path(collection)
  end

  def destroy
    collection = current_user.collections.find(params.fetch(:collection_id))
    @item = collection.items.find(params.fetch(:id))
    if (@item.collection.user == current_user)
      @item.destroy!
    end
    redirect_to collection_path(collection)
  end

  private
  def item_params
    params.require(:item).permit(:name, :tag_list, item_option_values_attributes: [:id, :int_content, :str_content, :date_content, :text_content,
                                                                                   :bool_content, :_destroy, :item_option_id])
  end
end
