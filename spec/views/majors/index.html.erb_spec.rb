require 'spec_helper'

describe "majors/index" do
  before(:each) do
    assign(:majors, [
      stub_model(Major,
        :name => "Name"
      ),
      stub_model(Major,
        :name => "Name"
      )
    ])
  end

  it "renders a list of majors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
