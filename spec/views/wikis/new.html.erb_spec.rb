require 'spec_helper'

describe "wikis/new" do
  before(:each) do
    assign(:wiki, stub_model(Wiki,
      :user => nil,
      :name => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new wiki form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wikis_path, "post" do
      assert_select "input#wiki_user[name=?]", "wiki[user]"
      assert_select "input#wiki_name[name=?]", "wiki[name]"
      assert_select "textarea#wiki_body[name=?]", "wiki[body]"
    end
  end
end
