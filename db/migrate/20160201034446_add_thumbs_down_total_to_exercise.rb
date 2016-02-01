class AddThumbsDownTotalToExercise < ActiveRecord::Migration
  def change
        add_column :exercises, :thumbs_down_total, :integer
  end
end
