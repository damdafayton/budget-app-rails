require 'rails_helper'

RSpec.describe "group_entities/show", type: :view do
  before(:each) do
    @group_entity = assign(:group_entity, GroupEntity.create!(
      group: nil,
      entity: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
