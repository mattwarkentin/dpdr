build_dpd_request <- function(
  route,
  params = NULL,
  headers = NULL,
  cookies = NULL,
  method = "GET",
  opts = list()
) {
  base_opts <- list(ssl_verifypeer = 0)
  opts <- utils::modifyList(base_opts, opts)

  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(route) |>
    httr2::req_url_query(!!!params) |>
    httr2::req_headers(!!!headers) |>
    httr2::req_cookies_set(!!!cookies) |>
    httr2::req_options(!!!opts) |>
    httr2::req_method(method) |>
    httr2::req_user_agent("dpdr (https://github.com/mattwarkentin/dpdr)")
}

process_dpd_response <- function(resp) {
  stopifnot(inherits(resp, "httr2_response"))

  content_type <- httr2::resp_content_type(resp)

  is_empty <- length(resp$body) == 0

  if (resp$status_code >= 200 & resp$status_code < 300) {
    if (is_empty) {
      return(invisible())
    } else if (grepl("^application/json", content_type, ignore.case = TRUE)) {
      res <- httr2::resp_body_json(resp, simplifyVector = TRUE)
      res <- tibble::as_tibble(res)
    } else if (grepl("^text/html", content_type, ignore.case = TRUE)) {
      res <- httr2::resp_body_html(resp)
    } else if (grepl("^text/plain", content_type, ignore.case = TRUE)) {
      res <- httr2::resp_body_string(resp)
    } else {
      res <- httr2::resp_body_raw(resp)
    }
  }

  class(res) <- c("dpd_response", class(res))
  res
}


api_base_url <- function() {
  'https://health-products.canada.ca/api/drug/'
}

check_int_char_vec <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (rlang::is_integerish(x)) {
    x <- as.character(x)
  }
  if (!rlang::is_character(x)) {
    rlang::abort(glue::glue('`{var}` must be an integer or character vector.'))
  }
  x
}

check_char_vec <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (!rlang::is_character(x)) {
    rlang::abort(glue::glue('`{var}` must be a character vector.'))
  }
  x
}

check_int_char_scalar <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (rlang::is_scalar_integerish(x)) {
    x <- as.character(x)
  }
  if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{var}` must be a scalar integer or character'))
  }
  x
}

check_char_scalar <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{var}` must be a scalar character.'))
  }
  x
}

check_scalar_logical <- function(x, x_nm = NULL) {
  if (rlang::is_null(x_nm)) {
    x_nm <- deparse(substitute(x))
  }

  if (rlang::is_scalar_logical(x)) {
    return(TRUE)
  }
  rlang::abort(
    message = glue::glue(
      "`{x_nm}` must be a scalar logical."
    ),
    call = rlang::caller_env()
  )
}
