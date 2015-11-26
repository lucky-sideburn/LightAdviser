class CreateMykeys < ActiveRecord::Migration
  def change
    create_table :mykeys do |t|
      t.string :content
      t.string :user_id

      t.timestamps
    end
  end
end
