class CreateJoinTableCategoryArticle < ActiveRecord::Migration
  def change
    create_join_table :categories, :articles do |t|
      # t.index [:category_id, :article_id]
      # t.index [:article_id, :category_id]
    end
  end
end
