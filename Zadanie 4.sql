select ev."EventName", count(re."RaceTime") as count_of_runners,
to_char( (round(avg(re."RaceTime"), 0) ||'seconds')::interval, 'HH24:MI:SS' ) as avg_time
from "Event" ev
inner join "RegistrationEvent" re on ev."EventId" = re."EventId"
where re."RaceTime" != 0
group by ev."EventName"
order by "EventName";

select u."FirstName", u."LastName", extract(year from Age(rnr."DateOfBirth")) as AGE, g."Gender", m."MarathonName", ev."EventName", c."CountryName",

TO_CHAR((rei."RaceTime" || ' seconds')::interval, 'HH24:MI:SS') AS race_time,

ROW_NUMBER() OVER (PARTITION BY ev."EventName" ORDER BY rei."RaceTime" ASC) AS position

FROM "Event" ev

INNER JOIN "Marathon" m ON ev."MarathonId" = m."MarathonId"

inner join "Country" c on m."CountryCode" = c."CountryCode"

INNER JOIN "RegistrationEvent" rei ON ev."EventId" = rei."EventId"

inner join "Registration" reg on rei."RegistrationId" = reg."RegistrationId"

inner join "Runner" rnr on reg."RunnerId" = rnr."RunnerId"

inner join "User" u on u."Email" = rnr."Email"

inner join "Gender" g on rnr."GenderId" = g."GenderId"

WHERE ev."MarathonId" = '3' AND rei."RaceTime" != 0

ORDER BY ev."EventName" asc, g."Gender" asc, race_time asc;
