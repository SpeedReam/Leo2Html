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
<v t="ekr.20121012121028.15525"><vh>Notes</vh></v>
<v t="ekr.20121013041241.15655"><vh>@html-file Leo2Html.html</vh>
<v t="ekr.20121013041241.15656"><vh>doctype</vh></v>
<v t="ekr.20121013041241.15657"><vh>html</vh>
<v t="ekr.20121013041241.15658"><vh>head</vh>
<v t="ekr.20121013041241.15659"><vh>+content</vh></v>
</v>
<v t="ekr.20121013041241.15660"><vh>body</vh>
<v t="ekr.20121013041241.15661"><vh>! This is a comment</vh>
<v t="ekr.20121013041241.15662"><vh>xxx</vh></v>
</v>
<v t="ekr.20121013041241.15663"><vh>div top nav</vh>
<v t="ekr.20121013041241.15664"><vh>+content</vh></v>
</v>
<v t="ekr.20121013041241.15665"><vh>div document</vh>
<v t="ekr.20121013041241.15666"><vh>div documentwrapper</vh>
<v t="ekr.20121013041241.15667"><vh>div</vh>
<v t="ekr.20121013041241.15668"><vh>div</vh>
<v t="ekr.20121013041241.15669"><vh>div</vh>
<v t="ekr.20121013041241.15670"><vh>+content</vh></v>
<v t="ekr.20121013041241.15671"><vh>img</vh></v>
</v>
</v>
</v>
</v>
<v t="ekr.20121013041241.15672"><vh>div</vh>
<v t="ekr.20121013041241.15673"><vh>div</vh>
<v t="ekr.20121013041241.15674"><vh>+content</vh></v>
<v t="ekr.20121013041241.15675"><vh>p</vh>
<v t="ekr.20121013041241.15676"><vh>+content</vh></v>
</v>
</v>
</v>
<v t="ekr.20121013041241.15677"><vh>div</vh></v>
</v>
<v t="ekr.20121013041241.15678"><vh>div bottom nav</vh>
<v t="ekr.20121013041241.15679"><vh>+content</vh></v>
</v>
<v t="ekr.20121013041241.15680"><vh>div footer</vh>
<v t="ekr.20121013041241.15681"><vh>+content</vh></v>
</v>
</v>
</v>
</v>
<v t="ekr.20121013041241.15707"><vh>@command Leo2Html</vh>
<v t="ekr.20121013041241.15708"><vh>find_root</vh></v>
<v t="ekr.20121013041241.15709"><vh>class Leo2Html</vh>
<v t="ekr.20121013041241.15710"><vh>__init__</vh></v>
<v t="ekr.20121013041241.15711"><vh>indent</vh></v>
<v t="ekr.20121013041241.15712"><vh>process(top-level) &amp; helpers</vh>
<v t="ekr.20121013041241.15713"><vh>do_node &amp; helpers</vh>
<v t="ekr.20121013041241.15714"><vh>do_tag</vh></v>
<v t="ekr.20121013041241.15715"><vh>handle_special</vh></v>
<v t="ekr.20121013041241.15716"><vh>write</vh></v>
</v>
<v t="ekr.20121013041241.15717"><vh>doctype</vh></v>
<v t="ekr.20121013041241.15718"><vh>write_file</vh></v>
</v>
<v t="ekr.20121013041241.15719"><vh>test</vh></v>
<v t="ekr.20121013041241.15720"><vh>class htag</vh>
<v t="ekr.20121013041241.15721"><vh>__init__</vh></v>
<v t="ekr.20121013041241.15722"><vh>set_tags</vh></v>
<v t="ekr.20121013041241.15723"><vh>test &amp; helpers</vh>
<v t="ekr.20121013041241.15724"><vh>test_comment</vh></v>
<v t="ekr.20121013041241.15725"><vh>test_empty</vh></v>
<v t="ekr.20121013041241.15726"><vh>test_newline</vh></v>
<v t="ekr.20121013041241.15727"><vh>test_plain</vh></v>
<v t="ekr.20121013041241.15728"><vh>write_test_middle</vh></v>
<v t="ekr.20121013041241.15729"><vh>test_result</vh></v>
</v>
<v t="ekr.20121013041241.15730"><vh>write_close</vh></v>
<v t="ekr.20121013041241.15731"><vh>write_open</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20121012121028.15525">@nocolor-node

