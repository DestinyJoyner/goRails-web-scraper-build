class Page < ApplicationRecord
  has_many :results
  
  validates :url, presence: true
  validates :check_type, presence: true
  validates :selector, presence: true
  # Remove or comment out this line since we're not using match_text anymore
  # validates :match_text, presence: {if: -> { check_type == "text" }}

  def run_check
    scraper = Scraper.new(url)
    check_result = if check_type == "text"
      # Check if the Add to Cart button exists and is not disabled
      button = scraper.document.at_css("#AddToCart--product-template")
      button.present? && !button["disabled"]
    else
      scraper.present?(selector: selector)
    end
    
    # Create a new Result record associated with this page
    results.create(success: check_result)
  end
end
