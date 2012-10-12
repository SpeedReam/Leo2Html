#@+leo-ver=4-thin
#@+node:DSR.20121009151355.1196:@shadow make_hello2.py
'''
Run this python script to process .\leo_source\hello2.leo into
.\html\hello2.html
'''
if __name__ == "__main__":
    #@    @+others
    #@+node:DSR.20121009151355.1197:globals
    DEBUG = 1 # make this 1 to trace routine's progress (debugging)
    INDENT = 2
    X = None
    isOK = False
    CWD = ""
    #@nonl
    #@-node:DSR.20121009151355.1197:globals
    #@+node:DSR.20121009151355.1198:imports
    from os import getcwd
    from os.path import join
    from sys import path
    CWD = getcwd()
    path.append(join(CWD, 'py_src'))
    from leo2html import Leo2Html
    #@-node:DSR.20121009151355.1198:imports
    #@+node:DSR.20121009151355.1199:start
    if DEBUG:print("\n\nStarting make_hello2.py\n\n")
    #@-node:DSR.20121009151355.1199:start
    #@+node:DSR.20121009151355.1200:setup
    if DEBUG:
        def o(data):print data
    else:
        def o(data):pass
    #@-node:DSR.20121009151355.1200:setup
    #@+node:DSR.20121009151355.1201:run
    print "1"
    X = Leo2Html(INDENT, out=o)
    print "2"
    if X:
        filename = join(CWD, 'leo_source', "hello2.leo")
        isOK = X.open(filename)
    if isOK:
        filename = join(CWD, 'html', "hello2.html")
        X.process(filename)
    if X:
        del(X)
        X = None
    #@-node:DSR.20121009151355.1201:run
    #@+node:DSR.20121009151355.1202:stop
    if DEBUG:print("\n\nFinishing make_hello2.py\n\n")
    #@-node:DSR.20121009151355.1202:stop
    #@-others
#@-node:DSR.20121009151355.1196:@shadow make_hello2.py
#@-leo
