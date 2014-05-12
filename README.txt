Flexbar — flexible barcode and adapter removal, version 2.4
Bioinformatics in Quantitative Biology at BIMSB, GPLv3

=== Installation ===

To run binaries, make sure that the TBB library (Intel Threading Building Blocks) is available to the system. Flexbar binaries are provided for Linux 64, Mac OSX ≥ 10.7.4, Windows 32 and 64 bit systems on: flexbar.sourceforge.net

### Linux
One possibility is to put the file libtbb.so.2 in your working directory. To use it permanently, install the library runtime files from the repository of your distribution, or copy libtbb.so.2 to the shared library directory with the following command, or ask the administrator to install it:
sudo cp FLEXBAR_DIR/libtbb.so.2 /usr/local/lib

Or adjust the lib search path to include the directory of the lib file for the current terminal session:
export LD_LIBRARY_PATH=FLEXBAR_DIR

### Mac OSX
It applies the same as for Linux. Make the file libtbb.dylib available:
sudo cp FLEXBAR_DIR/libtbb.dylib /usr/local/lib

Or set the lib search path accordingly:
export DYLD_LIBRARY_PATH=FLEXBAR_DIR

### Windows
Keep the file tbb.dll in the directory of the Flexbar executable. Visual Studio 10 sp1 has to be installed. Alternatively, those who have not this program version can download the Visual Studio 10 sp1 redistributable package from Microsoft.
Win 32: www.microsoft.com/en-us/download/details.aspx?id=8328
Win 64: www.microsoft.com/en-us/download/details.aspx?id=13523

=== Program usage ===

Flexbar needs at least one file with sequencing reads in fasta/q or csfasta/q format as input. Additionally, the target name, quality format of reads and further options can be specified. For barcode based read seperation and adapter removal, a file in fasta format with barcode or adapter sequences should be provided.

Please refer to the help screen (flexbar -h) or documentation on:
sourceforge.net/p/flexbar/wiki

SYNOPSIS
    flexbar -r reads [-t target] [-b barcodes] [-a adapters] [options]

EXAMPLES
    flexbar -r reads.fq -f i1.8 -t target -b brc.fa -a adap.fa
    flexbar -r reads.csfastq.gz -a adap.fa -ao 5 -ae LEFT -c

In the first example, barcoded reads in illumina version 1.8 fastq format are demultiplexed by specifying a file with barcodes in fasta format. After read seperation based on barcodes, adapters given in fasta format are removed from the right side if they align at the read beginning or downstream. After removal the left side of reads is kept. Remaining reads are written to the file target.fastq in same format.
The second example, shows how to remove adapters in fasta format from left side of gzip compressed color-space (c) reads with quality scores (csfastq), if the overlap of adapter and read has at least length five. For left trim-end type the right side of reads is retained.

Although default parameters of Flexbar are optimized to deliver good results in a large number of scenarios, the adjustment of parameters might improve results, e.g. --adapter-min-overlap and --adapter-threshold.

=== Building from SVN ===

1) Check out the SVN repository to a local directory FLEXBAR_DIR:
svn co http://svn.code.sf.net/p/flexbar/code/trunk FLEXBAR_DIR

2) Download TBB library, if you dont have Linux, Windows or Mac OSX running. For these systems the lib files are supplied together with binaries. Download the latest stable source release. It should work with version >= 3.0, then unpack the archive and run gmake in the unpacked folder.
http://www.threadingbuildingblocks.org/file.php?fid=77

3) Make the TBB library available in your library searchpath. For Linux 64, Mac OSX or Windows follow the steps for binaries above. If you compiled TBB yourself copy the compiled lib to your library searchpath and change the line "LINK_DIRECTORIES(${FLEXBAR_SOURCE_DIR}/lib/linux64)" in file FLEXBAR_DIR/src/CMakeLists.txt to include your TBB_INSTALL_DIR/build/release folder.

4) Get cmake from cmake.org and install it. Change to FLEXBAR_DIR on command line and type the following:
cmake .

5) Compile source code by issuing make in FLEXBAR_DIR. In general, the seqan and tbb library (in FLEXBAR_DIR/lib) need to be available to the compiler and linker. In case of eclipse, import the project from FLEXBAR_DIR and compile Flexbar after setting the lib path in the project settings.

=== Project folders ===

lib:      shared tbb libs for Linux 64, Mac OSX, Windows
include:  versions of SeqAn and tbb libraries
test:     small test datasets

To run Flexbar with the test dataset, make sure flexbar is reachable via the path variable and run flexbar_validate.sh within the test folder.

