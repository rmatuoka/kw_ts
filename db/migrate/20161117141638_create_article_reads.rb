class CreateArticleReads < ActiveRecord::Migration
  def change
    create_table :article_reads do |t|
      t.integer :article_id
      t.boolean :read, :default => 1
      t.string :ip

      t.timestamps null: false
    end
  end
end
