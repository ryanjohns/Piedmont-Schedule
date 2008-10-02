class CreateCases < ActiveRecord::Migration
  def self.up
    create_table :cases do |t|
      t.column :schedule_id, :integer
      t.column :status, :string, :default => ""
      t.column :patient_location, :string, :default => ""
      t.column :or_number, :integer
      t.column :start_time, :datetime
      t.column :definite_start_time, :boolean, :default => true
      t.column :patient_name, :string
      t.column :procedure, :string
      t.column :surgeon, :string
      t.column :additional_surgeon, :string
      t.column :nurse, :string
      t.column :technician, :string
      t.column :isolate, :boolean, :default => false
      t.column :latex_allergy, :boolean, :default => false
    end
  end

  def self.down
    drop_table :cases
  end
end
