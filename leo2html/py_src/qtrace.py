'''
Ver. 0.0.1, originated Jun 23, 2012
@author: David Speed Ream
Copyright David Speed Ream 2012, all rights reserved.
'''
import inspect
class Trace(object):

    '''
    out = the output routine to use. Can be a bit bucket or None.
    ar  = True to output the arguments to the call
    This routine performs the output, and returns the output as
    a string.
    '''
    def __init__(self, out=None, ar=False):
    #def __init__(self, out=None):
        '''
        Constructor
        '''
        self.out = None
        self.ar  = False
        if out:self.out = out
        #if ar :self.ar  = ar

    def go(self):

        if not self.out:return None

        #from inspect import stack as GetStack
        #return "joe"
        astack = inspect.stack()
        frame = astack[1][0]
        (there, name) = self.is_function(frame)
        if there:
            return self.do_function(frame, name)

        print "\n\nError\n\n"
        raise

    def is_function(self, frame):
        #o = self.out
        #from code_utils import DumpObj as dump
        #o("FRAME (for a function):")
        #dump(frame, self.out, "frame")
        #o(10*" " + "FRAME.f_code (for a function):")
        #dump(frame, self.out, "frame")

        name = frame.f_code.co_name
        if 'self' in frame.f_locals:
            cls = str(frame.f_locals['self'])
            res = cls.find("(")
            if not res == -1:
                cls = cls.split(" ")[1]
                cls = cls.strip("()")
            test = cls.split(".")
            lenn = len(test)
            if lenn > 1:
                cls = test[lenn-1]
            cls = cls.replace("<", "")
            res = cls.find(" object at ")
            if not res == -1:
                cls = cls[:res]
            cls = cls.replace("__main__.", "")
            res = cls.find("(")
            if not res == -1:
                cls = cls[:res-1]
            name = "%s.%s" % (cls, name)
        return (True, name)


    def do_function(self, frame, name):
        #o = self.out
        #from code_utils import DumpObj as dump
        #o("FRAME (for a function):")
        #dump(frame, self.out, "frame")
        #o(10*" " + "FRAME.f_code (for a function):")
        #dump(frame, self.out, "frame")
        #o(10*" " + "FUNCTION (for a function):")
        #dump(func, self.out, "function")

        newname = name
        if "__name__" in frame.f_globals:
            prefix = frame.f_globals["__name__"]
            #o("__name__ is there = %s" % prefix)
            newname = "%s.%s()" % (prefix, newname)
            #o("newname = %s" % newname)
            return self.do_args(frame, newname)

        raise

    def out_result(self, name, shortname):

        chunks = name.split(".")
        while len(chunks) > 3:
            chunks = chunks[1:]
        final = ".".join(chunks)
        self.out(final)
        return shortname

    def do_args(self, frame, name):

        shortname = name
        if not self.ar:
            return self.out_result(name, shortname)

        from inspect import getargvalues
        from inspect import formatargvalues

        values = getargvalues(frame)

        global Nope
        Nope = False

        def formatvarargs(data):
            #print "data1 = %s" % data
            return str(data)
        def formatarg(data):
            global Nope
            #print "data2 = %s" % data
            if str(data) == "self":
                Nope = True
                return ""
            return "%s=" % data
        def formatvarkw(data):
            #print "data3 = %s" % data
            return str(data)
        def joinme(data, data1):
            #print "data4 = %s%s" % (str(data), str(data1))
            pass
        def formatvalue(data):
            global Nope
            #print "data5 = %s" % data
            if Nope:
                Nope = False
                return ""
            # remove address infor from funtion name
            data = str(data)
            res = data.find(" at 0x")
            if not res == -1:
                data = data[:res]
                data = data.replace("<function ","")
            return data

        fout = formatargvalues(values.args,
                               values.varargs,
                               values.keywords,
                               values.locals,
                               formatarg,
                               formatvarargs,
                               formatvarkw,
                               formatvalue,
                               joinme)

        name = name.replace("()", "")
        s = name + fout
        return self.out_result(s, shortname)



if __name__ == "__main__":

    global fout
    fout = None
    def outf(data):
        global fout
        if not fout:
            fout = open(r"C:\test.txt", "w")
        fout.write(data + "\n")

    def out(data):print data

    """
    Example: Trace a function call with ar = None, so don't show arguments.
    """
    if 1:

        def test_function_no_args(one, two, three=None):
            return Trace(out=out).go()

        res = test_function_no_args(1, "two", three=3)
        print "Final result = \n%s" % res
        if fout:fout.close()

    """
    Example: Trace a function call with ar = True in order to show arguments.
    """
    if 1:

        def test_function(one, two, three=None):
            return Trace(out=out, ar=True).go()

        res = test_function(1, "two", three=3)
        print "Final result = \n%s" % res
        if fout:fout.close()

    """
    Example: Trace a method call.
    """
    if 1:

        class test_class_container(object):
            def test_class(self, one, two, three=None):
                return Trace(out=outf).go()

        res = test_class_container().test_class(1, "two", three=3)
        print "Final result = \n%s" % res
        if fout:fout.close()
