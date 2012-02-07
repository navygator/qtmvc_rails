class AddInstructorIdToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :instructor_id, :integer
  end
end
