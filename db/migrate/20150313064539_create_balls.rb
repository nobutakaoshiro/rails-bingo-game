class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.integer :num

      t.timestamps null: false
    end
  end
end
