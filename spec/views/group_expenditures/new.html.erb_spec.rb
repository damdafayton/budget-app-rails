require 'rails_helper'

RSpec.describe 'group_expenditures/new', type: :view do
  before(:each) do
    assign(:group_expenditure, GroupExpenditure.new(
                                 group: nil,
                                 expenditure: nil
                               ))
  end

  it 'renders new group_expenditure form' do
    render

    assert_select 'form[action=?][method=?]', group_expenditures_path, 'post' do
      assert_select 'input[name=?]', 'group_expenditure[group_id]'

      assert_select 'input[name=?]', 'group_expenditure[expenditure_id]'
    end
  end
end
