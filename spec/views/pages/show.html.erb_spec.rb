require 'spec_helper'

describe "pages/show" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "Title",
      :body => "Body",
      :priority => 1,
      :is_home_page => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Body/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
