class AddLmsAccessReferenceToOdsaModuleProgresses < ActiveRecord::Migration
  def change
    add_column :odsa_module_progresses, :lms_access_id, :integer
    add_foreign_key :odsa_module_progresses, :lms_accesses
  end
end
