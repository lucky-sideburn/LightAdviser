class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :user_id
      t.string :metric_name
      t.string :server
      t.string :label
      t.text :data

      t.timestamps
    end
  end
end
