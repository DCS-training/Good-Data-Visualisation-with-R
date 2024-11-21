# Good-Data-Visualisation-with-R
Our guide on how we create data visualisations through R.

The **first session** offers an introduction to the ggplot2 package and a practical demonstration of the package. It focuses on topics such as: 

  * Ggplot2 syntax 

  *  Basic plots with ggplot2 

  *  Deeper customisation of plots, including labels, colour maps, and re-sizing/re-positioning legends 

  *  Exporting plots
    

The **second session** focusses on some principles for using data visualisation in research. A more freeform practical exercise with example data is then offered, and attendees can attempt to replicate and improve visualisations. This covers processes that include: 

  * Different types of plots and when and where each might be best used 

  * The pitfalls of misleading data visualisation 

  * Introduction to some more advanced visualisation possibilities
    

The **third session** will cover the visualisation of textual data. Researchers often wish to work with unstructured text data, often collected from archives and the internet. We will discuss effective visualisation of this data, including: 

   * Different types of plots and their areas of application 

   * Plot design, common pitfalls, and what makes text data visualisation effective
     
*****

The course will ultimately help to develop a foundational understanding of Visualisation in R. Crucially, this will foster a familiarity with the principles of data visualisation and the capabilities of the software, allowing attendees to confidently apply these, or indeed seek out new concepts for their current and future research. 

For this course, you will need to have access to R and R Studio

## How to to get set up

### On Noteable

1. Go to https://noteable.edina.ac.uk/login
2. Login with your EASE credentials
3. Select RStudio as a personal notebook server and press start
4. Go to File > New Project> Version Control > Git
5. Copy and Paste this repository URL https://github.com/DCS-training/IntroToStatistics_2023 as the Repository URL
6. The Project directory name will filled in automatically but you can change it if you want your folder in Notable to have a different name
7. Decide where to locate the folder. By default, it will locate it in your home directory 
8. Press Create Project

Congratulations you have now pulled the content of the repository on your Notable server space.

### On your own machine

#### R and RStudio

* R and RStudio are separate downloads and installations. R is the
underlying statistical computing environment, but using R alone is no
fun. RStudio is a graphical integrated development environment (IDE) that makes
using R much easier and more interactive. You need to install R before you
install RStudio.

##### Windows

> ### If you already have R and RStudio installed
>
> * Open RStudio, and click on "Help" > "Check for updates". If a new version is
> available, quit RStudio, and download the latest version for RStudio.
> * To check which version of R you are using, start RStudio and the first thing
>  that appears in the console indicates the version of R you are
>  running. Alternatively, you can type `sessionInfo()`, which will also display
>  which version of R you are running. Go on
>  the [CRAN website](https://cran.r-project.org/bin/windows/base/) and check
> whether a more recent version is available. If so, please download and install
> it. You can [check here](https://cran.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-UNinstall-R_003f) for
> more information on how to remove old versions from your system if you wish to do so.

> ### If you don't have R and RStudio installed
>
> * Download R from
>  the [CRAN website](https://cran.r-project.org/bin/windows/base/release.htm).
> * Run the `.exe` file that was just downloaded
> * Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
> * Under *Installers* select **RStudio x.yy.zzz - Windows Vista/7/8/10** (where x, y, and z represent version numbers)
> * Double click the file to install it
> * Once it's installed, open RStudio to make sure it works and you don't get any
> error messages.


##### macOS

> ### If you already have R and RStudio installed
>
> * Open RStudio, and click on "Help" > "Check for updates". If a new version is
>	available, quit RStudio, and download the latest version for RStudio.
>	* To check the version of R you are using, start RStudio and the first thing
>	  that appears on the terminal indicates the version of R you are running. Alternatively, you can type `sessionInfo()`, which will 
>	also display which version of R you are running. Go on
>	  the [CRAN website](https://cran.r-project.org/bin/macosx/) and check
>	  whether a more recent version is available. If so, please download and install
>	  it.
{: .solution}

> ### If you don't have R and RStudio installed
>
> * Download R from
>   the [CRAN website](https://cran.r-project.org/bin/macosx/).
> * Select the `.pkg` file for the latest R version
> * Double click on the downloaded file to install R
> * It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed
>   by some packages)
> * Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
> * Under *Installers* select **RStudio x.yy.zzz - Mac OS X 10.6+ (64-bit)**
>   (where x, y, and z represent version numbers)
> * Double click the file to install RStudio
> * Once it's installed, open RStudio to make sure it works and you don't get any
>   error messages.

##### Linux

* Follow the instructions for your distribution
 from [CRAN](https://cloud.r-project.org/bin/linux), they provide information
 to get the most recent version of R for common distributions. For most
 distributions, you could use your package manager (e.g., for Debian/Ubuntu run
 `sudo apt-get install r-base`, and for Fedora `sudo yum install R`), but we
 don't recommend this approach as the versions provided by this are
 usually out of date. In any case, make sure you have at least R 3.5.1.
* Go to the [RStudio download
  page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select the version that matches your distribution, and
   install it with your preferred method (e.g., with Debian/Ubuntu `sudo dpkg -i
   rstudio-x.yy.zzz-amd64.deb` at the terminal).
* Once it's installed, open RStudio to make sure it works and you don't get any
   error messages.

## Packages needed

The following pacakges will need installing for this workshop:

* tidyverse
* jtools
* psych
* palmerpenguins
* gt

Useful reading:
A layered grammar of graphics - Hadley Wickham https://www.tandfonline.com/doi/epdf/10.1198/jcgs.2009.07098?needAccess=true

Useful guides:
https://www.cedricscherer.com/ 

