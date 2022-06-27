require 'rails_helper'

RSpec.describe "group_entities/new", type: :view do
  before(:each) do
    assign(:group_entity, GroupEntity.new(
      group: nil,
      entity: nil
    ))
  end

  it "renders new group_entity form" do
    render

    assert_select "form[action=?][method=?]", group_entities_path, "post" do

      assert_select "input[name=?]", "group_entity[group_id]"

      assert_select "input[name=?]", "group_entity[entity_id]"
    end
  end
end
