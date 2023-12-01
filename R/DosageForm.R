#' Dosage Form
#'
#' The dosage form is the form of presentation in which the product is supplied,
#'   for example, tablet, capsule, powder, etc.
#'
#'   A product can have more than one dosage form when it is a kit
#'   (e.g. tablet, capsule).
#'
#' @param id Drug product code.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `pharmaceutical_form_code`: Code assigned to a dosage form.
#'   - `pharmaceutical_form_name`: Dosage form.
#'
#' @examples
#' dpd_dosage(10846)
#'
#' @export
dpd_dosage <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('form/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_dosage
#' @export
dpd_dosage_all <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('form/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
