class CreateUserAggs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_aggs do |t|
      t.bigint :user_id
      t.decimal :gross_avg
      t.decimal :net_avg
      t.decimal :putts_avg
      t.decimal :three_putts_avg
      t.decimal :greens_in_reg

      t.timestamps
    end
  end
end
