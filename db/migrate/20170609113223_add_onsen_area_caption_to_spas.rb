class AddOnsenAreaCaptionToSpas < ActiveRecord::Migration[5.0]
  def change
    add_column :spas, :onsen_area_caption, :text
  end
end
