<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="DSR.20121009151355.1188"><vh>obselete</vh>
<v t="DSR.20121008174459.1274"><vh>__del__</vh></v>
</v>
<v t="DSR.20121008174459.1279"><vh>top</vh></v>
<v t="DSR.20121008174459.1283"><vh>support files</vh>
<v t="DSR.20121008174459.1285" a="E"><vh>python files</vh>
<v t="DSR.20121008174459.1287" a="E"><vh>@shadow make_hello1.py</vh></v>
</v>
<v t="DSR.20121008174459.1284"><vh>batch files</vh>
<v t="DSR.20121008174459.1282"><vh>@asis make_hello1.bat</vh></v>
</v>
</v>
<v t="DSR.20121008174459.1253" a="E"
expanded="DSR.20121008174459.1255,"><vh>@shadow py_src\leo2html.py</vh></v>
</vnodes>
<tnodes>
<t tx="DSR.20121008174459.1274">def __del__(self):
    print("leo2html.ReadLeo.__del__()")
    if self.tfile:
        self.tfile.seek(0)
        data = self.tfile.read()
        #print(data)
        self.tfile.close()
        self.tfile = None
    if self.outname:
        outf = open(self.outname, 'wb')
        outf.write(data)
        outf.close()
        self.outname = None

</t>
<t tx="DSR.20121008174459.1279">'''
Parse a LEO File into an HTML file.

Ver. 0.0.2, originated October 8, 2012
Ver. 0.0.1, originated September 12, 2012
@author: David Speed Ream
Copyright David Speed Ream 2012, all rights reserved.
'''
</t>
<t tx="DSR.20121008174459.1282">@rem
@rem Execute this batch file to run the python script make_hello1.py.
@rem make_hello1.py turns .\leo_source\hello1.leo into .\html\hello1.html
@rem
@rem NOTE!!
@rem Change __python__ to point to your python installation
@rem
@rem
@set __python__=C:\Python273Build2010\Python-2.7.3\PCbuild\python.exe
@rem
@rem
                   "%__python__%" make_hello1.py
@rem
@rem
@set __python__=
</t>
<t tx="DSR.20121008174459.1283"></t>
<t tx="DSR.20121008174459.1284">@language plain
</t>
<t tx="DSR.20121008174459.1285">@language python
</t>
<t tx="DSR.20121009151355.1188"></t>
</tnodes>
</leo_file>
