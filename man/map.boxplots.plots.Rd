% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map.boxplots.plots.R
\name{map.boxplots.plots}
\alias{map.boxplots.plots}
\title{Used by PxP script to plot out the boxplots}
\usage{
map.boxplots.plots(
  wd,
  Antibody_Opal,
  Slide_Descript,
  Concentration,
  tables_in,
  theme1,
  colors,
  con_type,
  m.opt
)
}
\arguments{
\item{wd}{the main data root directory}

\item{Antibody_Opal}{the paired string for an antibody opal pair, designated as
"AB (Opal NNN)"}

\item{Concentration}{a numeric vector of concentrations used in the titration}

\item{tables_in}{the table of statistics gathered by PxP}

\item{theme1}{the theme for the graphs}

\item{colors}{the color vectors for the t test and histograms}

\item{con_type}{the type of concentration vector to use factor or numeric}

\item{m.opt}{option of whether to use decile type tables or threshold}

\item{Slide_Desctipt}{a unique identifier for each slide to be analyzed}
}
\value{
exports a ggplot object to be printed for viewing
}
\description{
Created By: Benjamin Green
Last Edited 07/31/2020
}
\details{
Designed to output the boxplots plots as a ggplot object for the PxP script

It is meant to be run through the PixelbyPixel function
}
