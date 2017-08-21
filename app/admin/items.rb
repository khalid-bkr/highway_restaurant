ActiveAdmin.register Item do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

ActiveAdmin.register Item do
  permit_params :name, :price, :description, :category, :photo, :photo_cache
end

ActiveAdmin.register Item do
  index do
    selectable_column
    column :id
    column :name
    column :price
    column :description
    column :category
    column :created_at
    actions
  end
end


# f.inputs "Attachment", :multipart => true do
#   f.input :cover_page, :as => :file, :hint => image_tag(f.object.cover_page.url(:thumb))
#   f.input :cover_page_cache, :as => :hidden

  ActiveAdmin.register Item do
  form(:html => { :multipart => true }) do |f|
    f.inputs "Item" do
      f.input :name
      f.input :price
      f.input :description
      f.input :category
      f.input :photo, :as => :file
      f.input :photo_cache, :as => :hidden
    end
    f.submit
  end
end

end
