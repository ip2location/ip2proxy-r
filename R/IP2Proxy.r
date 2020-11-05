#' @title Load IP2Proxy BIN data
#'
#' @description Load the IP2Proxy BIN data for lookup. Free IP2Proxy LITE data available for download at <https://lite.ip2location.com/>
#' @param bin_location Absolute path of IP2Proxy BIN data
#' @return NULL
#' @import reticulate
#' @export
#' @examples \donttest{
#' open("~/IP-COUNTRY.BIN")
#' }
#'

open <- function(bin_location){
  py_run_string("import IP2Proxy")
  py_run_string("import json")
  path = paste("data = IP2Proxy.IP2Proxy('", bin_location , "')", sep = "")
  py_run_string(path)
}

#' @title Lookup for IP address proxy information
#'
#' @description Find the country, region, city, ISP, domain name, usage types, asn, as name, last seen and threat type. The return values will be depending on the BIN data loaded.
#' @param ip IPv4 or IPv6 address
#' @return Return all the proxy information about the IP address
#' @import reticulate
#' @import jsonlite
#' @export
#' @examples \donttest{
#' get_all("8.8.8.8")
#' }
#'

get_all <- function(ip){
  address = paste("rec = data.get_all('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("j = json.dumps(rec)")
  result = fromJSON(py$j)
  return(result)
}

#' @title Lookup for IP address proxy information
#' @param ip IPv4 or IPv6 address
#' @description Check whether if an IP address was a proxy.
#' @return Return a digit value: -1 (errors), 0 (not a proxy), 1 (a proxy), and 2 (a data center IP address).
#' @import reticulate
#' @import jsonlite
#' @export
#' @examples \donttest{
#' is_proxy("8.8.8.8")
#' }
#'

is_proxy <- function(ip){
  is_proxy = paste("is_proxy = data.is_proxy('", ip, "')", sep = "")
  py_run_string(is_proxy)
  py_run_string("rec1 = {}")
  py_run_string("rec1['is_proxy'] = is_proxy")
  py_run_string("j1 = json.dumps(rec1)")
  result = fromJSON(py$j1)
  return(result['is_proxy'])
}
