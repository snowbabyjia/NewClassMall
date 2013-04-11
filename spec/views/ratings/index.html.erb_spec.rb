require 'spec_helper'

describe "ratings/index" do
  before(:each) do
    assign(:ratings, [
      stub_model(Rating,
        :score => 1,
        :course => nil,
        :user => nil
      ),
      stub_model(Rating,
        :score => 1,
        :course => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of ratings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
