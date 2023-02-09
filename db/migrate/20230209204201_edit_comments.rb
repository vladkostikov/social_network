class EditComments < ActiveRecord::Migration[7.0]
  def change
    change_table :comments do |t|
      t.references :commentable, polymorphic: true
    end

    remove_column :comments, :post_id, :integer
  end
end
