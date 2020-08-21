class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.date :teartment_date
      t.integer :tooth_number
      t.text :remark
      t.float :fee
      t.float :paid
      t.float :balance
      t.float :associate
      t.float :clinic
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :treatments, [:patient_id, :created_at]
  end
end
