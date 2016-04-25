\name{Disc}
\alias{Disc}
Valor futuro
\title{
Valor futuro
}
\description{
Calculate compound tax at period
}
\usage{
Disc(x, y, z)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
     Tax rate applied in the period
}
\item{y}{
     Number of period
}
\item{z}{
     Period convention: 0 - begin of period, 1 - end of period
}
}
\details{
    Calculate a future value considering tax and period
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Discipline Software Engineering
}
\author{
UFRJ - Economics in Software Engineering
}
\note{
Discipline Software Engineering
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

d<-disc(0.0124,12,0)
tax rate = 1,24%, periods = 12, bop =0
}
\keyword{valor futuro}
