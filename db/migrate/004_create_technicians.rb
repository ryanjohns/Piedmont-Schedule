class CreateTechnicians < ActiveRecord::Migration
  def self.up
    create_table :technicians do |t|
    end
  end

  def self.down
    drop_table :technicians
  end
end
