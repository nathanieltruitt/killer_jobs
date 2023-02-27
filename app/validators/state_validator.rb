class StateValidator < ActiveModel::Validator
  def validate(record)
    unless %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE
              NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].include?(record.state)
      record.errors.add :state, 'is not a valid state'
    end
  end
end