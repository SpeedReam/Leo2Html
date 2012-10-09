#@+leo-ver=4-thin
#@+node:DSR.20121008174459.1287:@shadow make_hello1.py
'''
Run this python script to process .\leo_source\hello1.leo into
.\html\hello1.html
'''
if __name__ == "__main__":
    #@    @+others
    #@+node:DSR.20121008174459.1289:globals
    DEBUG = 1
    X = None
    isOK = False
    CWD = ""
    #@nonl
    #@-node:DSR.20121008174459.1289:globals
    #@+node:DSR.20121008174459.1290:imports
    from os import getcwd
    from os.path import join
    from sys import path
    CWD = getcwd()
    path.append(join(CWD, 'py_src'))
    from leo2html import ReadLeo
    #@-node:DSR.20121008174459.1290:imports
    #@+node:DSR.20121008174459.1293:start
    if DEBUG:print("\n\nStarting make_hello.py\n\n")
    #@-node:DSR.20121008174459.1293:start
    #@+node:DSR.20121008174459.1291:setup
    if DEBUG: # make this 1 to trace routine's progress (debugging)
        def o(data):print data
    else:
        def o(data):pass
    #@-node:DSR.20121008174459.1291:setup
    #@+node:DSR.20121008174459.1292:run
    X = ReadLeo(out=o)
    if X:
        filename = join(CWD, 'leo_source', "hello1.leo")
        isOK = X.open(filename)
    if isOK:
        filename = join(CWD, 'html', "hello1.html")
        X.process(filename)
    if X:
        del(X)
        X = None
    #@-node:DSR.20121008174459.1292:run
    #@+node:DSR.20121008174459.1295:stop
    if DEBUG:print("\n\nFinishing make_hello.py\n\n")
    #@-node:DSR.20121008174459.1295:stop
    #@-others
#@-node:DSR.20121008174459.1287:@shadow make_hello1.py
#@-leo
