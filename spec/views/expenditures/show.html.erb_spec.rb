require 'rails_helper'

RSpec.describe "expenditures/show", type: :view do
  before(:each) do
    @expenditure = assign(:expenditure, Expenditure.create!(
      author: nil,
      name: "Name",
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
