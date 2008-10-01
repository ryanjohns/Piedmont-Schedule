class CreateNurses < ActiveRecord::Migration
  def self.up
    create_table :nurses do |t|
    end
  end

  def self.down
    drop_table :nurses
  end
end
