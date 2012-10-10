@rem
@rem Execute this batch file to run the python script make_hello1.py.
@rem make_hello1.py turns .\leo_source\syntax.leo into .\html\syntax.html
@rem
@rem NOTE!!
@rem Change __python__ to point to your python installation
@rem
@rem
@set __python__=C:\Python273Build2010\Python-2.7.3\PCbuild\python.exe
@rem
@rem
                   "%__python__%" make_syntax.py
@rem
@rem
@set __python__=
