#' Drug Product
#'
#' Basic information about the product, such as brand name and Drug
#'   Identification Number.
#'
#' @param id Drug product code.
#' @param name Active ingredient name.
#' @param din Drug Identification Number (DIN).
#' @param brand Brand name.
#' @param status Drug product status.
#'
#' @return A `tibble`.
#'
#' @export
dpd_drug_id <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_din <- function(din) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?din={din}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_brand <- function(brand) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?brandname={brand}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_status <- function(status) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?status={status}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_all <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_dins <- function(name) {
  drugs <- dpd_ai_name(name)
  purrr::map(drugs$drug_code, \(x) dpd_drug_id(x)) |>
    purrr::list_rbind()
}
