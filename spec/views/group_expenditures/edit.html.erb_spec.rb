require 'rails_helper'

RSpec.describe "group_expenditures/edit", type: :view do
  before(:each) do
    @group_expenditure = assign(:group_expenditure, GroupExpenditure.create!(
      group: nil,
      expenditure: nil
    ))
  end

  it "renders the edit group_expenditure form" do
    render

    assert_select "form[action=?][method=?]", group_transaction_path(@group_expenditure), "post" do

      assert_select "input[name=?]", "group_expenditure[group_id]"

      assert_select "input[name=?]", "group_expenditure[expenditure_id]"
    end
  end
end
