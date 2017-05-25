class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :connectee_id
      t.string :status

      t.timestamps
    end
  end
end
