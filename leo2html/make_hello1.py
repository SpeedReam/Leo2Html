'''
Run this python script to process .\leo_source\hello1.leo into
.\html\hello1.html
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
    from leo2html import Leo2Html
    import leo.core.leoBridge as leoBridge

    if DEBUG:print("\n\nStarting make_hello1.py\n\n")
    if DEBUG:
        def o(data):print data
    else:
        def o(data):pass
    X = Leo2Html(INDENT, out=o)
    if X:
        filename = join(CWD, 'leo_source', "hello1.leo")
        isOK = X.open(filename)
    if isOK:
        filename = join(CWD, 'html', "hello1.html")
        X.process(filename)
    if X:
        del(X)
        X = None
    if DEBUG:print("\n\nFinishing make_hello1.py\n\n")
