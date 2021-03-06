% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.fracs.R
\name{write.fracs}
\alias{write.fracs}
\title{Used by PxP script to write out the fraction of positivity data}
\usage{
write.fracs(
  wd,
  Antibody_Opal,
  Antibody,
  Slide_Descript,
  Concentration,
  tables_in,
  Thresholds,
  connected.pixels,
  ihc.logical,
  ihc.Thresholds,
  ihc.connected.pixels,
  folders.px,
  theme1
)
}
\arguments{
\item{wd}{the main data root directory}

\item{Antibody_Opal}{the paired string for an antibody opal pair, designated
as "AB (Opal NNN)"}

\item{Antibody}{the string for an antibody}

\item{Concentration}{a numeric vector of concentrations used in the titration}

\item{tables_in}{the table of statistics gathered by PxP}

\item{Thresholds}{a list of thresholds used for each concentration and slide}

\item{connected.pixels}{the number of pixels that a pixel must be connected
to for positivity measures}

\item{ihc.logical}{whether or not an IHC was done on these slides}

\item{ihc.Thresholds}{a list of thresholds used for each slide for the IHC,
should be in the same order as the slide list}

\item{ihc.connected.pixels}{a list of conn pixels used for each slide for the
IHC, should be in the same order as the slide list}

\item{folders.px}{whether or not tiffs are divided into a number of folders
or not}

\item{theme1}{graphing theme}

\item{Slide_Desctipt}{a unique identifier for each slide to be analyzed}
}
\value{
exports the fraction spreadsheets
}
\description{
Created By: Benjamin Green
Last Edited 07/30/2020
}
\details{
Designed to write out the fraction of positivity data for the PxP script

It is meant to be run through the PixelbyPixel function
}
