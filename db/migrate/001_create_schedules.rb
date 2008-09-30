class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.column :date, :datetime
    end
  end

  def self.down
    drop_table :schedules
  end
end
