class Page < ActiveRecord::Base
  before_save :ensure_unique_home_page
  after_destroy :ensure_home_page_exists

  attr_accessible :body, :is_home_page, :priority, :title

  default_scope :order => "is_home_page DESC, priority"

  def self.get_home_page
    home_page = Page.where( is_home_page: true ).first()
    if(home_page.nil?)
      home_page = Page.create( title: 'Home', priority: 1, is_home_page: true)
    end
    home_page
  end

  private
  def ensure_unique_home_page
     if(self.is_home_page)
        current_home_page = Page.where(is_home_page: true).first
        if(!current_home_page.nil? && !self.id.nil? && self.id != current_home_page.id)
          current_home_page.update_attribute(:is_home_page, false)
        end
     end
  end

  def ensure_home_page_exists
    if (self.is_home_page)
      Page.get_home_page()
    end
  end

end
