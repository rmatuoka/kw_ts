class AddAttachmentPortfolioImgToAdminPortfolios < ActiveRecord::Migration
  def self.up
    change_table :portfolios do |t|
      t.attachment :portfolio_img
    end
  end

  def self.down
    remove_attachment :portfolios, :portfolio_img
  end
end
