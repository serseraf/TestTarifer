class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :addr
      t.string :obj_hash
      t.string :name

      t.timestamps null: false
    end
  end
end
