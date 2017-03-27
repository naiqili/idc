#!/usr/bin/python

import cgi, cgitb
cgitb.enable()

form = cgi.FieldStorage()

txt = form['text'].value
audio = form['audio'].value

with open('/idc_data/text.txt', 'w') as f1:
    f1.write(txt)
    
with open('/idc_data/audio.wav', 'wb') as f1:
    f1.write(audio)

print "Content-type:text/html"
print
print "OK from process.py" + str(form["audio"].value)
