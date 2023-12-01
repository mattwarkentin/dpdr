#' Active Ingredient
#'
#' An Active Ingredient is any component that has medicinal properties, and
#'   supplies pharmacological activity or other direct effect in the diagnosis,
#'   cure, mitigation, treatment or prevention of disease, or to affect the
#'   structure or any function of the body of a human or an animal.
#'
#' @param id Drug product code.
#' @param name Active ingredient name.
#'
#' @return A `tibble`.
#'
#' @export
dpd_ai_id <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('activeingredient/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_ai_id
#' @export
dpd_ai_name <- function(name) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('activeingredient/?ingredientname={name}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_ai_id
#' @export
dpd_ai_all <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('activeingredient/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
