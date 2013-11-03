require 'spec_helper'

describe Page do

  context "Home Page Does Not Exist" do
    it "Should create the home page" do
      expect(Page.all.size).to eq(0)
      p = Page.get_home_page()
      expect(p).should_not be(nil)
    end
  end

  context "There are pages in the database" do
    before do
      Page.create(title: 'Home', is_home_page: true, priority: 9)
      Page.create(title: 'About', priority: 1 )
      Page.create(title: 'Contact', priority: 3)
      Page.create(title: 'Buy', priority: 2)
    end

    it "Should have a home page" do
      expect(Page.get_home_page().title.to_sym).should be(:Home)
    end

    it "Should have 4 pages" do
      expect(Page.all.size).to eq(4)
    end

    it "Last page should have highest priority number" do
      expect(Page.all.last.title).to eq('Contact')
    end

    context "User changes the the about page to the home page" do

      it "Should have the title about" do
        about = Page.where(title: 'About').first()
        #about.update_attributes( is_home_page: true)
        about.is_home_page = true
        about.save()
      end

    end

    context "The home page is deleted, it should be recreated"

    it "Should make another page the home page" do

      Page.get_home_page.destroy()
      expect(Page.all.size).to eq 4
    end
  end

end
