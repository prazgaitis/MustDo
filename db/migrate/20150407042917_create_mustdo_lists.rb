class CreateMustdoLists < ActiveRecord::Migration
  def change
    create_table :mustdo_lists do |t|
      t.string :title
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
