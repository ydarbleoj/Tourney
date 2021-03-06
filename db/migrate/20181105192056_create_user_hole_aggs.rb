class CreateUserHoleAggs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_hole_aggs do |t|
      t.bigint :user_id
      t.bigint :hole_id
      t.decimal :net_avg
      t.decimal :gross_avg
      t.decimal :putts_avg
      t.decimal :three_putts_avg
      t.integer :count
      t.decimal :greens_in_reg
      t.integer :par
      t.timestamps
    end
  end
end
