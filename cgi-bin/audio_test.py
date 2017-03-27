#!/usr/bin/python

import cgi

form = cgi.FieldStorage()

t = form.getvalue('text')

with open('./tmp.txt', 'w') as f:
    f.write(t)

print "Content-type:text/html"
print
print "Receive: %s" % t
