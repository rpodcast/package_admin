#----------------------------------------------------------------------------------------------
# File: basic-package-management.R
# Date: 04-15-2012
# Author: Eric Nantz
# URL: https://github.com/thercast/package_admin/blob/master/basic-package-management.R
# Email: theRcast@gmail.com
# Purpose: Demonstrate how to install, browse, update, and search documentation for packages
# www.r-podcast.org/the-r-podcast-episode-5-basic-package-management
# License: Creative Commons Attribution-ShareAlike 3.0 Unported License
#----------------------------------------------------------------------------------------------

#---------------------------------------------------------
# How to see what packages are currently installed
#---------------------------------------------------------

# display new window with all packages currently installed
library() 

# obtain matrix of all installed packages
package.matrix <- installed.packages()

# row names are the same as the package name, which is redundant
rownames(package.matrix) <- NULL

# convert this matrix into a data frame for processing
package.dataframe <- data.frame(package.matrix)

# if you only want columns of the package name and version
package.dataframe[, c("Package", "Version", "Built")]

# this returns the set of packages included in my default installation of R
# you may need to change the LibPath to reflect your installation
package.dataframe[package.dataframe$LibPath=="/usr/lib/R/library", c("Package", "LibPath", "Version")]
base.packages <- package.dataframe[package.dataframe$LibPath=="/usr/lib/R/library", c("Package", "LibPath", "Version")]

#--------------------------------------------------------
# What packages are loaded by default when launching R?
#--------------------------------------------------------

sort(getOption("defaultPackages"))
length(getOption("defaultPackages"))

#----------------------------------------------------------
# How to install the ggplot2 package
#----------------------------------------------------------

install.packages("ggplot2")

#-----------------------------------------------------------
# How to load the survival package into your R session
#-----------------------------------------------------------

library(survival)

#---------------------------------------------------------
# access help and vignettes for a package (if they exist)
#---------------------------------------------------------

help(package="survival")
browseVignettes(package="survival")

#--------------------------------------------------------
# how to unload a package from your session
# - Note: this does not uninstall a package permanently
#--------------------------------------------------------

detach(package="survival")

#----------------------------------------------------------
# How to uninstall a package (I rarely have to do this)
# 
#----------------------------------------------------------

#remove.packages(package="foo")

#------------------------------------------------------------
# How to update packages: use update.packages function
# - Note: if you don't want R to prompt you to answer yes/no
#         for each package eligible for an update, use the 
#         argument ask=FALSE
#------------------------------------------------------------

update.packages(ask=FALSE)

