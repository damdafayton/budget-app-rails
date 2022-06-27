require 'rails_helper'

RSpec.describe "group_entities/edit", type: :view do
  before(:each) do
    @group_entity = assign(:group_entity, GroupEntity.create!(
      group: nil,
      entity: nil
    ))
  end

  it "renders the edit group_entity form" do
    render

    assert_select "form[action=?][method=?]", group_entity_path(@group_entity), "post" do

      assert_select "input[name=?]", "group_entity[group_id]"

      assert_select "input[name=?]", "group_entity[entity_id]"
    end
  end
end
