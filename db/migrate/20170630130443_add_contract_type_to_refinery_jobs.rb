class AddContractTypeToRefineryJobs < ActiveRecord::Migration
  def change
    add_column :refinery_jobs, :contract_type, :string
  end
end
