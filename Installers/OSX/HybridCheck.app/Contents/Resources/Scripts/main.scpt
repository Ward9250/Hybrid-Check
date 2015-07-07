JsOsaDAS1.001.00bplist00�Vscript_rfunction runHybridCheck(){
	R.windows[0].miniaturized = true;
	R.cmd("chooseCRANmirror(ind = 83)");
    R.cmd("pkg <- c('devtools', 'shiny', 'shinydashboard', 'ggplot2', 'grid', 'gridExtra', 'ape', 'png')");
	R.cmd("new.pkg <- pkg[!(pkg %in% installed.packages())]");
	R.cmd("if(length(new.pkg)){install.packages(new.pkg)}");
	R.cmd("source('http://bioconductor.org/biocLite.R')");
	R.cmd("if(!('Biostrings' %in% installed.packages())){ biocLite('Biostrings', ask = F)}");
	R.cmd("if(!'IRanges' %in% installed.packages()){biocLite('IRanges', ask = F)}");
	R.cmd("if(!'HybridCheck' %in% installed.packages()){library(devtools); install_github('Ward9250/HybridCheck', ref = 'master')}");
	R.cmd("library(shiny)");
	R.cmd("runGitHub('HybridCheckApp', 'Ward9250', launch.browser = TRUE)");
}

function updateHybridCheck(){
	R.cmd("chooseCRANmirror(ind = 83)");
    R.cmd("pkg <- c('devtools', 'shiny', 'shinydashboard', 'ggplot2', 'grid', 'gridExtra', 'ape', 'png')");
	R.cmd("install.packages(pkg)");
	R.cmd("source('http://bioconductor.org/biocLite.R'); biocLite('BiocUpgrade'); biocLite(ask = F)");
	R.cmd("devtools::install_github('Ward9250/HybridCheck')");
	R.cmd("q(save = 'no')");
}

App = Application.currentApplication();
App.includeStandardAdditions = true;
update = App.displayDialog('Run HybridCheck or install / force an update?', {
	withTitle: 'HybridCheck - Recombination detection and dating',
	buttons: ['Run HybridCheck', 'Install / update']});
if(update.buttonReturned == 'Run HybridCheck'){
	R = Application("R");
	runHybridCheck();
}
if(update.buttonReturned == 'Install / update'){
	R = Application("R");
	updateHybridCheck();
}



                              �jscr  ��ޭ