require 'spec_helper'

describe "majors/new" do
  before(:each) do
    assign(:major, stub_model(Major,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new major form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", majors_path, "post" do
      assert_select "input#major_name[name=?]", "major[name]"
    end
  end
end
