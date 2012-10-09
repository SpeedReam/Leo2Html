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
<v t="DSR.20121008174459.1279"><vh>top</vh></v>
<v t="DSR.20121008174459.1253" a="E"><vh> @shadow py_src\leo2html.py</vh>
<v t="DSR.20121008174459.1276"><vh>top</vh></v>
<v t="DSR.20121008174459.1278"><vh>imports</vh></v>
<v t="DSR.20121008174459.1254"><vh>globals</vh></v>
<v t="DSR.20121008174459.1255" a="E"><vh>class ReadLeo</vh>
<v t="DSR.20121008174459.1256"><vh>do_tag</vh></v>
<v t="DSR.20121008174459.1257" a="E"><vh>class htag</vh>
<v t="DSR.20121008174459.1258"><vh>write_open</vh></v>
<v t="DSR.20121008174459.1259"><vh>write_close</vh></v>
<v t="DSR.20121008174459.1260"><vh>__init__</vh></v>
<v t="DSR.20121008174459.1261"><vh>set_attribs</vh></v>
<v t="DSR.20121008174459.1262"><vh>set_tags</vh></v>
</v>
<v t="DSR.20121008174459.1263"><vh>do_tree</vh></v>
<v t="DSR.20121008174459.1264"><vh>html</vh></v>
<v t="DSR.20121008174459.1265"><vh>process</vh></v>
<v t="DSR.20121008174459.1266"><vh>do_next_tree</vh></v>
<v t="DSR.20121008174459.1267"><vh>handle_special</vh></v>
<v t="DSR.20121008174459.1268"><vh>make_children</vh></v>
<v t="DSR.20121008174459.1269"><vh>doctype</vh></v>
<v t="DSR.20121008174459.1270"><vh>write</vh></v>
<v t="DSR.20121008174459.1271"><vh>get_first_children</vh></v>
<v t="DSR.20121008174459.1272"><vh>open</vh></v>
<v t="DSR.20121008174459.1273"><vh>get_tempfile</vh></v>
<v t="DSR.20121008174459.1274"><vh>__del__</vh></v>
<v t="DSR.20121008174459.1275"><vh>__init__</vh></v>
</v>
</v>
<v t="DSR.20121008174459.1283"><vh>support files</vh>
<v t="DSR.20121008174459.1285" a="E"><vh>python files</vh>
<v t="DSR.20121008174459.1287" a="E"><vh>@shadow make_hello1.py</vh></v>
</v>
<v t="DSR.20121008174459.1284" a="E"><vh>batch files</vh>
<v t="DSR.20121008174459.1282"><vh>@asis make_hello1.bat</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="DSR.20121008174459.1253">@language python
@others
</t>
<t tx="DSR.20121008174459.1254">c = g = None
TAB = INDENT = "  "
</t>
<t tx="DSR.20121008174459.1255">class ReadLeo(QBase):
    @others
</t>
<t tx="DSR.20121008174459.1256">def do_tag(self, position):
    '''
    If we get to this routine, we assume the headline text of the Leo
    file postion is an html tag. This tag is either a special tag like
    &lt;br&gt; which has no other content, or it may have attributes like
    &lt;img&gt;, or it may just have content like a plain &lt;div&gt;. This tag
    may also be the start of another html tree consisting of additional
    tags, content, etc.
    Returns True on success, False on fatal error.
    '''
    t()
    try:
        headline = position.h.lower()
    except:
        o("Cannot get headline text from postion: %s" % str(position))
        return False
    # compute tag elements
    indent = self.indent * self.indent_char
    newtag = self.htag(headline, position, indent, self.tfile)
    # write tag
    if not newtag.write_open():return False
    self.indent += 1
    if not self.do_next_tree(position):return False
    self.indent -=1
    if not newtag.write_close():return False
    return True

</t>
<t tx="DSR.20121008174459.1257">class htag:
    # non typical html tags 
    tags = []
    tags.append(("br", "empty"))
    tags.append(("hr", "empty"))
    tags.append(("img", "single"))
    tags.append(("meta", "single"))
    tags.append(("link", "single"))
    tags.append(("html", "newline"))
    tags.append(("head", "newline"))
    tags.append(("style", "newline"))
    tags.append(("script", "newline"))
    tags.append(("body", "newline"))
    tags.append(("div", "newline"))
    tags.append(("ul", "newline"))

    @others
</t>
<t tx="DSR.20121008174459.1258">def write_open(self):
    # see if any body content, meaning attributes
    if len(self.attribs):
        self.tag = "&lt;%s" % self.text
        self.ofile.write("\n" + self.indent + self.tag)
        for item in self.attribs:
            if len(item):
                itext = item.strip("\r\n\t ")
                self.ofile.write("\n" + self.indent + " " + itext)
        if self.single or self.empty:
            self.ofile.write(" /&gt;")
        else:
            self.ofile.write("&gt;")
        return True
    self.ofile.write("\n" + self.indent + self.tag)
    return True
    
