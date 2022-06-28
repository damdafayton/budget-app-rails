require 'rails_helper'

RSpec.describe "expenditures/edit", type: :view do
  before(:each) do
    @expenditure = assign(:expenditure, Expenditure.create!(
      author: nil,
      name: "MyString",
      amount: "9.99"
    ))
  end

  it "renders the edit expenditure form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@expenditure), "post" do

      assert_select "input[name=?]", "expenditure[author_id]"

      assert_select "input[name=?]", "expenditure[name]"

      assert_select "input[name=?]", "expenditure[amount]"
    end
  end
end