- The top-level script now always Leo2Html(c).test().
This is a complete unit test of the htag class.

- Iirc, the only real bug fix was this line in htag.write_open::
  
   s = '\n%s%s %s%s' % (in0,self.open_tag,attrs,end)
   
For comments, we must use self.open_tag, not self.h_tag.</t>
<t tx="ekr.20121013041241.15655">@language html
@tabwidth -2
</t>
<t tx="ekr.20121013041241.15656">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;</t>
<t tx="ekr.20121013041241.15657">xmlns="http://www.w3.org/1999/xhtml"</t>
<t tx="ekr.20121013041241.15658"></t>
<t tx="ekr.20121013041241.15659">&lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
&lt;title&gt;Leo's Home Page&lt;/title&gt;
&lt;link rel="stylesheet" href="_static/default.css" type="text/css" /&gt;
&lt;link rel="stylesheet" href="_static/pygments.css" type="text/css" /&gt;

&lt;!-- scale screen-shot to fit parent container --&gt;
&lt;style type="text/css"&gt;
  img { max-width:100%; max-height:100%; }
&lt;/style&gt;

&lt;!--
&lt;script type="text/javascript"&gt;
  var DOCUMENTATION_OPTIONS = {
    URL_ROOT:    '',
    VERSION:     '4.9',
    COLLAPSE_MODINDEX: false,
    FILE_SUFFIX: '.html',
    HAS_SOURCE:  false
  };
&lt;/script&gt;
--&gt;

&lt;!-- Flatter head --&gt;
&lt;script type="text/javascript"&gt;
/* &lt;![CDATA[ */
    (function() {
        var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto';
        t.parentNode.insertBefore(s, t);
    })();
/* ]]&gt; */
&lt;/script&gt;

&lt;!-- feed2js stylesheet --&gt;
&lt;style type="text/css" media="all"&gt;
&lt;!-- See: http://feed2js.org/index.php?s=style --&gt;
.rss_box {
    width:   0px;
    padding: 0px;
    border:  0px solid white;
    margin:  0px;
}
.rss_title {
    visibility:hidden;
    line-height: 0px;
}
.rss_items {
    font-size: 80%;
}
&lt;/style&gt;

&lt;!-- &lt;script type="text/javascript" src="_static/jquery.js"&gt;&lt;/script&gt;--&gt;
&lt;!-- &lt;script type="text/javascript" src="_static/doctools.js"&gt;&lt;/script&gt;--&gt;
&lt;link rel="top" title="Leo v4.9 documentation" href="index.html" /&gt;
&lt;link rel="Users Guide" title="Leo&amp;#8217;s Users Guide" href="leo_toc.html" /&gt;
&lt;!-- &lt;link rel="prev" title="Using Leoâ€™s Commands" href="commands.html" /&gt;--&gt; 
</t>
<t tx="ekr.20121013041241.15660"></t>
<t tx="ekr.20121013041241.15661"></t>
<t tx="ekr.20121013041241.15662"></t>
<t tx="ekr.20121013041241.15663">class="related"</t>
<t tx="ekr.20121013041241.15664">&lt;h3&gt;Navigation&lt;/h3&gt;

&lt;ul&gt;
&lt;li class="right" style="margin-right: 10px"&gt;
  &lt;a href="genindex.html" title="General Index"
     accesskey="I"&gt;index&lt;/a&gt;&lt;/li&gt;
&lt;li class="right" &gt;
  &lt;a href="glossary.html" title="Glossary"
     accesskey="G"&gt;glossary&lt;/a&gt; |&lt;/li&gt;
