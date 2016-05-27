class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :title
      t.string :description
      t.integer :sq_ft
      t.integer :floors
      t.belongs_to :seller, index: true

      t.timestamps null: false
    end
  end
end
