class CreateSpas < ActiveRecord::Migration[5.0]
  def change
    create_table :spas do |t|
      t.integer :OnsenID
      t.string :OnsenName
      t.string :OnsenNameKana
      t.string :OnsenAddres
      t.string :Prefecture
      t.string :NatureOfOnsen
      t.string :OnsenAreaURL
      t.string :OnsenAreaCaption

      t.timestamps
    end
  end
end
