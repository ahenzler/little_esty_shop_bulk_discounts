Bulk Discounts
Bulk Discounts are subject to the following criteria:

Bulk discounts should have a percentage discount as well as a quantity threshold

Bulk discounts should belong to a Merchant

A Bulk discount is eligible for all items that the merchant sells.

Bulk discounts for one merchant should not affect items sold by another merchant

Merchants can have multiple bulk discounts

If an item meets the quantity threshold for multiple bulk discounts, only the one with the greatest percentage discount should be applied

Bulk discounts should apply on a per-item basis

If the quantity of an item ordered meets or exceeds the quantity threshold, then the percentage discount should apply to that item only.
Other items that did not meet the quantity threshold will not be affected.

The quantities of items ordered cannot be added together to meet the quantity thresholds, e.g. a customer cannot order 1 of Item A and 1 of Item B to meet a quantity threshold of 2. They must order 2 or Item A and/or 2 of Item B

Examples
Example 1

Merchant A has one Bulk Discount
Bulk Discount A is 20% off 10 items
Invoice A includes two of Merchant A’s items
Item A is ordered in a quantity of 5
Item B is ordered in a quantity of 5
In this example, no bulk discounts should be applied.

Example 2

Merchant A has one Bulk Discount
Bulk Discount A is 20% off 10 items
Invoice A includes two of Merchant A’s items
Item A is ordered in a quantity of 10
Item B is ordered in a quantity of 5
In this example, Item A should be discounted at 20% off. Item B should not be discounted.

Example 3

Merchant A has two Bulk Discounts
Bulk Discount A is 20% off 10 items
Bulk Discount B is 30% off 15 items
Invoice A includes two of Merchant A’s items
Item A is ordered in a quantity of 12
Item B is ordered in a quantity of 15
In this example, Item A should discounted at 20% off, and Item B should discounted at 30% off.

Example 4

Merchant A has two Bulk Discounts
Bulk Discount A is 20% off 10 items
Bulk Discount B is 15% off 15 items
Invoice A includes two of Merchant A’s items
Item A is ordered in a quantity of 12
Item B is ordered in a quantity of 15
In this example, Both Item A and Item B should discounted at 20% off. Additionally, there is no scenario where Bulk Discount B can ever be applied.

Example 5

Merchant A has two Bulk Discounts
Bulk Discount A is 20% off 10 items
Bulk Discount B is 30% off 15 items
Merchant B has no Bulk Discounts
Invoice A includes two of Merchant A’s items
Item A1 is ordered in a quantity of 12
Item A2 is ordered in a quantity of 15
Invoice A also includes one of Merchant B’s items
Item B is ordered in a quantity of 15
In this example, Item A1 should discounted at 20% off, and Item A2 should discounted at 30% off. Item B should not be discounted.

User Stories
[x]
Merchant Bulk Discounts Index
As a merchant
When I visit my merchant dashboard
Then I see a link to view all my discounts
When I click this link
Then I am taken to my bulk discounts index page
Where I see all of my bulk discounts including their
percentage discount and quantity thresholds
And each bulk discount listed includes a link to its show page

[x]
As a merchant
When I visit the discounts index page
I see a section with a header of "Upcoming Holidays"
In this section the name and date of the next 3 upcoming US holidays are listed.

Use the Next Public Holidays Endpoint in the [Nager.Date API](https://date.nager.at/swagger/index.html)

[x]
Merchant Bulk Discount Create
As a merchant
When I visit my bulk discounts index
Then I see a link to create a new discount
When I click this link
Then I am taken to a new page where I see a form to add a new bulk discount
When I fill in the form with valid data
Then I am redirected back to the bulk discount index
And I see my new bulk discount listed

[x]
Merchant Bulk Discount Delete
As a merchant
When I visit my bulk discounts index
Then next to each bulk discount I see a link to delete it
When I click this link
Then I am redirected back to the bulk discounts index page
And I no longer see the discount listed

[x]
Merchant Bulk Discount Show
As a merchant
When I visit my bulk discount show page
Then I see the bulk discount's quantity threshold and percentage discount

[x]
Merchant Bulk Discount Edit
As a merchant
When I visit my bulk discount show page
Then I see a link to edit the bulk discount
When I click this link
Then I am taken to a new page with a form to edit the discount
And I see that the discounts current attributes are pre-poluated in the form
When I change any/all of the information and click submit
Then I am redirected to the bulk discount's show page
And I see that the discount's attributes have been updated

[x]
Merchant Invoice Show Page: Total Revenue and Discounted Revenue
As a merchant
When I visit my merchant invoice show page
Then I see the total revenue for my merchant from this invoice (not including discounts)
And I see the total discounted revenue for my merchant from this invoice which includes bulk discounts in the calculation

[/]
Merchant Invoice Show Page: Link to applied discounts
As a merchant
When I visit my merchant invoice show page
Next to each invoice item I see a link to the show page for the bulk discount that was applied (if any)

[x]
Admin Invoice Show Page: Total Revenue and Discounted Revenue
As an admin
When I visit an admin invoice show page
Then I see the total revenue from this invoice (not including discounts)
And I see the total discounted revenue from this invoice which includes bulk discounts in the calculation

Extensions

[]
When an invoice is pending, a merchant should not be able to delete or edit a bulk discount that applies to any of their items on that invoice.

[]
When an Admin marks an invoice as “completed”, then the discount percentage should be stored on the invoice item record so that it can be referenced later

[]
Merchants should not be able to create/edit bulk discounts if they already have a discount in the system that would prevent the new discount from being applied (see example 4)
Holiday Discount Extensions

[]
Create a Holiday Discount
As a merchant,
when I visit the discounts index page,
In the Holiday Discounts section, I see a `create discount` button next to each of the 3 upcoming holidays.
When I click on the button I am taken to a new discount form that has the form fields auto populated with the following:

Discount name: <name of holiday> discount
Percentage Discount: 30
Quantity Threshold: 2

I can leave the information as is, or modify it before saving.
I should be redirected to the discounts index page where I see the newly created discount added to the list of discounts.=

[]
View a Holiday Discount
As a merchant (if I have created a holiday discount for a specific holiday),
when I visit the discount index page,
within the `Upcoming Holidays` section I should not see the button to 'create a discount' next to that holiday,
instead I should see a `view discount` link.
When I click the link I am taken to the discount show page for that holiday discount.
