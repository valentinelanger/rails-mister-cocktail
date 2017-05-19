class RemoveImageToCocktails < ActiveRecord::Migration[5.0]
  def change
    remove_column :cocktails, :image_url, :string
  end
end
