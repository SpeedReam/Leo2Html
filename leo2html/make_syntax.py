'''
Run this python script to process .\leo_source\syntax.leo into
.\html\syntax.html
'''
if __name__ == "__main__":
    DEBUG = 1 # make this 1 to trace routine's progress (debugging)
    INDENT = 2
    X = None
    isOK = False
    CWD = ""
    from os import getcwd
    from os.path import join
    from sys import path
    CWD = getcwd()
    path.append(join(CWD, 'py_src'))
    from leo2html import ReadLeo
    if DEBUG:print("\n\nStarting make_syntax.py\n\n")
    if DEBUG:
        def o(data):print data
    else:
        def o(data):pass
    print "1"
    X = ReadLeo(INDENT, out=o)
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
    if DEBUG:print("\n\nFinishing make_syntax.py\n\n")
