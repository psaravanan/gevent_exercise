class CreateGroupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :status
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
