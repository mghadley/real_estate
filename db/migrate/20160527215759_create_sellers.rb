class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :testimonials

      t.timestamps null: false
    end
  end
end
