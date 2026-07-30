.ip2proxy_env <- new.env(parent = emptyenv())

#' @title Load IP2Proxy BIN data
#'
#' @description Load the IP2Proxy BIN data for lookup. Free IP2Proxy LITE data available for download at <https://lite.ip2location.com/>
#' @param bin_location Absolute path of IP2Proxy BIN data
#' @return NULL
#' @import reticulate
#' @export
#' @examples \dontrun{
#' open("~/IP-COUNTRY.BIN")
#' }
#'

open <- function(bin_location){
  .ip2proxy_env$IP2Proxy <- reticulate::import("IP2Proxy")
  .ip2proxy_env$data <- .ip2proxy_env$IP2Proxy$IP2Proxy(bin_location)
  invisible(NULL)
}

#' @title Get the current IP2Proxy BIN data object
#'
#' @description Retrieve the Python IP2Proxy object created by \code{open()}. Internal helper used by the lookup functions to ensure the BIN data has been loaded before making a request.
#' @return Return the Python IP2Proxy data object used for lookups
#' @keywords internal
#' @noRd
#'

.getData <- function() {
  if (is.null(.ip2proxy_env$data)) {
    stop("BIN data not loaded. Please call open() first.")
  }
  .ip2proxy_env$data
}

#' @title Lookup for IP address proxy information
#'
#' @description Find the country, region, city, ISP, domain name, usage types, asn, as name, last seen, threat type, provider and fraud score. The return values will be depending on the BIN data loaded.
#' @param ip IPv4 or IPv6 address
#' @return Return all the proxy information about the IP address
#' @import reticulate
#' @export
#' @examples \dontrun{
#' get_all("1.0.241.135")
#' }
#'

get_all <- function(ip){
  data <- .getData()
  rec <- data$get_all(ip)
  result <- reticulate::py_to_r(rec)
  return(result)
}

#' @title Lookup for IP address proxy information
#' @param ip IPv4 or IPv6 address
#' @description Check whether if an IP address was a proxy.
#' @return Return a digit value: -1 (errors), 0 (not a proxy), 1 (a proxy), and 2 (a data center IP address).
#' @import reticulate
#' @export
#' @examples \dontrun{
#' is_proxy("1.0.241.135")
#' }
#'

is_proxy <- function(ip){
  data <- .getData()
  rec <- data$is_proxy(ip)
  result <- reticulate::py_to_r(rec)
  return(result)
}

#' @title Lookup for IP address proxy information using IP2Proxy web service.
#' @param api_key IP2Proxy web service API key
#' @param ip IPv4 or IPv6 address
#' @param package Package to use for IP2Proxy web service.
#' @description Find the country, region, city, ISP, domain name, usage types, asn, as name, last seen, threat type and provider. The return values will be depending on the IP2Proxy web service package used.
#' @return Return all the proxy information about the IP address
#' @import reticulate
#' @export
#' @examples \dontrun{
#' lookup_web_service("YOUR_API_KEY", "1.0.241.135", "PX1")
#' }
#'

lookup_web_service <- function(api_key, ip, package = 'PX1'){
  IP2Proxy <- reticulate::import("IP2Proxy")
  ws <- IP2Proxy$IP2ProxyWebService(api_key, package, TRUE)
  rec <- ws$lookup(ip)
  result <- reticulate::py_to_r(rec)
  return(result)
}
