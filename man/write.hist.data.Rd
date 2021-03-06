% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.hist.data.R
\name{write.hist.data}
\alias{write.hist.data}
\title{write out the by image histogram data sets
Created By: Benjamin Green
Last Edited 06/04/2020}
\usage{
write.hist.data(
  table_in,
  wd,
  Antibody_Opal,
  Slide_Descript,
  Concentration,
  i.1
)
}
\arguments{
\item{table_in}{the table}

\item{wd}{the main data root directory}

\item{Antibody_Opal}{the paired string for an antibody opal pair,
designated as "AB (Opal NNN)"}

\item{Concentration}{a numeric vector of concentrations used in the titration}

\item{i.1}{type counter}

\item{Slide_Desctipt}{a unique identifier for each slide to be analyzed}
}
\value{
returns the layout object
}
\description{
Write out the histogram datasets for later use
}
