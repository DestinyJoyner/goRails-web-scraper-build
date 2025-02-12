class Page < ApplicationRecord
  has_many :results
  
  validates :url, presence: true
  validates :check_type, presence: true
  validates :selector, presence: true
  validates :match_text, presence: {if: -> { check_type == "text" }}

  def run_check
    scraper = Scraper.new(url)
    result = if check_type == "text"
      scraper.text(selector:).downcase == match_text.downcase
    else
      scraper.present?(selector:)
    end
    
    result.create(success: result)
  end
end
