class CreateDashboards < ActiveRecord::Migration[6.0]
  def change
    create_table :dashboards do |t|
      t.string :headline
      t.string :content
      t.integer :position
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
