class CreateBaums < ActiveRecord::Migration
  def change
    create_table :baums do |t|
      t.string :name
      t.decimal :price
      t.string :label

      t.timestamps
    end
  end
end
