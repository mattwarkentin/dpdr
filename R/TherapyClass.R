#' Therapeutic Class
#'
#' A drug's Therapeutic Classification (Class) is assigned according to its main
#'   therapeutic use.
#'
#' @param ids Vector of drug product codes.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `tc_ahfs`: Description of the American Hospital Formulary Service.
#'   - `tc_ahfs_number`: American Hospital Formulary Service code.
#'   - `tc_atc`: Description of the Anatomical Therapeutic Chemical Code.
#'   - `tc_atc_number`: Anatomical Therapeutic Chemical Code.
#'
#' @examples
#' dpd_class(10564)
#'
#' @export
dpd_class <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    httr2::request(api_base_url()) |>
      httr2::req_url_path_append(glue::glue('therapeuticclass/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}
