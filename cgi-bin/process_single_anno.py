#!/usr/bin/python

import cgi, sys, logging
import datetime
from pymongo import MongoClient

logger = logging.getLogger(__name__)
logging.basicConfig(level = logging.DEBUG, format = "%(asctime)s: %(levelname)s: %(message)s", datefmt='[%d/%b/%Y %H:%M:%S]', filename='/idc_data/process_annotation.log')

form = cgi.FieldStorage()

sent1 = form.getvalue('sent1')
sent_anno1 = form.getvalue('sent_anno1')
sent2 = form.getvalue('sent2')
sent_anno2 = form.getvalue('sent_anno2')
sent3 = form.getvalue('sent3')
sent_anno3 = form.getvalue('sent_anno3')
email = form.getvalue('email')
audioFiles1 = form.getvalue('audioFiles1')
audioFiles2 = form.getvalue('audioFiles2')
audioFiles3 = form.getvalue('audioFiles3')
task = form.getvalue('task')
dt = datetime.datetime.utcnow()

logger.debug("Receive from %s" % email)

client = MongoClient()
db = client['idc']
coll = db['single']
coll.insert({'email': email,
           'sent1': {'text': sent1, 'anno': sent_anno1, 'audioFiles': audioFiles1},
           'sent2': {'text': sent2, 'anno': sent_anno2, 'audioFiles': audioFiles2},
           'sent3': {'text': sent3, 'anno': sent_anno3, 'audioFiles': audioFiles3},
           'date': dt,
           'task': task
        })

logger.debug("Write to mongodb")
cnt = coll.find({'email': email}).count()

print "Content-type:text/html"
print
print str(cnt)
