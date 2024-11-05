class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.boolean :status
      t.references :initiator, null: false
      t.references :receiver, null: false
      t.references :offered_item, null: false
      t.references :requested_item, null: false

      t.timestamps
    end

    add_foreign_key :trades, :users, column: :initiator_id
    add_foreign_key :trades, :users, column: :receiver_id
    add_foreign_key :trades, :items, column: :offered_item_id
    add_foreign_key :trades, :items, column: :requested_item_id

  end
end
