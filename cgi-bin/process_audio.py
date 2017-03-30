#!/usr/bin/python

import cgi, sys, logging
import speech_recognition as sr

logger = logging.getLogger(__name__)
logging.basicConfig(level = logging.DEBUG, format = "%(asctime)s: %(levelname)s: %(message)s", datefmt='[%d/%b/%Y %H:%M:%S]', filename='/idc_data/process_audio.log')

fileName = str(sys.stdin.read(16))
fileName = fileName.decode("utf-8")

audio = sys.stdin.read()
with open('/idc_data/'+fileName+'.wav', 'wb') as f:
    f.write(audio)
logger.debug("Audio saved as %s" % (fileName))

def getASR(fileName):
    r = sr.Recognizer()
    with sr.AudioFile('/idc_data/'+fileName+'.wav') as source:
        _audio = r.record(source)
        logger.debug("Audio size: ")
    try:
        return r.recognize_google(_audio)
    except sr.RequestError as e:
        return ("Could not request results{0}".format(e))
        
asr_res = getASR(fileName)

print "Content-type:text/html"
print
print asr_res
