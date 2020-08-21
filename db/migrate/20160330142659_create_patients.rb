class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :patient_number
      t.string :title
      t.date :birtday
      t.text :address
      t.integer :contact_number
      t.text :diagnosis
      t.datetime :consultation_date
      t.string :guardian
      t.string :physician
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
