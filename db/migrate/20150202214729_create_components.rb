class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.decimal :price
      t.references :form, index: true

      t.timestamps
    end
  end
end
