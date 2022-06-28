require 'rails_helper'

RSpec.describe 'group_expenditures/show', type: :view do
  before(:each) do
    @group_expenditure = assign(:group_expenditure, GroupExpenditure.create!(
                                                      group: nil,
                                                      expenditure: nil
                                                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
