require 'spec_helper'

describe "majors/show" do
  before(:each) do
    @major = assign(:major, stub_model(Major,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