&lt;li class="right" &gt;
  &lt;a href="leo_toc.html" title="Users Guide"
     accesskey="N"&gt;contents&lt;/a&gt; |&lt;/li&gt;
&lt;li&gt;&lt;a href="leo_toc.html"&gt;Leo v4.9 documentation&lt;/a&gt; &amp;raquo;&lt;/li&gt;
&lt;/ul&gt;
</t>
<t tx="ekr.20121013041241.15665">class="document"</t>
<t tx="ekr.20121013041241.15666">class="documentwrapper"
</t>
<t tx="ekr.20121013041241.15667">class="bodywrapper"</t>
<t tx="ekr.20121013041241.15668">class="body"</t>
<t tx="ekr.20121013041241.15669">class="section" id="Leo&amp;#8217;s Home page"</t>
<t tx="ekr.20121013041241.15670">&lt;h1&gt;Leo&amp;#8217;s Home Page&lt;/h1&gt;

Leo is...

&lt;li&gt;
    A premier Integrated Development Environment, fully scriptable using
    &lt;a HREF="http://www.python.org/"&gt;Python&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;
    An outline-oriented, flexible filing cabinet holding any kind of data: including
    programs, web sites, text documents of all kinds, music, graphics and movies.&lt;/li&gt;
&lt;li&gt;
    &lt;i&gt;The&lt;/i&gt; premier platform for creating, generating, studying, scripting, testing,
    and validating computer programs, web sites and any other complex data.&lt;/li&gt;
&lt;li&gt;
    A rendering engine for
    &lt;a HREF="http://docutils.sourceforge.net/rst.html"&gt;reStructuredText&lt;/a&gt;, web pages and
    &lt;a HREF="http://www.w3.org/Graphics/SVG/"&gt;svg graphics&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;
    A music and movie player.&lt;/li&gt;
&lt;li&gt;
    A sophisticated
    &lt;a HREF="http://www.riverbankcomputing.co.uk/software/pyqt/intro"&gt;PyQt&lt;/a&gt;
    app running on Windows and Linux.&lt;/li&gt;
&lt;li&gt;
    100% pure &lt;a HREF="http://www.python.org/"&gt;Python&lt;/a&gt;,
    running on Python 2.6 and above, including Python 3.x.&lt;/li&gt;
&lt;li&gt;
    &lt;a href="http://www.opensource.org/"&gt;&lt;i&gt;Open Software&lt;/i&gt;&lt;/a&gt;,
    distributed under the
    &lt;a href="http://www.opensource.org/licenses/mit-license.php/"&gt;MIT License&lt;/a&gt;.
&lt;/li&gt;

&lt;p&gt;
  Please use the medium traffic
  &lt;a href="http://groups.google.com/group/leo-editor"&gt; leo-editor Google Group&lt;/a&gt;
  to ask questions and make suggestions.
  Questions and comments from newcomers are encouraged.
  Here are the most recent discussions...
  &lt;script language="JavaScript"
    src="http://itde.vccs.edu/rss2js/feed2js.php?src=http%3A%2F%2Fgroups.google.com%2Fgroup%2Fleo-editor%2Ffeed%2Frss_v2_0_msgs.xml&amp;chan=title&amp;num=5&amp;desc=0&amp;date=y&amp;targ=y"
    type="text/javascript"&gt;
  &lt;/script&gt;
&lt;/p&gt;

&lt;p&gt;Here is a screenshot of Leo's main window.&lt;/p&gt;
</t>
<t tx="ekr.20121013041241.15671">class="screenshot"
src="screen-shots/render-svg-sources.png"
alt="ScreenShot"
</t>
<t tx="ekr.20121013041241.15672">class="sphinxsidebar"</t>
<t tx="ekr.20121013041241.15673">class="sphinxsidebarwrapper"</t>
<t tx="ekr.20121013041241.15674">&lt;p class="logo"&gt;&lt;a href="leo_toc.html"&gt;
  &lt;img class="logo" src="_static/Leo4-80-border.jpg" alt="Logo"/&gt;&lt;/a&gt;
