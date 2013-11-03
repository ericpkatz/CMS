require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "MyString",
      :body => "MyString",
      :priority => 1,
      :is_home_page => false
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path(@page), :method => "post" do
      assert_select "input#page_title", :name => "page[title]"
      assert_select "input#page_body", :name => "page[body]"
      assert_select "input#page_priority", :name => "page[priority]"
      assert_select "input#page_is_home_page", :name => "page[is_home_page]"
    end
  end
end
