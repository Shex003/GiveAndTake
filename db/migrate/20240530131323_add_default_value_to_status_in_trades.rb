class AddDefaultValueToStatusInTrades < ActiveRecord::Migration[7.1]
  def change
    change_column_default :trades, :status, false
  end
end
