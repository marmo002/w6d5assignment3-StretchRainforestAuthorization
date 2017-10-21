class AddColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :user_id, :integer

    Review.all.each do |r|
      numb = [1, 2].sample
      r.update(user_id: numb)
    end
  end
end
