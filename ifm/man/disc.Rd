\name{disc}
\alias{disc}
% - Also NEED an '\alias' for EACH other topic documented here.
\title{
~~function to do ... ~~
}
\description{
~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
disc(r, n, bop = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{r}{
    ~~Describe \code{r} here~~
}
  \item{n}{
     ~~Describe \code{n} here~~
}
  \item{bop}{
     ~~Describe \code{bop} here~~
}
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
 ~put references to the literature/web site here ~
}
\author{
  ~~who you are~~
}
\note{
  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (r, n, bop = FALSE) 
{
    t < -1/(1 + r)
    e <- if (bop) {
        0:(n - 1)
    }
    else {
        1:n
    }
    return(t^e)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
