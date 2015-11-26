class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :user_id
      t.text :mail_recipients
      t.text :severity

      t.timestamps
    end
  end
end
