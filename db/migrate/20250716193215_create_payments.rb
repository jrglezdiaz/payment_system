class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.integer :account_id
      t.decimal :amount
      t.string :status
      t.datetime :paid_at

      t.timestamps
    end
  end
end
