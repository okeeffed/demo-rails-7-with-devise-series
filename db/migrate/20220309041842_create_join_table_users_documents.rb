class CreateJoinTableUsersDocuments < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :documents do |t|
      # t.index [:user_id, :document_id]
      # t.index [:document_id, :user_id]
    end
  end
end
