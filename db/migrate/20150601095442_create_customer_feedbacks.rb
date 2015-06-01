class CreateCustomerFeedbacks < ActiveRecord::Migration
  def change
    create_table :customer_feedbacks do |t|
      t.string :subject
      t.text :body
      t.integer :customer_id
      t.boolean :viewed

      t.timestamps
    end
  end
end
