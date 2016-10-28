class RemoveRefJobsFromCategory < ActiveRecord::Migration
  def change
    remove_reference(:categories, :job, index: true)
  end
end
