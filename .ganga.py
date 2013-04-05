########################################
#        Sam C's .ganga.py
# Default imported into ganga, makes 
# functions for stuff I find myself
# often typing into my ganga sessions.
########################################

def getFailed(njob):
  '''Gets list of failed subjobs'''
  return jobs(njob).subjobs.select(status='failed')

def getCompleted(njob):
  '''Gets list of completed subjobs'''
  return jobs(njob).subjobs.select(status='completed')

def getRunning(njob):
  '''Gets list of running subjobs'''
  return jobs(njob).subjobs.select(status='running')

def getCompleting(njob):
  '''Gets list of completing subjobs'''
  return jobs(njob).subjobs.select(status='completing')

def getKilled(njob):
  '''Gets list of killed subjobs'''
  return jobs(njob).subjobs.select(status='killed')

def getSubmitted(njob):
  '''Gets list of submitted subjobs'''
  return jobs(njob).subjobs.select(status='submitted')

def getLimbo(njob):
  '''Gets list of subjobs that are not 'failed' or 'completed' '''
  joblist = []
  for sj in jobs(njob).subjobs:
    if (sj.status is not 'failed') and (sj.status is not 'completed'):
      joblist.append(sj)
  return joblist

  #joblist=[jobs(njob).subjobs.select(status='submitting')]
  #for stat in ['submitted','running','completing','killed']:
  #  each=jobs(njob).subjobs.select(status=stat)
  #  print each
  #  joblist+=[each]
  #return joblist

def percentageComplete(njob):
  '''Calculates completion  %'''
  ncomp=float(len(getCompleted(njob)))
  ntotl=float(len(jobs(njob).subjobs))
  return 100*ncomp/ntotl

def failureRate(njob):
  '''Calculates failure rate %'''
  nfail=float(len(getFailed(njob)))
  ncomp=float(len(getCompleted(njob)))
  return 100*nfail/ncomp

def makeReport(njob):
  '''Makes a report of the number of jobs in each status'''
  print 'Job '+str(njob)+':'
  print 'Number of subjobs:'
  print '   completed  %d' %len(getCompleted(njob))
  print '   completing %d' %len(getCompleting(njob))
  print '   running    %d' %len(getRunning(njob))
  print '   failed     %d' %len(getFailed(njob))
  print '   submitted  %d' %len(getSubmitted(njob))
  print '   killed     %d' %len(getKilled(njob))
  print '   TOTAL      %d' %len(jobs(njob).subjobs)
  print 'Complete      %.2f %%' %percentageComplete(njob)
  print 'Failure rate  %.2f %%' %failureRate(njob)
  print 
  return


def resubmitFailedSubjobs(njob):
  '''Resubmits all failed subjobs'''
  print 'Job '+str(njob)+': Resubmitting '+\
        str(len(jobs(njob).subjobs.select(status='failed')))+' failed subjobs.'
  jobs(njob).subjobs.select(status='failed').resubmit()
  return 0

def downloadCompletedSubjobs(njob):
  '''Downloads outputdata for all completed subjobs'''
  import os
  print 'Job ' + str(njob) + ': There are ' + str(len(getCompleted(njob))) +\
        ' completed Jobs.'

  for i in range(len(jobs(njob).subjobs)):
    sj = jobs(njob).subjobs(i)

    # skip incomplete
    if (sj.status is not 'completed'): continue 

    # if file doesn't already exist
    if ( not os.path.exists(sj.outputdir+sj.outputdata.files[0]) ) : 

      # then download it
      print 'job %d, subjob %d data is downloading.' %(njob,i)
      sj.backend.getOutputData()

  return 0



# makes a report, resubmits fails, checks for jobs stuck in completing 
# then downloads all completed subjobs
def doEverything(njob):
  '''Does the lot: resubmits fails, checks for stuck and downloads.
     Will even buy you dinner. (c) Sam H esq.'''
  import os

  # print a report of the status of subjobs
  makeReport(njob)

  # resubmit all failed
  resubmitSubjobs(njob)
 
  # backend reset
  print 'Job '+strjob+': Checking for subjobs stuck completing.' 
  for i in jobs(njob).subjobs.select(status='completing'):
    t = i.time.completing()
    if (t.day is t.now().day):
      if (abs(t.hour - t.now().hour) >= 2):
        i.force_status('failed')
        i.resubmit()
    elif (abs(t.hour - t.now().hour+24) >=2 ):
      i.force_status('failed')
      i.resubmit()

  # get completed jobs' outputdata
  downloadCompletedSubjobs(njob)

  return 0


# process string copied from online bookkeeping
def strFromWeb( string ):
    """Parse a string from web bookkeeping gui into the form for BKQuery."""
    rd = string.find('LHCb')
    mc = string.find('MC')
    if rd != -1: 
        string = '%s'%string[rd:]
    elif mc != -1: 
        string = '%s'%string[mc:]
    else:
        print 'Cannot find LHCb or MC in the string'
    string = string.replace(' ','')
    string = string.replace('RealData','Real Data')
    if string.find('(') != -1: 
        remove = string[string.find('('): string.find(')')+1]
        string = string.replace(remove,'')
    print string
    string = string.split('/')
    print string
    longno = [ x for x in string if x.isdigit() ][0]
    string = [ x for x in string if not x.isdigit() ]
    print string
    string.insert(-1,longno)
    string = '/%s'%'/'.join(string)
    return string


# get an LHCbDataset of both magnet polarities from a BKQuery-ready string
def dsFromStr( string ):
    """Perform BKQuery on a srting and also get other mag polarity."""
    strings = []
    if string.find('Down') != -1:
        print "dsFromStr(): You've given a mag UP sample, now getting mag DOWN"
        strings.append(string)
        strings.append(string.replace('Down','Up'))
    elif string.find('Up') != -1:
        print "dsFromStr(): You've given a mag DOWN sample, now getting mag UP"
        strings.append(string)
        strings.append(string.replace('Up','Down'))
    else:
        strings.append(string)
    ds = LHCbDataset()
    for s in strings:
        bk = BKQuery( s )
        dd = bk.getDataset()
        ds.extend(dd)
    return ds

print "\033[1mYou've got Sam's .ganga.py\033[0m with own functions."
