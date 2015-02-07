class AddLabelsToElements < ActiveRecord::Migration
  def change
    add_column :elements, :label, :string
  end
end
