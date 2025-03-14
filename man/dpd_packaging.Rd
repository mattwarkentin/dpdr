% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Packaging.R
\name{dpd_packaging}
\alias{dpd_packaging}
\title{Packaging}
\usage{
dpd_packaging(ids)
}
\arguments{
\item{ids}{Vector of drug product code.}
}
\value{
A \code{tibble} with columns:
\itemize{
\item \code{drug_code}: Code assigned to each drug product.
\item \code{package_size}: Size of package.
\item \code{package_size_unit}: Unit for package size.
\item \code{package_type}: Type of package.
\item \code{product_information}: Additional product information.
\item \code{upc}: Universal Product Code.
}
}
\description{
Information about available package sizes for each drug product.
}
\examples{
dpd_packaging(11685)

}