&lt;/p&gt;

&lt;p&gt;Leo: Leonine Editor with Outlines&lt;/p&gt;

&lt;a class="reference external" href="intro.html"&gt;
  Read this tutorial first&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="slides.html"&gt;
  Tutorial Slide Shows&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="http://webpages.charter.net/edreamleo/leo_toc.html"&gt;
  Leo's Users Guide&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="http:screen-shots.html"&gt;
  Screen shots of Leo&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="testimonials.html"&gt;
  Quotes from Leo&amp;#8217;s Users&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external"
  href="http://webpages.charter.net/edreamleo/download.html"&gt;
  Download Leo&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="http://groups.google.com/group/leo-editor"&gt;
  leo-editor: Google Groups&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="http://launchpad.net/leo-editor"&gt;
  leo-editor: Launchpad&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="http://leo.zwiki.org"&gt;
  Leo&amp;#8217;s Wiki&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="http://www.mind-mapping.org/"&gt;
  Mind Mapping&lt;/a&gt;&lt;br&gt;
&lt;a class="reference external" href="leoLinks.html"&gt;
  More links...&lt;/a&gt;&lt;br&gt;
  
&lt;div id="searchbox" style=""&gt;
  &lt;h3&gt;Quick search&lt;/h3&gt;
  &lt;form class="search" method="get" action="search.html"&gt;
    &lt;input type="text" name="q"&gt;
    &lt;input type="submit" value="Go"&gt;
    &lt;input type="hidden" value="yes" name="check_keywords"&gt;
    &lt;input type="hidden" value="default" name="area"&gt;
  &lt;/form&gt;
  &lt;p class="searchtip" style="font-size: 90%"&gt;
    Enter search terms or a module, class or function name.
  &lt;/p&gt;
&lt;/div&gt;
</t>
<t tx="ekr.20121013041241.15675"></t>
<t tx="ekr.20121013041241.15676">Written by &lt;a HREF="ekr.html"&gt;Edward K. Ream&lt;/a&gt;

&lt;!-- flattr icon --&gt;
&lt;a class="FlattrButton"
    style="display:none;"
    rev="flattr;button:compact;"
    href="http://webpages.charter.net/edreamleo/front.html"&gt;&lt;/a&gt;

&lt;noscript&gt;
    &lt;a href="http://flattr.com/thing/410073/Leo" target="_blank"&gt;
        &lt;img src="http://api.flattr.com/button/flattr-badge-large.png"
            alt="Flattr this" title="Flattr this" border="0" /&gt;
    &lt;/a&gt;
&lt;/noscript&gt;
</t>
<t tx="ekr.20121013041241.15677">class="clearer"</t>
<t tx="ekr.20121013041241.15678">class="related"</t>
<t tx="ekr.20121013041241.15679">&lt;h3&gt;Navigation&lt;/h3&gt;

&lt;ul&gt;
&lt;li class="right" style="margin-right: 10px"&gt;
  &lt;a href="genindex.html" title="General Index"
     &gt;index&lt;/a&gt;&lt;/li&gt;
&lt;li class="right" &gt;
  &lt;a href="glossary.html" title="Glossary"
     accesskey="G"&gt;glossary&lt;/a&gt; |&lt;/li&gt;
&lt;li class="right" &gt;
  &lt;a href="leo_toc.html" title="Users Guide"
     &gt;contents&lt;/a&gt; |&lt;/li&gt;
&lt;li&gt;
    &lt;a href="leo_toc.html"&gt;Leo v4.9 documentation&lt;/a&gt; &amp;raquo;&lt;/li&gt; 
