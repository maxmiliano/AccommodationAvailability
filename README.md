### Challenge

When renting out accomodations one has to take care of the fact that
they might not always be available. We have prepared a simple database
schema to model this. One row in the database represents one month,
the days of the month are encoded into a string. In this string, a "0"
stands for "available" and a "1" for "not available". The first
character is the first of the month. Your task is to implement a way
of querying for the availability for a given check-in and check-out
date. Note that it's totally fine for a guest to check in on the day
another guest checks out. Therefore check-out dates are not marked as
"not available" in the days string. Also, it's ok to check out on a
day that's marked as "not available". We don't handle different
accomodations here, it's as if there was just one property, for
simplicity reasons.

We've set up some basic infrastructure with rspec, sqlite and the
sequel gem. Note that the tests are failing. You can use other
libraries for testing or database access if you wish, it's just that
we won't set that up for you.

Try to find a clean and readable solution to the problem. 


The class name `Availability` isn't optimal. Where would the
`#available_between?` method live in a more realistic application?
What would be the class name?

This example is too simplistic. How would you extend the data model
to support more than one accomodation?
  
In a real-world setting there are several sources for availability,
e.g. a user might block certain dates on the platform, or some dates
are already booked, or the same accomodation might be listed on a
competitor's platform and have a booking there. How can we
consolidate these different sources of availability? How can we
model this so they're easy to combine?

Can you suggest a data structure that makes finding available
accomodations for a given set of check-in and check-out dates easy
and fast? What would be the trade-offs?
