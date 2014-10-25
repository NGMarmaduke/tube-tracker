class ChangeDelayDescriptionToText < ActiveRecord::Migration
  def change
    change_column :lines, :delay_reason, :text
  end
end
