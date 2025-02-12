# Hat Stock Checker Web Scraper

A practice web scraping application built following the [GoRails Web Scraper Tutorial](https://gorails.com/series/build-a-web-scraper-in-rails), with a specific implementation for checking NY Yankees fitted hat availability.

## Overview
This application monitors product availability on hat websites by checking the state of "Add to Cart" buttons. Built specifically to track when specific NY Yankees fitted hats come back in stock.

## Technology Stack
- Ruby on Rails
- Nokogiri (HTML parsing)
- Net::HTTP (Web requests)
- PostgreSQL (Database)

## Key Features
- Simple UI for managing monitored product pages
- Single-click "Run Check" button to check stock status
- Historical tracking of availability checks
- Timestamp-based result display

## Database Structure
- **Pages**: Stores URLs and selectors for products to monitor
- **Results**: Tracks historical check results with timestamps

## How It Works
1. User adds a product page URL and the CSS selector for the "Add to Cart" button
2. Clicking "Run Check" triggers the scraper to:
   - Fetch the page HTML
   - Check if the Add to Cart button is present and enabled
   - Store the result (in stock/sold out) with timestamp
3. Results are displayed chronologically, showing stock status and check time

## Example Use Case
Currently monitoring: [NY Yankees Fitted Hat](https://www.4ucaps.com/collections/sale-1/products/new-era-nyy-702460-2008-asg-tophat-logo-nyy-702460-new-era) 

*Because one can never have too many fitted hats* 😉

## Tutorial Source
This project was built as a learning exercise following the [GoRails Web Scraper Tutorial Series](https://gorails.com/series/build-a-web-scraper-in-rails), with customizations for personal use.