#################################check.vars#####################################

#'Check that the input variables are accurate and get a working directory
#'CheckVars
#'Created By: Benjamin Green
#'Last Edited 09/24/2019
#'
#'Description
#'This function was designed to check input variables for any unforseen errors
#' that may occur
#'
#'
#' @param out is the list of variables given by the GUI function
#' @return exports multiple variables for use in the main titration codes
#' @export
#'
check.vars <- function(out) {
#
# get the working directory
#
wd <- choose.dir(caption = 'Select the folder the data is contained in')
if(is.na(wd)) { stop('Directory is invalid', call. = FALSE)}
#
# check the slide names
#
if( grepl('[-|+|&]',out$Slide_Descript,perl = TRUE ) ) warning(
'Slide Descriptors contain an illegal character this may cause issues')
if( grepl(' ',out$Slide_Descript,perl = TRUE ) ) {
  warning('Slide Descriptors contain spaces ... removing spaces in names')
  Slide_Descript <- gsub(" ", "",out$Slide_Descript, fixed = TRUE)
} else {
  Slide_Descript <- out$Slide_Descript
}
#
Slide_Descript <- unlist(strsplit(Slide_Descript, split = ','))

#
# whether or not to output the flow results
#
flowout <- FALSE
#
# get the antibody name
#
Antibody <- out$Antibody
#
# the opal name
#
Opal1 <- out$Opal1
#
# an antibody opal name pair
#
Antibody_Opal <- paste0(Antibody, ' (Opal ', Opal1, ')')
#
# get the concentration values
#
if( grepl(' ',out$Concentration,perl = TRUE ) ) {
  warning('Concentrations contain spaces ... removing spaces in names')
  Concentration <- gsub(" ", "",out$Concentration, fixed = TRUE)
} else {
  Concentration <- out$Concentration
}
tryCatch({
  Concentration1 <- as.numeric(unlist(strsplit(Concentration, split =',')))
  }, warning = function(cond) {
    stop(paste0('Error in Concentration input: ', Concentration))
   
  }, error = function(cond) {
    stop(paste0('Error in Concentration input: ', Concentration))
    
  }
)
#
Concentration <- Concentration1
#
# put the names together to find the proper dilutions
#
Naming.convention<-out$Naming.convention
titration.type<-out$titration.type
#
if(Naming.convention==T){
  if(titration.type=='Primary'){
    titration.type.name<-Antibody
  }else if (titration.type =='TSA'){
    titration.type.name<-Opal1}
}else{
  titration.type.name<-''
  }
#
# get the folders tag for processing
#
Folders <- as.logical(out$Folders.Pixels)
#
# setting up paths based on if the data is
# in one folder or multiple folders
#
if (!is.null(out$Vars_pxp)){
  Vars_pxp <- paste(out$Vars_pxp, collapse = ", ")
}else {
  Vars_pxp <- ','}

if(grepl("Folders.Pixels",Vars_pxp)) {
  #
  pp <- list.dirs(wd)
  #
  paths<-sapply(1:length(Concentration),function(x){
    str = paste0(
      titration.type.name,'_1to',Concentration[x],'$|',
      titration.type.name,'_1to',Concentration[x],'[^0]')
    pp[grepl(str,pp)]
  })
}else{
  paths<-sapply(1:length(Concentration),function(x) wd)
}
#
# check that there is one path for each concentration
# (if folders is false vector paths will be filled with one
# path for each concentration)
#
checknumofpaths <- sapply(1:length(paths), function(x){
  if (length(paths[[x]]) != 1){
    message('Error: number of paths for
            each Concentration does not equal 1')
    stop('Check the status the naming
         convention on folders and that all folders exist',
         call. = FALSE)
  }
})
#
## ***********************************************
## need to check that the there are
## files for each dilution of for each specimen
## and that if the naming convention
## is false the dilution only appears once in the name
## ************************************************
#
# get the threshold tag
#
#Thresholded <- as.logical(out$Thresholded)
#
# create the threshold values and connected pixel values
#
if (!grepl("nConsistent",Vars_pxp)) {
  #
  Thresholds = lapply(
    1:length(Slide_Descript), function(x)out$Thresholds
    )
  #
  connected.pixels <- lapply(
    1:length(Slide_Descript), function(x)out$connected.pixels
    )
  #
  names(connected.pixels) <- Slide_Descript
  #
  for (x in 1:length(Slide_Descript)){
    #
    if( grepl(' ',Thresholds[[x]],perl = TRUE ) ) {
      warning('Concentrations contain spaces ...
            removing spaces in names')
      Thresholds[[x]] <- gsub(" ", "",Thresholds[[x]], fixed = TRUE)
    } else {
      Thresholds[[x]] <- Thresholds[[x]]
    }
    #
    # try to convert to a valid string
    #
    tryCatch({
      Thresholds1 <- as.numeric(
        unlist(strsplit(Thresholds[[x]], split =',')))
      }, warning = function(cond) {
        stop(paste0('Error in thresholds input: ', Thresholds[[x]]))
      }, error = function(cond) {
        stop(paste0('Error in thresholds input: ', Thresholds[[x]]))
      }
    )
    #
    Thresholds[[x]] <- Thresholds1
    #
    # check that the number of thresholds
    # == the number of concentrations
    #
    if (length(Concentration) != length(Thresholds[[x]])){
      stop('the length of concentrations does
         not equal the length of thresholds', call. = FALSE)
    }
    #
    # set up connected pixel values
    #
    if( grepl(' ',connected.pixels[[x]],perl = TRUE ) ) {
      warning('Concentrations contain spaces ...
            removing spaces in names')
      connected.pixels[[x]] <- gsub(
        " ", "",connected.pixels[[x]], fixed = TRUE
      )
    } else {
      connected.pixels[[x]] <- connected.pixels[[x]]
    }
    #
    # try to convert to a valid string
    #
    tryCatch({
      connected.pixels1 <- as.numeric(
        unlist(strsplit(connected.pixels[[x]], split =',')))
    }, warning = function(cond) {
      stop(paste0('Error in connected pixels input: ', connected.pixels[[x]]))
    }, error = function(cond) {
      stop(paste0('Error in connected pixels input: ', connected.pixels[[x]]))
    }
    )
    #
    connected.pixels[[x]] <- connected.pixels1
    #
    # check that the number of thresholds
    # == the number of concentrations
    #
    if (length(Concentration) != length(connected.pixels[[x]])){
      stop('the length of concentrations does
         not equal the length of connected pixels', call. = FALSE)
    }
    #
  }
  names(connected.pixels)<-Slide_Descript
  names(Thresholds)<-Slide_Descript
} else {
  stop('multiple thresholds not yet supported')
}
#
# get the protocol type
#
Protocol <- out$protocol.type
## ***********************************************
##
## check if the tifs have the proper number of variables
##
## ***********************************************
#
num.of.tiles<-10
#if (out$AB_Sparse==T){num.of.tiles<-100}else{num.of.tiles<-10}
#
# check if the EBImage package is installed or not
#
a<-installed.packages()
packages<-a[,1] 
if (!is.element("EBImage", packages)){
  BiocManager::install("EBImage", ask=FALSE)
}
#
rm(a,packages)
#
# output list
#
outnew <- list(wd = wd, Slide_Descript = Slide_Descript,
               flowout = flowout,Antibody = Antibody,
               Opal1 = Opal1, Antibody_Opal = Antibody_Opal,
               Concentration = Concentration,
               Thresholded = TRUE, Thresholds = Thresholds,
               Protocol = Protocol,paths = paths,
               titration.type.name = titration.type.name,num.of.tiles = num.of.tiles,
               connected.pixels = connected.pixels)
}