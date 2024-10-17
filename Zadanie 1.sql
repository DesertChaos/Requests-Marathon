select u."FirstName", u."LastName", r."CountryCode"
from "User" u
cross JOIN "Runner" r
cross JOIN "Marathon" m;