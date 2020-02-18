class CreateLinks < ActiveRecord::Migration[6.0]
  def up
    create_table :links do |t|
      t.string :url, null: false
      t.string :slug, null: false, index: {unique: true}
      t.integer :visits, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :links
  end
end
