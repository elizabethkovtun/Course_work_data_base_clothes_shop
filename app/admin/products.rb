ActiveAdmin.register Product do
  permit_params :title, :description, :price, :category_id, :image
end
