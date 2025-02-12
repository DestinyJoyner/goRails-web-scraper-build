# Import the Ruby standard library for making HTTP requests
require "net/http"

class Scraper

  # This creates a getter method for @document, making it readable from outside the instance
  attr_reader :document

  # Initialize is called when we create a new instance with Scraper.new(url)
  def initialize(url)
    response = Net::HTTP.get(URI(url))     # Fetches the HTML content
    @document = Nokogiri::HTML(response) # Stores the parsed HTML as an instance variable
  end

  # Class method that takes a URL and returns a Nokogiri HTML document
  # # Using 'self.' makes this a class method, so we can call Scraper.document directly
  # # without creating a new instance of Scraper
  # # self.document: This is a helper method that handles the common task of fetching and parsing HTML. It's used by both text and present? methods, following the DRY (Don't Repeat Yourself) principle. 
  # def self.document(url)
  #   response = Net::HTTP.get(uri)  # Makes HTTP GET request and returns the raw HTML
  #   Nokogiri::HTML(response)       # Converts the raw HTML into a Nokogiri document that we can query
  # end

  # Class method that takes a URL and a CSS selector, returns the text content of the matched element
  def text(selector:)
    # Uses the document method above to get the HTML, then finds element matching the selector
    # and extracts its text content with any extra whitespace removed
    document.at_css(selector).text.strip
  end

  # Class method that checks if an element matching the selector exists on the page
  # self.present?: This method is useful when you just want to check if something exists on a page without needing its content.
  def present?(selector:)
    # Returns true if the element exists, false if it doesn't
    document.at_css(selector).present?
  end
end


# Example usage:
# scraper = Scraper.new("https://www.4ucaps.com/products/some-hat")

# Now you can check multiple things using the same document
# button_text = scraper.text(selector: "#AddToCart--product-template")
# is_available = scraper.present?("#AddToCart--product-template")