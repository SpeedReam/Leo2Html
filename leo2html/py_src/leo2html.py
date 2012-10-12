'''
Parse a LEO File into an HTML file.

Ver. 0.0.3, originated October 11, 2012
Ver. 0.0.2, originated October 8, 2012
Ver. 0.0.1, originated September 12, 2012
@author: David Speed Ream
Copyright David Speed Ream 2012, all rights reserved.
'''
from qobj import QBase
c = g = None
class Leo2Html:
    def __init__(self,c,indent_size=None):

        # Set instance variables to default values
        self.c = c
        self.indent_pos = 0 # indent position
        self.indent_size = indent_size or abs(c.tab_width)
        self.fn = None # The full file name.
        self.root = None # the html node.
        self.tfile = None # temporary output file object

    def indent (self,n):
        
        '''
        Return the leading whitespace corresponding to n tab stops.
        Use blanks if self.indent_size < 0, otherwise use hard tabs.
        '''
        
        if self.indent_size < 0:
            return n * abs(self.indent_size) * ' '
        else:
            return n * '\t'
    def process(self,fn,p):
        '''
        fn is the full path of the file to be output (the html page).
        p is the @html-file node.
        All output goes to a temporary file. If no errors are encountered,
        the temporary file is copied to the fn.
        '''
        try:
            import tempfile
            assert fn and p
            self.root = p.copy()
            self.fn = fn
            self.tfile = tempfile.TemporaryFile()
            assert self.tfile,'Can not create tempory file'
            self.doctype(self.root)
            for p in self.root.children():
                self.do_node(p)
            self.write_file()
            g.es_print('wrote: %s' % (fn))
        except AssertionError:
            g.es_exception()
        except Exception:
            g.es_exception()
    def do_node (self,p):

        self.handle_special(p) or self.do_tag(p)
    def do_tag(self,p):
        
        '''
        p.h is an html tag. This tag is either a special tag like <br> which
        has no other content, or it may have attributes like <img>, or it may
        just have content like a plain <div>. This tag may also be the start of
        another html tree consisting of additional tags, content, etc.
        '''

        tag = self.htag(p,self.indent_pos,self.indent_size,self.tfile)
        tag.write_open()
        self.indent_pos += 1
        for child in p.children():
            self.do_node(child)
        self.indent_pos -=1
        tag.write_close()
    def handle_special(self, p):
        '''
        Handles special nodes of a Leo html source file. The special nodes are:
        1. content
           content gets output without further processing. In other words,
           just output the body text to the html file.
        2. +content
           content gets inserted line by line with the current indent added
           to the start of each line.
        3. doctype
           ignore any doctype (a doctype at the top of a Leo file has
           already been processed.)
        4. - elements
           headlines starting with '-' are comments used in the leo file but
           not to be used in the final html. These are ignored.
        5. obselete
           nodes starting with this are ignored
        Return True if the position p has been processed.
        '''

        h = p.h.lower().strip()
        if h.startswith("-") or h in ("doctype","obselete"):
            return True
        elif h == "content":
            self.write(p.b,NL=False)
            return True
        elif h == "+content":
            for s in p.b.split("\n"):
                self.write(s)
            return True
        else:
            return False
    def write (self,data,NL=True):
        '''
        Write data to the current temporary file.
        If NL, add a carriage return plus indent at the beginning of the line.
        '''

        if NL:
            lws = self.indent(self.indent_pos)
            self.tfile.write(g.toEncodedString("\n" + lws))

        self.tfile.write(g.toEncodedString(data))
    def doctype(self,p):

        '''Process the first 'doctype' line of the html tree.'''

        for p in p.subtree():
            if p.h.lower().strip() == "doctype":
                self.write(p.b,NL=False)
                break
    def write_file(self):
        
        assert self.tfile
        self.tfile.seek(0)
        data = self.tfile.read()
        self.tfile.close()
        self.tfile = None

        assert self.fn
        outf = open(self.fn,'wb')
        outf.write(data)
        outf.close()
    class htag:
        
        # non typical html tags 
        tags = [
            ("br",     "empty"),
            ("hr",     "empty"),
            ("img",    "single"),
            ("meta",   "single"),
            ("link",   "single"),
            ("html",   "newline"),
            ("head",   "newline"),
            ("style",  "newline"),
            ("script", "newline"),
            ("body",   "newline"),
            ("div",    "newline"),
            ("ul",     "newline"),
        ]

        def __init__(self,p,indent_pos,indent_size,ofile,comments=True):
            
            # Capture args...
            self.h = p.h # text of the entire headline
            self.h_tag = p.h.split(" ")[0] # first word of headline
            self.p = p
            self.indent_pos = indent_pos
            self.indent_size = indent_size # usually c.tab_width.
            self.ofile = ofile # open output file object
            self.comments = comments # True if we should show comments
            
            # Init ivars...
            self.single = False
            self.empty = False
            self.close = None
            self.newline_tag = False
            self.tag = None
            self.attribs = [z for z in self.p.b.split('\n') if z.strip()]
            
            # Compute opening and closing tags.
            self.set_tags()
        def indent (self,n):
            
            '''
            Return the leading whitespace corresponding to n tab stops.
            Use blanks if self.indent_size < 0, otherwise use hard tabs.
            '''
            
            if self.indent_size < 0:
                return n * abs(self.indent_size) * ' '
            else:
                return n * '\t'
        def set_tags(self):

            # handle comments
            if self.h.startswith("!"):
                itext = self.h[1:]
                self.tag = "<!-- %s -->" % itext
                self.close = "<!-- /%s -->" % itext
                return

            # handle any special case tags
            for atag, ttype in self.tags:
                if atag == self.h_tag:
                    if ttype == "empty":
                        self.tag = "<%s />" % self.h
                        self.empty = True
                    elif ttype == "single":
                        self.tag = "<%s />" % self.h
                        self.single = True
                    elif ttype == "newline":
                        self.newline_tag = True
                        self.close = "</%s>" % self.h
                    else:
                        self.close = "</%s>" % self.h
                    break # No need to go further.

            # if we haven't already generated a tag, do so
            if not self.tag:
                if self.single:
                    self.tag = "<%s />" % self.h
                else:
                    self.tag = "<%s>" % self.h
                    self.close = "</%s>" % self.h
        def write_close(self):

            if self.single or self.empty:
                # The closing tag has already been generated.
                pass  
            elif self.close.startswith("<!"):
                # handle comments
                self.ofile.write(" " + self.close)
            elif self.newline_tag:
                indent = self.indent(self.indent_pos)
                close = "</%s>" % self.h_tag # ??? Override self.close?
                self.ofile.write('\n%s%s' % (indent,close))
            else:
                # Handle regular tags.
                self.ofile.write(self.close)
        def write_open(self):
            
            if self.attribs:
                indent = self.indent(self.indent_pos+1)
                lws = '\n%s' % indent
                attrs = lws.join([z.strip("\r\n\t ") for z in self.attribs])
                end =  '/>' if self.single or self.empty else '>'
                s = '\n%s<%s %s%s' % (indent,self.h_tag,attrs,end) 
            else:
                indent = self.indent(self.indent_pos)
                s = '\n%s%s' % (indent,self.tag)

            self.ofile.write(s)
