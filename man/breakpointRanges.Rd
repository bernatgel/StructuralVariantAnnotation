% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extensions-VCF.R
\docType{methods}
\name{breakpointRanges}
\alias{breakpointRanges}
\alias{breakpointRanges,VCF-method}
\alias{.breakpointRanges}
\title{Extracting the structural variants as a GRanges.}
\usage{
breakpointRanges(x, ...)

\S4method{breakpointRanges}{VCF}(x, ...)

.breakpointRanges(vcf, nominalPosition = FALSE,
  placeholderName = "svrecord", suffix = "_bp", info_columns = NULL,
  unpartneredBreakends = FALSE)
}
\arguments{
\item{x}{A VCF object}

\item{...}{Parameters of \code{.breakpointRanges()}. See below.}

\item{vcf}{A VCF object.}

\item{nominalPosition}{Determines whether to call the variant at the
nominal VCF position, or to call the confidence interval (incorporating
any homology present). Default value is set to FALSE, where the interval is
called based on the CIPOS tag. When set to TRUE, the ranges field contains
the nomimal variant position only.}

\item{placeholderName}{Variant name prefix to assign to unnamed variants.}

\item{suffix}{The suffix to append to varaint names.}

\item{info_columns}{VCF INFO columns to include in the GRanges object.}

\item{unpartneredBreakends}{Determining whether to report unpartnered 
breakends. Default is set to FALSE.}
}
\value{
A GRanges object of SVs.
}
\description{
Extracting the structural variants as a GRanges.

.breakpointRanges() is an internal function for extracting structural 
variants as GRanges.
}
\details{
Structural variants are converted to breakend notation.
Due to ambiguities in the VCF specifications, structural variants
with multiple alt alleles are not supported.
The CIPOS tag describes the uncertainty interval of the around the postition
of the breakend. See Section 5.4.8 of
\url{https://samtools.github.io/hts-specs/VCFv4.3.pdf} for details of CIPOS.
If HOMLEN or HOMSEQ is defined without CIPOS, it is assumed that
the variant position is left aligned.
A breakend on the '+' strand indicates a break immediately after the given
position, to the left of which is the DNA segment involved in the breakpoint.
The '-' strand indicates a break immediately before the given position,
rightwards of which is the DNA segment involved in the breakpoint.
Unpaired variants are removed at this stage.
}
\section{Methods (by class)}{
\itemize{
\item \code{VCF}: Extracting structural variants as GRanges.
}}

\examples{
vcf.file <- system.file("extdata", "vcf4.2.example.sv.vcf",
                         package = "StructuralVariantAnnotation")
vcf <- VariantAnnotation::readVcf(vcf.file, "hg19")
breakpointRanges(vcf)
breakpointRanges(vcf, nominalPosition=TRUE)
}
