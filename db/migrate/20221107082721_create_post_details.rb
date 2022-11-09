class CreatePostDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :post_details do |t|

      t.integer :comment_id,  null: false
      t.integer :customer_id, null: false
      t.text    :blog,        null: false

      t.timestamps
    end
  end
end
