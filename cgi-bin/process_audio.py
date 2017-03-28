#!/usr/bin/python

import cgi, sys, logging

logger = logging.getLogger(__name__)
logging.basicConfig(level = logging.DEBUG, format = "%(asctime)s: %(levelname)s: %(message)s", datefmt='[%d/%b/%Y %H:%M:%S]', filename='/idc_data/process_audio.log')

fileName = str(sys.stdin.read(16))
fileName = fileName.decode("utf-8")

audio = sys.stdin.read()
with open('/idc_data/'+fileName+'.wav', 'wb') as f:
    f.write(audio)
logger.debug("Audio saved as %s" % (fileName))

def getASR(fileName):
    return "ASR for wav %s" % fileName

print "Content-type:text/html"
print
print getASR(fileName)
