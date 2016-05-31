class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :title, null: false
      t.string :description
      t.integer :sq_ft, null: false
      t.integer :floors, null: false
      t.float :price, null: false
      t.boolean :sold, default: false
      t.boolean :disliked, default: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
