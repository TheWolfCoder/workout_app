class AddThumbsUpTotalToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :thumbs_up_total, :integer
  end
end
