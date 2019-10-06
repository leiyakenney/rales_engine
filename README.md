# README

RalesEngine is an api built to expose SalesEngine data. All endpoints return JSON data and are exposed under an api and version namespace.

### Note
As I was struggling this first week, I am proud of getting through all the Merchants information with my own tests passing. Some things have started clicking, and the Business Intelligence Endpoints went quicker than expected, mostly due to the fact that we had done one of those in class together in groups. I'm still not totally comfortable with Spec Harness, but I'm feeling much better than I was last week. All my merchant endpoints tests pass in Spec Harness, but I'm still working on getting the Business Intelligence test to pass, though I have it passing in my own tests. 

# Setup

### To get this repo running locally:

  * Clone down this repo using ruby 2.4.1
  * `bundle`
  * `rake db:{create,migrate}`
  * `rake import:merchants`


# Endpoints


### Record Endpoints
  * `api/v1/merchants` returns all merchants
  * `api/v1/merchants/:id` returns the merchants with the specified id

### Single-Finder Endpoints
  * `api/v1/merchants/find?parameters` returns a single merchant based on the given parameter

### Multi-Finder Endpoints
  * `api/v1/merchants/find_all?paramaters` returns all merchants with the given parameter

### Random Endpoints
  * `api/v1/merchants/random` returns a random merchant

### Relationship Endpoints
  * `api/v1/merchants/:id/items` returns a collection of items associated with that merchant
  * `api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their orders

### Business Intelligence Endpoints
  * `api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
  * `api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants
  * `api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions
