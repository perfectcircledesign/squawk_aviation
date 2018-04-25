class CreateArticleJobLookups < ActiveRecord::Migration
  def change
    create_table :article_job_lookups do |t|
      t.integer :job_id
      t.integer :airline_id
      t.integer :article_id

      t.timestamps
    end
  end
end
