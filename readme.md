# IP2Proxy R package

This library allows user to query an IP address if it was being used as open proxy, web proxy, VPN anonymizer and TOR exits. It lookup the proxy IP address from **IP2Proxy BIN Data** file. This data file can be downloaded at

- Free IP2Proxy BIN Data: [https://lite.ip2location.com](https://lite.ip2location.com/)
- Commercial IP2Proxy BIN Data: https://www.ip2location.com/proxy-database

## Requirement

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

## Usage

1. Load IP2Proxy BIN database by the following command: `ip2proxy::open(path_to_your_database)`
2. Query all the proxy information for an IP address by this command: `ip2proxy::get_all(ip_address)`
3. To know whether an IP address is a proxy or not, you can do this by: `ip2proxy::is_proxy(ip_address)`
4. Query the proxy information for an IP address using web service: `ip2proxy::lookup_web_service(your_api_key, ip_address, package)`
5. To plot IP addresses on the map: ip2proxy::plot_map(c(list_of_ip_addresses))

## Proxy Type

| Proxy Type | Description                    |
| ---------- | ------------------------------ |
| VPN        | Anonymizing VPN services.      |
| TOR        | Tor Exit Nodes.                |
| PUB        | Public Proxies.                |
| WEB        | Web Proxies.                   |
| DCH        | Hosting Providers/Data Center. |
| SES        | Search Engine Robots.          |
| RES        | Residential Proxies [PX10+]    |

## Usage Type

| Usage Type | Description                     |
| ---------- | ------------------------------- |
| COM        | Commercial                      |
| ORG        | Organization                    |
| GOV        | Government                      |
| MIL        | Military                        |
| EDU        | University/College/School       |
| LIB        | Library                         |
| CDN        | Content Delivery Network        |
| ISP        | Fixed Line ISP                  |
| MOB        | Mobile ISP                      |
| DCH        | Data Center/Web Hosting/Transit |
| SES        | Search Engine Spider            |
| RSV        | Reserved                        |

## Threat Type

| Threat Type | Description                |
| ----------- | -------------------------- |
| SPAM        | Spammer                    |
| SCANNER     | Security Scanner or Attack |
| BOTNET      | Spyware or Malware         |

## Support

Email: [support@ip2location.com](mailto:support@ip2location.com). URL: [https://www.ip2location.com](https://www.ip2location.com/)
