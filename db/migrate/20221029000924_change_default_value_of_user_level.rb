class ChangeDefaultValueOfUserLevel < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :user_level, from: nil, to: User.user_levels["user"]
  end
end
