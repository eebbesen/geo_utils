# Tutorial
http://www.opengeocode.org/tutorials/USCensusAPI.php


## FIPS codes
### MN
#### Counties
http://www2.census.gov/geo/docs/reference/codes/files/st27_mn_cou.txt

#### Lat/Long
`http://data.fcc.gov/api/block/find?latitude=[latitude]&longitude=[longitude]&showall=[true/false]`

`http://data.fcc.gov/api/block/find?latitude=44.938113&longitude=-93.169011&showall=true`
yields

    <Response xmlns="http://data.fcc.gov/api" status="OK" executionTime="75">
    <Block FIPS="271230351001005"/>
    <County FIPS="27123" name="Ramsey"/>
    <State FIPS="27" code="MN" name="Minnesota"/>
    </Response>

#### Ramsey
MN,27,123,Ramsey County,H1

## Census API examples
`http://api.census.gov/data/2014/acs5?get=NAME,B01001_001E&for=county:123&in=state:27&key=65dd97ce1b2c60de6fa8a87916254e19060e9d40`
returns

    [["NAME","B01001_001E","state","county"],
     ["Ramsey County, Minnesota","521265","27","123"]]


`http://api.census.gov/data/2014/acs5?get=NAME,B01001_001E&for=block+group:*&in=state:27+county:123&key=65dd97ce1b2c60de6fa8a87916254e19060e9d40`
returns

    [["NAME","B01001_001E","state","county","tract","block group"],
	["Block Group 1, Census Tract 301, Ramsey County, Minnesota","698","27","123","030100","1"],
	["Block Group 2, Census Tract 301, Ramsey County, Minnesota","945","27","123","030100","2"],
	["Block Group 3, Census Tract 301, Ramsey County, Minnesota","1163","27","123","030100","3"],
	["Block Group 4, Census Tract 301, Ramsey County, Minnesota","756","27","123","030100","4"],
	["Block Group 5, Census Tract 301, Ramsey County, Minnesota","901","27","123","030100","5"],
    ...




### List of variables
Variables specify the data returned.  In the above examples `NAME` get the name of the geography being queried and `B01001_001E` gets the unweighted sample count of the population.
http://api.census.gov/data/2014/acs5/variables.html