&lt;/ul&gt;</t>
<t tx="ekr.20121013041241.15680">class="footer"</t>
<t tx="ekr.20121013041241.15681">&amp;copy; Copyright 2001-2012, Edward K. Ream.
Last updated on March 22, 2012.
Created using &lt;a href="http://sphinx.pocoo.org/"&gt;Sphinx&lt;/a&gt; 1.1.
</t>
<t tx="ekr.20121013041241.15707">'''Convert the first @html-file node into an HTML file.

October 13, 2012, by EKR.

Based on code by David Speed Ream.  Used by permission.
'''

@language python
@tabwidth -4
@others

fn,p = find_root(c)

Leo2Html(c).test()
Leo2Html(c,indent_size=c.tab_width).process(fn,p)
</t>
<t tx="ekr.20121013041241.15708">def find_root(c):
    
    '''Find the **top-level** node starting with "html" '''

    tag = '@html-file'
    
    for p in c.all_positions():
        if g.match_word(p.h,0,tag):
            fn = p.h[len(tag):].strip()
            return fn,p
    else:
        g.error('no top-level html tree found')
        return None
</t>
<t tx="ekr.20121013041241.15709">class Leo2Html:
    @others
</t>
<t tx="ekr.20121013041241.15710">def __init__(self,c,indent_size=None):

    # Set instance variables to default values
    self.c = c
    self.indent_pos = 0 # indent position
    self.indent_size = indent_size or abs(c.tab_width)
    self.fn = None # The full file name.
    self.root = None # the html node.
    self.tfile = None # temporary output file object
</t>
<t tx="ekr.20121013041241.15711">def indent (self,n):
    
    '''
    Return the leading whitespace corresponding to n tab stops.
    Use blanks if self.indent_size &lt; 0, otherwise use hard tabs.
    '''
    
    if self.indent_size &lt; 0:
        return n * abs(self.indent_size) * ' '
    else:
        return n * '\t'
</t>
<t tx="ekr.20121013041241.15712">def process(self,fn,p):
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
</t>
<t tx="ekr.20121013041241.15713">def do_node (self,p):

    self.handle_special(p) or self.do_tag(p)
</t>
<t tx="ekr.20121013041241.15714">def do_tag(self,p):
    
    '''
    p.h is an html tag. This tag is either a special tag like &lt;br&gt; which
    has no other content, or it may have attributes like &lt;img&gt;, or it may
    just have content like a plain &lt;div&gt;. This tag may also be the start of
    another html tree consisting of additional tags, content, etc.
    '''

    tag = self.htag(self,p,self.indent_pos,self.indent_size,self.tfile)
    tag.write_open()
    self.indent_pos += 1
    for child in p.children():
        self.do_node(child)
    self.indent_pos -=1
    tag.write_close()
</t>
<t tx="ekr.20121013041241.15715">def handle_special(self, p):
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
</t>
<t tx="ekr.20121013041241.15716">def write (self,data,NL=True):
    '''
    Write data to the current temporary file.
    If NL, add a carriage return plus indent at the beginning of the line.
    '''

    if NL:
        lws = self.indent(self.indent_pos)
        self.tfile.write(g.toEncodedString("\n" + lws))

    self.tfile.write(g.toEncodedString(data))
</t>
<t tx="ekr.20121013041241.15717">def doctype(self,p):

    '''Process the first 'doctype' line of the html tree.'''

    for p in p.subtree():
        if p.h.lower().strip() == "doctype":
            self.write(p.b,NL=False)
            break
</t>
<t tx="ekr.20121013041241.15718">def write_file(self):
    
    assert self.tfile
    self.tfile.seek(0)
    data = self.tfile.read()
    self.tfile.close()
    self.tfile = None

    assert self.fn
    outf = open(self.fn,'wb')
    outf.write(data)
    outf.close()</t>
<t tx="ekr.20121013041241.15719">def test(self):
    
    # g.cls()
    trace = False
    old_size = self.indent_size
    try:
        f = None # Will be reset for each test.
        for indent_size in (-4,1):
            for indent_pos in (0,1):
                for attribs in (True,False):
                    self.indent_size = indent_size
                    self.htag(self,p,indent_pos,indent_size,f).test(attribs)
        if trace: print('done!')
    except AssertionError:
        pass # The error message has already been given.
    finally:
        self.indent_size = old_size # In case we reuse this class.</t>
