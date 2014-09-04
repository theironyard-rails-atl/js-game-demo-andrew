class CreateHangmen < ActiveRecord::Migration
  def change
    create_table :hangmen do |t|
      t.integer :user_id
      t.string :answer
      t.integer :max_misses, null: false, default: 6
      t.integer :misses, null: false, default: 0
      t.string :guessed, null: false, default: ""

      t.timestamps
    end
  end
end
