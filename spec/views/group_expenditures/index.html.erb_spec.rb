require 'rails_helper'

RSpec.describe "group_expenditures/index", type: :view do
  before(:each) do
    assign(:group_expenditures, [
      GroupExpenditure.create!(
        group: nil,
        expenditure: nil
      ),
      GroupExpenditure.create!(
        group: nil,
        expenditure: nil
      )
    ])
  end

  it "renders a list of group_expenditures" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
