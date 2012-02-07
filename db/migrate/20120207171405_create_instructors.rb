class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :fio
      t.string :email

      t.timestamps
    end
  end
end
