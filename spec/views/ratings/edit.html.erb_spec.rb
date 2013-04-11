require 'spec_helper'

describe "ratings/edit" do
  before(:each) do
    @rating = assign(:rating, stub_model(Rating,
      :score => 1,
      :course => nil,
      :user => nil
    ))
  end

  it "renders the edit rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do
      assert_select "input#rating_score[name=?]", "rating[score]"
      assert_select "input#rating_course[name=?]", "rating[course]"
      assert_select "input#rating_user[name=?]", "rating[user]"
    end
  end
end