<t tx="ekr.20121013041241.15720">class htag:
    
    # non typical html tags 
    tags = {
        "br":     "empty",
        "hr":     "empty",
        "img":    "single",
        "meta":   "single",
        "link":   "single",
        "html":   "newline",
        "head":   "newline",
        "style":  "newline",
        "script": "newline",
        "body":   "newline",
        "div":    "newline",
        "ul":     "newline",
    }

    @others
</t>
<t tx="ekr.20121013041241.15721">def __init__(self,parent,p,indent_pos,indent_size,ofile):
    
    # Capture args...
    self.h = p.h # text of the entire headline
    self.h_tag = p.h.split(" ")[0] # first word of headline
    self.parent = parent
    self.p = p
    self.indent_pos = indent_pos
    self.indent_size = indent_size # overrides c.tab_width.
    self.ofile = ofile # open output file object
    
    # Init ivars...
    self.close_tag = None
    self.open_tag = None
    self.attribs = [z for z in self.p.b.split('\n') if z.strip()]
    
    # Compute opening and closing tags.
    self.set_tags()
</t>
<t tx="ekr.20121013041241.15722">def set_tags(self):
    
    '''Define self.open_tag and self.close_tag for all kinds of tags.'''

    h,htag = self.h,self.h_tag
    if h.startswith("!"): # A comment.
        s = h[1:].strip()
        self.open_tag = "&lt;!-- %s --&gt;" % s
        self.close_tag = "\n%s&lt;!-- /%s --&gt;" % (
            self.parent.indent(self.indent_pos),s)
        self.attribs = [] # Don't add attribs to comments.
    else:
        ttype = self.tags.get(self.h_tag)
        if ttype in ("empty","single",):
            self.open_tag = "&lt;%s /&gt;" % htag
            self.close_tag = ''
        elif ttype == "newline":
            self.open_tag = "&lt;%s&gt;" % htag
            self.close_tag = "\n%s&lt;/%s&gt;" % (
                self.parent.indent(self.indent_pos),htag)
        else:
            self.open_tag = "&lt;%s&gt;" % htag
            self.close_tag = "&lt;/%s&gt;" % htag
</t>
<t tx="ekr.20121013041241.15723">def test (self,attribs):
    
    '''Run a complete unit test for this class.'''
    
    trace = False
    if trace: print('pos: %s size: %s' % (self.indent_pos,self.indent_size))
    tags = list(self.tags.keys())
    tags.extend(['h1','xyz','!a comment',])
    for tag in sorted(tags):
        # Call set_tags after forcing ivars.
        self.p = None
        self.h = self.h_tag = tag
        self.attribs = ['attr1="abc"','attr2="xyz"',] if attribs else []
        self.set_tags()
        kind = self.tags.get(tag)
        if kind == 'empty':
            self.test_empty(tag)
        elif kind == 'single':
            self.test_single(tag)
        elif kind == 'newline':
            self.test_newline(tag)
        elif kind is not None:
            class KindError(Exception): pass
            raise KindError('unknown kind: %s' % kind)
        elif tag.startswith('!'):
            self.test_comment(tag)
        else:
            self.test_plain(tag)
</t>
<t tx="ekr.20121013041241.15724">def test_comment(self,h):
    
    # g.trace(h)
    in0 = self.parent.indent(self.indent_pos)
    comment = self.h[1:].strip()
    expected = (
        ('\n%s&lt;!-- %s --&gt;\n' % (in0,comment)) +
        ('Middle\n') +
        ('%s&lt;!-- /%s --&gt;' % (in0,comment)))
        
    self.test_result(expected,h)
