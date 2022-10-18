// Run a set of unit tests of the AllQuotes class
// To execute, cd to the serverSide directory and give command:
//   node testAllQuotes.js
//   - N. Wilde, July 2020
const AllQuotes = require('./AllQuotes');
function logPass(tName){
    console.log("PASS - " + tName);
}
function logFail(tName){
    console.log("FAIL - " + tName )
    throw new Error("failed test: " + tName)
}

function runtests(){

    runtest1();
    runtest2();
    runtest3();

}

// T01 - Search for a quote and suceed
function runtest1(){
    let aq01 = new AllQuotes();
    aq01.addQuote("Every man is guilty of all the good he didn't do.");
    aq01.addQuote("Before you embark on a journey of revenge, dig two graves.");
    let res01 = aq01.findQuote("graves123");
    if (res01.search("Before you embark") > -1){
        logPass("T01");
    } else {
        logFail("T01");
    }
}

// T02 - Search for a quote and fail
function runtest2(){
    let aq01 = new AllQuotes();
    let res02 = aq01.findQuote("missing");
    if (res02.search("No matching quote") > -1){
        logPass("T02");
    } else {
        logFail("T02");
    }
}

// T03 - Load from file
function runtest3(){
    let aq03 = new AllQuotes();
    aq03.loadFromFile("../data/3_quotes.csv");
    let res03 = aq03.findQuote("smiles");
    if (res03.search("indicate where smiles have been") > -1){
        logPass("T03");
    } else {
        logFail("T03");
    }
}

runtests()