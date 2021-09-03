---
layout: page
title: Additional software
permalink: /software/
---


# Table of Contents
1. [Installing R and RStudio](#part1)
2. [Installing R on Windows](#part2)
3. [Installing R on macOS](#part3)
4. [Installing X-Windows on macOS (Optional)](#part4)
5. [Installing R on Linux Systems](#part5)
5. [Installing RStudio](#part6)
5. [Installing R Packages](#part7)
5. [Brief intro to R](#part8)

<br /><br />

___

## Installing R and RStudio <a name="part1"></a>

R and RStudio are both free, open-source software, available for all commonly used operating systems, including Windows, macOS, and Linux systems. R and RStudio install in the standard manner on each of these systems. System-specific instructions for installing R are given below. Regardless of your operating system, you should install R before installing RStudio.

Please read and follow these instructions carefully.


### Installing R on Windows <a name="part2"></a>

Visit the Comprehensive R Archive Network (CRAN) and select a mirror site; a list of CRAN mirrors appears at the upper left of the CRAN home page. I suggest that you use the 0-Cloud mirror, which is the first on the list. Click on the link Download R for Windows, which appears near the top of the page; then click on install R for the first time, and subsequently on Download R x.y.z for Windows (where x.y.z is the current version of R). Once it is downloaded, double-click on the R installer. You may take all of the defaults, but I suggest that you make the following modifications:

Instead of installing R in the standard location, C:\Program Files\R\R-x.y.z, I suggest that you use C:\R\R-x.y.z. Again, x.y.z is the current version of R. This will allow you to install packages in the main R library without running R with administrator privileges and may avoid problems that sometimes occur when there are spaces in paths. Otherwise, we may take all of the defaults in the installer.

### Installing R on macOS <a name="part3"></a>

Visit the Comprehensive R Archive Network (CRAN) and select a mirror site; a list of CRAN mirrors appears at the upper left of the CRAN home page. I suggest that you use the 0-Cloud mirror, which is the first on the list. Click on the link Download R for MacOS X, which appears near the top of the page; then click on R-x.y.z.pkg (where x.y.z is the current version of R), which assumes that you are using macOS 10.11 (El Capitan) or higher. You'll also find some older version of R if you have an older version of macOS, but as a general matter, you're probably better off updating your macOS to the current version. Once it is downloaded, double-click on the R installer. You may take all of the defaults.


### Installing X-Windows on macOS (Optional) <a name="part4"></a>

Some R software, such as the rgl package for dynamic 3D graphics, require the standard Unix X-Windows (X11) windowing system, which is no longer preinstalled in macOS.

I assume that X11 isn't installed on your system but even if it is, installing the current XQuartz distribution of X11 for macOS should do no harm. You can obtain XQuartz from http://xquartz.macosforge.org. Like R and RStudio, XQuartz is free open-source software.

            1. Download the disk image (dmg) file for XQuartz.

            2. When you open this file by double-clicking on it, you'll find XQuartz.pkg; double-click on it to run the installer, clicking through all the defaults.

            3. Important: After the installer runs, you'll have to log out and back on to your macOS account, or just reboot your Mac.

### Installing R on Linux Systems <a name="part5"></a>

Visit the Comprehensive R Archive Network (CRAN) and select a mirror site near you; a list of CRAN mirrors appears at the upper left of the CRAN home page. I suggest that you use the 0-Cloud mirror, which is the first on the list. Click on the link Download R for Linux, which appears near the top of the page. R is available for several Linux distributions (Debian, RedHat, SUSE, and Ubuntu); select your distribution, and proceed as directed.

If you have a Linux or Unix system that's not compatible with one of these distributions, you will have to compile R from source code; the procedure for doing so is is described in the R FAQ (frequently asked questions) list.


### Installing RStudio  <a name="part6"></a>

Go to the RStudio download page, select the free version of RStudio Desktop, scroll down to Installers for Supported Platforms, and click on the link to the appropriate installer for your operating system (Windows, macOS, or Linux distro). Visit the RStudio home page for more information about RStudio.

Once it is downloaded, run the RStudio installer and take all of the defaults: In Windows, double-click on the RStudio installer to start the installation; in macOS, double-click on the downloaded RStudio disk-image file, and drag the RStudio icon to the Applications folder.

When you first run RStudio, it should detect your R installation and start the R console. To configure RStudio to your taste, select Tools > Global Options (Windows) or RStudio > Preferences (macOS) from the RStudio menus. In particular, I suggest that on the General options screen you deselect Restore .RData into workspace at startup, and set Save workspace to .RData on exit to Never.

Here's more info about RStudio: <a href="https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf" target="_blank">RStudio IDE cheatsheet</a>


### Installing R Packages <a name="part7"></a>

Once you have installed R and RStudio, you can install additional packages required for the course by typing the following command at the > command prompt in the R Console (and pressing the Enter or return key; but check RStudio):

install.packages(c("car", "effects", "knitr", "rgl", "rmarkdown"))

You can simply copy and paste this command from these installation instructions. Alternatively, you can install packages from the RStudio Packages tab. Be aware that, depending on the speed of your internet connection, it may take some time to download and install these packages and their dependencies.

Mod [from](https://socialsciences.mcmaster.ca/jfox/Courses/R/Western/R-install-instructions.html)


## Brief intro to R <a name="part8"></a>

Please click <a href="https://dmf2021.github.io/r_tuto.html" target="_blank">here</a> for a brief intro to R. We'll review these topics in class :). You can find more useful information <a href="https://www.rstudio.com/wp-content/uploads/2016/02/advancedR.pdf" target="_blank">here for advanced R</a> and <a href="http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf" target="_blank">here for base R</a>!





