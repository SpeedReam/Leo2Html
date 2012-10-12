#@+leo-ver=4-thin
#@+node:DSR.20121009151355.1213:@shadow make_syntax.py
'''
Run this python script to process .\leo_source\syntax.leo into
.\html\syntax.html
'''
if __name__ == "__main__":
    #@    @+others
    #@+node:DSR.20121009151355.1214:globals
    DEBUG = 1 # make this 1 to trace routine's progress (debugging)
    INDENT = 2
    X = None
    isOK = False
    CWD = ""
    #@nonl
    #@-node:DSR.20121009151355.1214:globals
    #@+node:DSR.20121009151355.1215:imports
    from os import getcwd
    from os.path import join
    from sys import path
    CWD = getcwd()
    path.append(join(CWD, 'py_src'))
    from leo2html import Leo2Html
    #@-node:DSR.20121009151355.1215:imports
    #@+node:DSR.20121009151355.1216:start
    if DEBUG:print("\n\nStarting make_syntax.py\n\n")
    #@-node:DSR.20121009151355.1216:start
    #@+node:DSR.20121009151355.1217:setup
    if DEBUG:
        def o(data):print data
    else:
        def o(data):pass
    #@-node:DSR.20121009151355.1217:setup
    #@+node:DSR.20121009151355.1218:run
    print "1"
    X = Leo2Html(INDENT, out=o)
    print "2"
    if X:
        filename = join(CWD, 'leo_source', "syntax.leo")
        isOK = X.open(filename)
    if isOK:
        filename = join(CWD, 'html', "syntax.html")
        X.process(filename)
    if X:
        del(X)
        X = None
    #@-node:DSR.20121009151355.1218:run
    #@+node:DSR.20121009151355.1219:stop
    if DEBUG:print("\n\nFinishing make_syntax.py\n\n")
    #@-node:DSR.20121009151355.1219:stop
    #@-others
#@-node:DSR.20121009151355.1213:@shadow make_syntax.py
#@-leo
