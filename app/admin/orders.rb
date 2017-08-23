ActiveAdmin.register Order do
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

ActiveAdmin.register Order do
  permit_params :notes, :status, :bill
end

ActiveAdmin.register Order do
  index do
    selectable_column
    column :id
    column :user
    column "address" do |order|
      order.address.area
    end
    column :notes
    column :status
    column :bill
    column "phone_number" do |order|
      order.user.phone_number
    end
    column :created_at
    actions
  end
end

ActiveAdmin.register Order do
  show do
    attributes_table do
      default_attribute_table_rows.each do |field|
        row field
      end

      row "items" do |order|
        order.items.pluck(:name)
      end
    end
  end
end

end
