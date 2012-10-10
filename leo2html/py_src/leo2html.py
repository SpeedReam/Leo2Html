'''
Parse a LEO File into an HTML file.

Ver. 0.0.2, originated October 8, 2012
Ver. 0.0.1, originated September 12, 2012
@author: David Speed Ream
Copyright David Speed Ream 2012, all rights reserved.
'''
from qobj import QBase
c = g = None
harry = 10
class ReadLeo(QBase):
    def do_tag(self, position):
        '''
        If we get to this routine, we assume the headline text of the Leo
        file postion is an html tag. This tag is either a special tag like
        <br> which has no other content, or it may have attributes like
        <img>, or it may just have content like a plain <div>. This tag
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
        #indent = self.indent * self.indent_char
        indent = self.indent_pos * self.indent_size * ' '
        newtag = self.htag(headline, position, indent, self.tfile)
        # write tag
        if not newtag.write_open():return False
        self.indent_pos += 1
        if not self.do_next_tree(position):return False
        self.indent_pos -=1
        if not newtag.write_close():return False
        return True

    class htag:
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

        def write_open(self):
            # see if any body content, meaning attributes
            if len(self.attribs):
                #self.tag = "<%s" % self.text
                self.tag = "<%s" % self.tag_text
                self.ofile.write("\n" + self.indent + self.tag)
                for item in self.attribs:
                    if len(item):
                        itext = item.strip("\r\n\t ")
                        self.ofile.write("\n" + self.indent + " " + itext)
                if self.single or self.empty:
                    self.ofile.write(" />")
                else:
                    self.ofile.write(">")
                return True
            self.ofile.write("\n" + self.indent + self.tag)
            return True
            
        def write_close(self):
            # nothing to write if a singleton tag
            if self.single:
                return True
            if self.empty:
                return True
            # handle comments
            if self.close.startswith("<!"):
                #self.ofile.write("\n" + self.indent + self.close)
                self.ofile.write(" " + self.close)
                return True
            # handle regular tags
            #itext = self.text.split(" ")[0]
            self.close = "</%s>" % self.tag_text
            for atag, atype in self.tags:
                if atag == self.tag_text:
                    if atype == "newline":
                        self.ofile.write("\n" + self.indent + self.close)
                        return True
            self.ofile.write(self.close)
            return True
            
        def __init__(self, text, position, indent, ofile, comments=True):
            # setup argument data
            self.text = text # text of the entire headline
            self.tag_text = text.split(" ")[0] # first word of headline
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

        def set_attribs(self):
            '''
            Given a headline, see if there is body text. If so, the body text is the
            tag's attributes.
            '''
            body_text = self.position.b
            if len(body_text):
                lines = body_text.split("\n")
                for aline in lines:
                    self.attribs.append(aline)
            return True

        def set_tags(self):
            # handle comments
            if self.text.startswith("!"):
                itext = self.text[1:]
                self.tag = "<!-- %s -->" % itext
                self.close = "<!-- /%s -->" % itext
                return
            # handle any special case tags
            for atag, ttype in self.tags:
                if atag == self.tag_text:
                    if ttype == "empty":
                        self.tag = "<%s />" % self.text
                        self.empty = True
                    elif ttype == "single":
                        self.tag = "<%s />" % self.text
                        self.single = True
                    else:
                        self.close = "</%s>" % self.text
            # if we haven't already generated a tag, do so
            if not self.tag:
                if not self.single:
                    self.tag = "<%s>" % self.text
                    self.close = "</%s>" % self.text
                else:
                    self.tag = "<%s />" % self.text
            # handle any tag attributes.
            self.set_attribs()

    def do_tree(self, position):
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

    def html(self):
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

    def do_next_tree(self, position):
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

    def make_children(self, position):
        '''
        This routine cannot fail. It returns either [] or a list of all
        children of the given position.
        '''
        t()
        children = []
        for item in position.children():
            children.append(item.copy())
        return children

    def doctype(self):
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

    def get_first_children(self):
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

    def open(self, filename):
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

    def get_tempfile(self):
        t()
        try:
            import tempfile
            self.tfile = tempfile.TemporaryFile()
            return True
        except:
            o("\nError: Cannot create a temporary file.\n")
            return False

    def write_file(self):
        t()
        try:
            if self.tfile:
                self.tfile.seek(0)
                data = self.tfile.read()
                o(data)
                self.tfile.close()
                self.tfile = None
            else:
                return False
            if self.outname:
                outf = open(self.outname, 'wb')
                outf.write(data)
                outf.close()
                self.outname = None
                return True
            return False
        except:
            o("Cannot write to final html destination file.")
            return False


        
    def process(self, outname):
        '''
        ReadLeo.open must have been called prior to calling this routine.
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
        if not self.write_file():return False
        return True

    def __init__(self, indent_size, out=None, ar=None):
        # standard setup for QBase
        QBase.__init__(self, out=out, ar=ar)
        global t,o;t=self.t;o=self.o;
        t()
        # Zero out Leo globals
        global c, g
        c = g = None
        # Set instance variables to default values
        self.indent_pos = 0 # indent position
        self.indent_size = indent_size
        self.leofile = None # name of leo input file
        self.first_children = None
        self.outname = None # name of output html file
        self.tfile = None # temporary output file object
        # The following should be settable somehow.
        """
        global TAB, INDENT
        self.indent_size = 2
        self.indent_char = " "
        INDENT = "  "
        self.indent = 0
        self.tab_size = 2
        self.tab_char = " "
        self.tab = TAB = "  "
        """
    def write(self, data, NL=True):
        '''
        Write data to the current temporary file.
        If NL, add a carriage return plus indent at the beginning of the
        line.
        '''
        try:
            if NL:
                prelim = self.indent_pos * self.indent_size * ' '
                self.tfile.write("\n" + prelim)
            self.tfile.write(data)
            return True
        except:
            o("Error writing.\n")
            return False

    def handle_special(self, position):
        '''
        This routine handles special nodes of a Leo html source file. The
        special nodes are:
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
                print "lines = %s" % str(lines)
                for aline in lines:
                    temp = str(aline)
                    print "aline = %s" % temp
                    #from pdb import set_trace as tr
                    #tr()
                    if not self.write(temp):return -1
            return True
        if headline == "obselete":
            return True
        if headline.startswith("-"):
            return True
        return False

