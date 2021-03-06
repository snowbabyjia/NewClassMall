require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :content => "MyText",
      :course => nil,
      :user => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "textarea#comment_content[name=?]", "comment[content]"
      assert_select "input#comment_course[name=?]", "comment[course]"
      assert_select "input#comment_user[name=?]", "comment[user]"
    end
  end
end
