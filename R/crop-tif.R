#' crop_worldpop_tif
#'
#' \code{.zip} files downloaded from worldpop are national-scale. This function
#' crops them to the designated cities, and converts them to much smaller geotif
#' files.
#'
#' @param city Name of city (one of "accra", "kathmandu", or "bristol")
#' @param expand Relative factor by which to expand cropping limits beyond
#' rectangular bounding box of city
#' @return Nothing Files are written to the corresponding directories
#'
#' @note This should be run from somewhere within the \code{whodata} repository
#' structure; anywhere else will likely fail.
#'
#' @export
crop_worldpop_tif <- function (city = "accra", expand = 0.1)
{
    bb <- osmdata::getbb (city)
    bb_exp <- t (apply (bb, 1, function (i)
                        i + c (-expand, expand) * diff (i)))
    wd <- file.path (here::here (), city, "worldpop")
    files <- list.files (wd)
    files <- file.path (wd, files [grep ("\\.zip", files)])

    if (length (files) == 0)
    {
        message ("No files to convert for ", city)
        return (NULL)
    }

    pb <- txtProgressBar (style = 3)
    count <- 1
    n <- length (files)
    for (f in files)
    {
        zfiles <- unzip (f, list = TRUE)$Name
        f1 <- zfiles [grep ("tif$", zfiles, ignore.case = TRUE)]
        unzip (f, files = f1)
        r <- raster::raster (f1) %>% raster::crop (bb_exp)
        f0 <- paste0 (tools::file_path_sans_ext (f1), ".zip")
        file.remove (file.path (wd, f0))
        file.remove (f1) # the full geotif dumped in current wd
        # faster convert file names to lower case, so
        f1 <- paste0 (tools::file_path_sans_ext (f1), ".tif")
        f1 <- file.path (wd, f1)
        raster::writeRaster (r, f1)
        setTxtProgressBar (pb, count / n)
        count <- count + 1
    }
    close (pb)
}
