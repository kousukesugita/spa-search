class CreateSpas < ActiveRecord::Migration[5.0]
  def change
    create_table :spas do |t|
      t.string :onsen_code
      t.string :onsen_name
      t.string :onsen_name_kana
      t.string :onsen_address
      t.string :nature_of_onsen

      t.timestamps
    end
  end
end
