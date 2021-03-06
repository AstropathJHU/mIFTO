% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/decile.define.image.positivity.R
\name{decile.define.image.positivity}
\alias{decile.define.image.positivity}
\title{Used by analysis functions to calculate to define image positivity using the 
thresholds and connected pixel value}
\usage{
decile.define.image.positivity(data.in, step.value)
}
\arguments{
\item{data.in}{is the image for which positivity needs to be defined}

\item{step.value}{the number of tiles to divide the data into}
}
\value{
exports multiple variables for use in the main titration codes
}
\description{
define.image.positivity;
Created By: Benjamin Green;
Last Edited 08/11/2020
}
\details{
Takes in an image, a threshold, and connected pixel values
}
