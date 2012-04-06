class Product < ActiveRecord::Base   
  validates :title,       :presence  => true, 
                          :uniqueness => true
  validates :description, :presence  => true
  validates :image_url,   :presence  => true,
                          :format => {:with => %r{\.(gif|jpg|png)$}i}
  validates :price,       :numericality => true
  
  validates :price_must_be_at_least_a_cent
  

        def 
          price_must_be_at_least_a_cent
          errors.add(:price, 'should be at least .01') if price.nil? || price < 0.01
        end  
        
        def self.find_products_for_sale
          find(:all, :order => "title")
        end
end
