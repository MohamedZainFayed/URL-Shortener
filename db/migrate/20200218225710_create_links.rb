class CreateLinks < ActiveRecord::Migration[6.0]
  def up
    create_table :links do |t|
      t.string :url, index: {unique: true}
      t.string :slug, index: {unique: true}
      t.integer :visits, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :links
  end
end
