class AddJalanprefcodeToPrefectures < ActiveRecord::Migration[5.0]
  def change
    add_column :prefectures, :jalanprefcode, :string
  end
end