</t>
<t tx="DSR.20121008174459.1259">def write_close(self):
    # nothing to write if a singleton tag
    if self.single:
        return True
    if self.empty:
        return True
    # handle comments
    if self.close.startswith("&lt;!"):
        #self.ofile.write("\n" + self.indent + self.close)
        self.ofile.write(" " + self.close)
        return True
    # handle regular tags
    itext = self.text.split(" ")[0]
    self.close = "&lt;/%s&gt;" % itext
    for atag, atype in self.tags:
        if atag == itext:
            if atype == "newline":
                self.ofile.write("\n" + self.indent + self.close)
                return True
    self.ofile.write(self.close)
    return True
    
</t>
<t tx="DSR.20121008174459.1260">def __init__(self, text, position, indent, ofile, comments=True):
    # setup argument data
    self.text = text
    self.position = position
    self.indent = indent # current indent characters
    self.ofile = ofile # open output file object
    self.comments = comments # True if we should show comments
    # setup instance data
    self.single = False
    self.empty = False
    self.tag = None
    self.close = None
    self.attribs = []
    # compute opening and closing tags
    self.set_tags()

</t>
<t tx="DSR.20121008174459.1261">def set_attribs(self):
    '''
    Given a position whose headline is a tag, check the immediate
    children of the node to see if any start with '+'. If so, these are
    the tag's attributes.
    '''
    body_text = self.position.b
    if len(body_text):
        lines = body_text.split("\n")
        for aline in lines:
            self.attribs.append(aline)
    return True

</t>
<t tx="DSR.20121008174459.1262">def set_tags(self):
    # handle comments
    if self.text.startswith("!"):
        itext = self.text[1:]
        self.tag = "&lt;!-- %s --&gt;" % itext
        self.close = "&lt;!-- /%s --&gt;" % itext
        return
    # handle any special case tags
    for atag, ttype in self.tags:
        if atag == self.text:
            if ttype == "empty":
                self.tag = "&lt;%s /&gt;" % self.text
                self.empty = True
            elif ttype == "single":
                self.tag = "&lt;%s /&gt;" % self.text
                self.single = True
            else:
                self.close = "&lt;/%s&gt;" % self.text
    # if we haven't already generated a tag, do so
    if not self.tag:
        if not self.single:
            self.tag = "&lt;%s&gt;" % self.text
            self.close = "&lt;/%s&gt;" % self.text
        else:
            self.tag = "&lt;%s /&gt;" % self.text
    # handle any tag attributes.
    self.set_attribs()

</t>
<t tx="DSR.20121008174459.1263">def do_tree(self, position):
    '''
    Process this outline element, plus all siblings of this element.
    Do not call this routine unless you are sure this is part of an
    html subtree of a leo file. It is intended that this routine be
    called recursively.
    Returns False on unrecoverable error, otherwise True
    '''
    t()
    # list all first level elements of this tree (positions)
    first_level_positions = []
    for pos in position.self_and_siblings():
        first_level_positions.append(pos.copy())

    for item in first_level_positions:
        headline = item.h.lower()
        # process special case nodes
        result = self.handle_special(item)
        # if we got an error, we are done with the tree
        if result == -1:return False
        # if true, this item has been processed
        if result:continue
        # the position is a tag. Process it.
        if not self.do_tag(item):return False
    
    return True

</t>
<t tx="DSR.20121008174459.1264">def html(self):
    '''
    This routine will process the first node in a Leo file that has a
    headline of 'html'. Use this node as the top of a tree and generate
    an html file using Leo as the outline for the file.
    Returns True on success, otherwise False.
    '''
    t()
    if not self.first_children:
        self.get_first_children()
    for item in self.first_children:
        if item.h.lower() == "html":
            # this will process the whole html tree recursively
            if not self.do_tree(item):return False
            return True
    return False

</t>
<t tx="DSR.20121008174459.1265">def process(self, outname):
    '''
    flexure.open must have been called prior to calling this routine.
    outname is the full path of the file to be output (the html page).
    All output goes to a temporary file. If no errors are encountered,
    the temporary file is copied to the output file (outname).
    Returns True on success, otherwise False.
    '''
    t()
    # save output file name
    self.outname = outname
    # get the temporary output file
    if not self.get_tempfile():return False
    # process the doctype, if there is one
    if not self.doctype():return False
    # process the html tag. It is an error if there is no tag
    if not self.html():return False
    return True

</t>
<t tx="DSR.20121008174459.1266">def do_next_tree(self, position):
    '''
    Given a position, process the next level down from the position.
    Return True on success, otherwise False
    '''
    t()
    # get the children of this position.
    children = self.make_children(position)
    if len(children):
        for child in children:
            return self.do_tree(child)
    return True