</t>
<t tx="ekr.20121013041241.15725">def test_empty(self,tag):

    # g.trace(tag)
    in0 = self.parent.indent(self.indent_pos)
    in1 = self.parent.indent(self.indent_pos+1)
    
    if self.attribs:
        lws = '\n%s' % in1
        attrs = lws.join([z.strip("\r\n\t ") for z in self.attribs])
        expected = (
            ('\n%s&lt;%s /&gt; %s/&gt;\n' % (in0,tag,attrs)) +
            ('Middle'))
    else:
        expected = (
            ('\n%s&lt;%s /&gt;\n' % (in0,tag)) +
            ('Middle'))
        
    self.test_result(expected,tag)
    
test_single = test_empty # No difference between the two kinds of tags.
</t>
<t tx="ekr.20121013041241.15726">def test_newline(self,tag):
    
    # g.trace(tag)
    in0 = self.parent.indent(self.indent_pos)
    in1 = self.parent.indent(self.indent_pos+1)
    
    if self.attribs:
        lws = '\n%s' % in1
        attrs = lws.join([z.strip("\r\n\t ") for z in self.attribs])
        expected = (
            ('\n%s&lt;%s&gt; %s&gt;\n' % (in0,tag,attrs)) +
            ('Middle') +
            ('\n%s&lt;/%s&gt;' % (in0,tag)))
    else:
        expected = (
            ('\n%s&lt;%s&gt;\n' % (in0,tag)) +
            ('Middle') +
            ('\n%s&lt;/%s&gt;' % (in0,tag)))
        
    self.test_result(expected,tag)
</t>
<t tx="ekr.20121013041241.15727">def test_plain(self,tag):
    
    # g.trace(tag)
    in0 = self.parent.indent(self.indent_pos)
    in1 = self.parent.indent(self.indent_pos+1)
    
    if self.attribs:
        lws = '\n%s' % in1
        attrs = lws.join([z.strip("\r\n\t ") for z in self.attribs])
        expected = (
            ('\n%s&lt;%s&gt; %s&gt;\n' % (in0,tag,attrs)) +
            ('Middle') +
            ('&lt;/%s&gt;' % (tag)))
    else:
        expected = (
            ('\n%s&lt;%s&gt;\n' % (in0,tag)) +
            ('Middle') +
            ('&lt;/%s&gt;' % (tag)))
        
    self.test_result(expected,tag)
</t>
<t tx="ekr.20121013041241.15728">def write_test_middle (self):

    self.ofile.write('\nMiddle')</t>
<t tx="ekr.20121013041241.15729">def test_result (self,expected,tag):
    
    # Re-init.
    self.ofile = g.fileLikeObject()
    
    self.write_open()
    self.write_test_middle()
    self.write_close()

    s = self.ofile.read()
    if s != expected:
        print('test failed.  indent_size: %s indent_pos: %s tag: %s' % (
            self.indent_size,self.indent_pos,tag))
        print('attribs: %s' % repr(self.attribs))
        print('expected:\n%s' % repr(expected))
        print('got:\n%s' % repr(s))
        assert False
    
    # assert s == expected,'expected:\n%s\ngot:\n%s' % (repr(expected),repr(s))
</t>
<t tx="ekr.20121013041241.15730">def write_close(self):
    
    if self.close_tag:
        self.ofile.write(self.close_tag)
</t>
<t tx="ekr.20121013041241.15731">def write_open(self):
    
    in0 = self.parent.indent(self.indent_pos)
    in1 = self.parent.indent(self.indent_pos+1)
    # g.trace(self.indent_pos,repr(in1))
    
    if self.attribs:
        lws = '\n%s' % in1
        attrs = lws.join([z.strip("\r\n\t ") for z in self.attribs])
        end = '/&gt;' if self.open_tag.endswith('/&gt;') else '&gt;'
        s = '\n%s%s %s%s' % (in0,self.open_tag,attrs,end) 
    else:
        s = '\n%s%s' % (in0,self.open_tag)

    self.ofile.write(s)
</t>
</tnodes>
</leo_file>
