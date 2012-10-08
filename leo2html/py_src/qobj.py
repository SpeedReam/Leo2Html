'''
Created on Jun 20, 2012

@author: Speed
'''

from qtrace import Trace

def o(data):
    pass

class QBase(object):
    '''
    classdocs
    '''
    def __init__(self, out=None, ar=False):
        '''
        Constructor
        '''

        global o, t
        try:
            if out:
                o = self.o = out
            elif not o:
                o = self.o = self.bit
            elif not out:
                o = self.o = self.bit
        except:
            o = self.o = self.bit

        self.trace = self.t = Trace(out=out, ar=ar).go
        #self.trace = self.t = Trace().go
 
        o("QBase.__init__()")

    def bit(self, data):
        pass

if __name__=="__main__":
    QBase()

"""
    def __init__(self,
                 ar=None,
                 out=None):
        '''
        Constructor
        '''
        QBase.__init__(self, out=out, ar=ar)
        global t,o;t=self.t;o=self.o;
        t()
if __name__ == "__main__":

    def o(data):print(data)
    X = theClass(ar=True, out=0)
    X.doStuff()
    del(X)

"""