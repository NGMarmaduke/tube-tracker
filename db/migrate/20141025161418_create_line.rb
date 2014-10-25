class CreateLine < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.string :mode_name
      t.string :state
      t.integer :status_severity
      t.string :status_description
      t.string :delay_reason
    end
  end
end