</t>
<t tx="DSR.20121008174459.1267">def handle_special(self, position):
    '''
    This routine handles special nodes of a Leo html source file. The
    special nodes are:
    1. content
       content gets output without further processing. In other words,
       just output the body text to the html file.
    2. doctype
       ignore any doctype (a doctype at the top of a Leo file has
       already been processed.)
    3. - elements
       nodes starting with '-' are comments.
       These are ignored.
    4. obselete
       nodes starting with this are ignored
    Returns:
        True if the position has been processed
        False if the position was not processed
        -1 if there was an error
    '''
    t()
    headline = position.h.lower()
    if headline == "doctype":
        return True
    if headline == "content":
        if not self.write(position.b, NL=False):return -1
        return True
    if headline == "+content":
        body_text = position.b
        if len(body_text):
            lines = body_text.split("\n")
            for aline in lines:
                if not self.write(aline):return -1
        return True
    if headline == "obselete":
        return True
    if headline.startswith("-"):
        return True
    return False

</t>
<t tx="DSR.20121008174459.1268">def make_children(self, position):
    '''
    This routine cannot fail. It returns either [] or a list of all
    children of the given position.
    '''
    t()
    children = []
    for item in position.children():
        children.append(item.copy())
    return children

</t>
<t tx="DSR.20121008174459.1269">def doctype(self):
    '''
    Process the first line of the final html file. This is the
    doctype, if it exists. This does not have to be the first top-level
    child of the leo outline.
    Returns True if no doctype, or if the doctype was written.
    Returns False on error attempting to write the doctype.
    '''
    t()
    if not self.first_children:
        self.get_first_children()
    for item in self.first_children:
        if item.h.lower() == "doctype":
            if not self.write(item.b, NL=False):return False
    return True

</t>
<t tx="DSR.20121008174459.1270">def write(self, data, NL=True):
    '''
    Write data to the current temporary file.
    If NL, add a carriage return plus indent at the beginning of the
    line.
    '''
    try:
        if NL:
            prelim = self.indent * self.indent_char
            self.tfile.write("\n" + prelim)
        self.tfile.write(data)
        return True
    except:
        o("Error writing.\n")
        return False

</t>
<t tx="DSR.20121008174459.1271">def get_first_children(self):
    '''
    Get the highest level children of the LEO file. These children may
    be:
    doctype
    html
    settings
    There may be other high-level children. These will be ignored by
    the logic in this module. These may obviously be used by other
    modules for other purposes.
    This routine has no error return value. It always returns [] or the
    the first children.
    '''
    t()
    # Get the topmost position in the outline
    self.first_children = []
    for p in c.all_positions():
        self.top_position = p
        break
    self.first_children.append(self.top_position.copy())
    # List all siblings of the topmost postion.
    for position in self.top_position.following_siblings():
        self.first_children.append(position.copy())
    return True

</t>
<t tx="DSR.20121008174459.1272">def open(self, filename):
    '''
    Attempt to open the Leo file 'filename'.
    Filename is the full path.
    Return True on success, else False.
    '''
    t()
    o("filename = %s" % filename)
    global c, g
    c = g = None
    try:
        import leo.core.leoBridge as leoBridge
        controller = leoBridge.controller(gui='nullGui')
        g = controller.globals()
        c = controller.openLeoFile(filename)
    except:
        o("Cannot open Leo file %s" % str(filename))
        c = g = None
        raise
        return False
    return True

</t>
<t tx="DSR.20121008174459.1273">def get_tempfile(self):
    t()
    try:
        import tempfile
        self.tfile = tempfile.TemporaryFile()
        return True
    except:
        o("\nError: Cannot create a temporary file.\n")
        return False

</t>
<t tx="DSR.20121008174459.1274">def __del__(self):
    o("leo2html.ReadLeo.__del__()")
    if self.tfile:
        self.tfile.seek(0)
        data = self.tfile.read()
        o(data)
        self.tfile.close()
        self.tfile = None
    if self.outname:
        outf = open(self.outname, 'wb')
        outf.write(data)
        outf.close()
        self.outname = None

</t>
<t tx="DSR.20121008174459.1275">def __init__(self, out=None, ar=None):
    # standard setup for QBase
    QBase.__init__(self, out=out, ar=ar)
    global t,o;t=self.t;o=self.o;
    t()
    # Zero out Leo globals
    global c, g
    c = g = None
    # Set instance variables to default values
    self.leofile = None # name of leo input file
    self.first_children = None
    self.outname = None # name of output html file
    self.tfile = None # temporary output file object
    # The following should be settable somehow.
    global TAB, INDENT
    self.indent_size = 2
    self.indent_char = " "
    INDENT = "  "
    self.indent = 0
    self.tab_size = 2
    self.tab_char = " "
    self.tab = TAB = "  "
</t>
<t tx="DSR.20121008174459.1276">'''
Parse a LEO File into an HTML file.

Ver. 0.0.2, originated October 8, 2012
Ver. 0.0.1, originated September 12, 2012
@author: David Speed Ream
Copyright David Speed Ream 2012, all rights reserved.
'''
</t>
<t tx="DSR.20121008174459.1278">from qobj import QBase
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
</tnodes>
</leo_file>
