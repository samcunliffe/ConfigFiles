########################################
#        Sam C's .ganga.py
# Default imported into ganga, makes 
# functions for stuff I find myself
# often typing into my ganga sessions.
########################################

# get failed subjobs
def getFailed(njob):
  '''Gets list of failed subjobs'''
  return jobs(njob).subjobs.select(status='failed')



# failure rate
def failureRate(njob):
  '''Calculates failure rate %'''
  nfail=float(len(jobs(njob).subjobs.select(status='failed')))
  ncomp=float(len(jobs(njob).subjobs.select(status='completed')))
  return 100*nfail/ncomp



# resubmit failed subjobs
def resubmitSubjobs(njob):
  '''Resubmits all failed subjobs'''
  print 'Job '+str(njob)+': Resubmitting '+\
        str(len(jobs(njob).subjobs.select(status='failed')))+' failed subjobs.'
  jobs(njob).subjobs.select(status='failed').resubmit()
  return 0



# download from grid storage
def downloadCompletedSubjobs(njob):
  '''Downloads outputdata for all completed subjobs'''
  import os
  print 'Job %d: Downloading completed Jobs.' %njob

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
def doDownload(njob):
  '''Does the lot: resubmits fails, checks for stuck and downloads.
     Will even buy you dinner. (c) Sam H esq.'''
  import os
  
  # make report
  strjob=str(njob)
  print 'Job '+strjob+':'
  print 'Number of subjobs:'
  print '   completed  %d' %len(jobs(njob).subjobs.select(status='completed'))
  print '   completing %d' %len(jobs(njob).subjobs.select(status='completing'))
  print '   running    %d' %len(jobs(njob).subjobs.select(status='running'))
  print '   failed     %d' %len(jobs(njob).subjobs.select(status='failed'))
  print '   submitted  %d' %len(jobs(njob).subjobs.select(status='submitted'))
  print '   killed     %d' %len(jobs(njob).subjobs.select(status='killed'))
  print '   TOTAL      %d' %len(jobs(njob).subjobs)
  print 

  # resubmit all failed
  resubmitSubjobs(njob)
  ##print 'Job '+strjob+': Resubmitting '+\
  ##      str(len(jobs(njob).subjobs.select(status='failed')))+' failed subjobs.'
  ##jobs(njob).subjobs.select(status='failed').resubmit()
 
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
  ##print 'Job '+strjob+': Downloading completed Jobs.' 
  ##for i in range(len(jobs(njob).subjobs)):
  ##  sj = jobs(njob).subjobs(i)
  ##  if (sj.status is not 'completed'): continue
  ##  if ( not os.path.exists(sj.outputdir+sj.outputdata.files[0]) ) :
  ##    print 'job %d, subjob %d data is downloading.' %(njob,i)
  ##    sj.backend.getOutputData()

  return 0

print "\033[1mYou've got Sam's .ganga.py\033[0m with own functions."
