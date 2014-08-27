class CreateBlast6Outputs < ActiveRecord::Migration
  def change
    create_table :blast6_outputs do |t|
      #blast6out format
      t.string :query
      t.string :target
      t.float :percent_identity
      t.integer :alignment_length
      t.integer :number_of_mismatches
      t.integer :number_of_gap_opens
      t.integer :one_based_position_of_start_in_query
      t.integer :one_based_position_of_end_in_query
      t.integer :one_based_position_of_start_in_target
      t.integer :one_based_position_of_end_in_target
      t.float :e_value
      t.float :bit_score
      t.string :type
    end

    add_index :blast6_outputs, [:query, :target]
  end
end
