class ChangeEndDateInRaffles < ActiveRecord::Migration[5.1]
  def change
    change_column :raffles, :end_date, :datetime
  end
end
