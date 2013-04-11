require 'spec_helper'

describe "distributions/edit" do
  before(:each) do
    @distribution = assign(:distribution, stub_model(Distribution,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit distribution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", distribution_path(@distribution), "post" do
      assert_select "input#distribution_name[name=?]", "distribution[name]"
      assert_select "textarea#distribution_description[name=?]", "distribution[description]"
    end
  end
end
