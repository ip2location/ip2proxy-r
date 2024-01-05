# Quickstart

## Dependencies

IP2Proxy R package requires IP2Proxy BIN database to function. You may download the BIN database at

-   IP2Proxy LITE BIN Data (Free): <https://lite.ip2location.com>
-   IP2Proxy Commercial BIN Data (Comprehensive):
    <https://www.ip2location.com>

IP2Proxy R package required IP2Proxy Python library to work. In order to install IP2Proxy Python library, you can use the following command:

   ```Python
   pip install IP2Proxy
   ```

## Installation

1. In your RStudio IDE, type the following command into the console:

   ```R
   install.packages("devtools")
   require(devtools)
   ```

2. After that, install IP2Proxy R package by using the following command: `install_github("ip2location/ip2proxy-r")`

## Sample Codes

### Query geolocation information from BIN database

You can query the geolocation information from the IP2Proxy BIN database as below:

```r
library(ip2proxy)

ip2proxy::open("IP2PROXY-IP-PROXYTYPE-COUNTRY-REGION-CITY-ISP-DOMAIN-USAGETYPE-ASN-LASTSEEN-THREAT-RESIDENTIAL.BIN")
result = ip2proxy::get_all("8.8.8.8")
print(result)

```