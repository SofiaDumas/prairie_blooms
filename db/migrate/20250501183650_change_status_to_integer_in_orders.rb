class ChangeStatusToIntegerInOrders < ActiveRecord::Migration[7.0]
  def up
    add_column :orders, :status_temp, :integer

    # use a plain Ruby class to avoid loading enum logic
    orders = ActiveRecord::Base.connection.execute("SELECT id, status FROM orders")
    orders.each do |order|
      status_value =
        case order["status"]
        when "pending" then 0
        when "paid" then 1
        when "shipped" then 2
        else 0
        end
      ActiveRecord::Base.connection.execute("UPDATE orders SET status_temp = #{status_value} WHERE id = #{order['id']}")
    end

    remove_column :orders, :status
    rename_column :orders, :status_temp, :status
  end

  def down
    add_column :orders, :status_temp, :string

    orders = ActiveRecord::Base.connection.execute("SELECT id, status FROM orders")
    orders.each do |order|
      status_string =
        case order["status"]
        when 0 then "'pending'"
        when 1 then "'paid'"
        when 2 then "'shipped'"
        else "'pending'"
        end
      ActiveRecord::Base.connection.execute("UPDATE orders SET status_temp = #{status_string} WHERE id = #{order['id']}")
    end

    remove_column :orders, :status
    rename_column :orders, :status_temp, :status
  end
end
