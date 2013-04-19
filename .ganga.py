""".ganga.py

Default imported into ganga. All functions in the scope of the ganga session.
Usefull shortcut functions for stuff I find myself often typing.
"""


def get_failed(njob):
  """Gets list of failed subjobs"""
  return jobs(njob).subjobs.select(status="failed")


def get_completed(njob):
  """Gets list of completed subjobs"""
  return jobs(njob).subjobs.select(status="completed")


def get_running(njob):
  """Gets list of running subjobs"""
  return jobs(njob).subjobs.select(status="running")


def get_completing(njob):
  """Gets list of completing subjobs"""
  return jobs(njob).subjobs.select(status="completing")


def get_killed(njob):
  """Gets list of killed subjobs"""
  return jobs(njob).subjobs.select(status="killed")


def get_submitted(njob):
  """Gets list of submitted subjobs"""
  return jobs(njob).subjobs.select(status="submitted")


def get_new(njob):
  """Gets list of failed subjobs"""
  return jobs(njob).subjobs.select(status="new")


def percentage_complete(njob):
  """Calculates completion  %"""
  ncomp=float(len(get_completed(njob)))
  ntotl=float(len(jobs(njob).subjobs))
  return 100*ncomp/ntotl


def failure_ratio(njob):
  """Failed : completed"""
  nfail = float(len(get_failed(njob)))
  ncomp = len(get_completed(njob))
  if ncomp:
    ncomp = float(ncomp)
    return 100 * nfail/ncomp
  else:
    return -1


def percentage_failed(njob):
  """Calculates failed %"""
  nfail = float(len(get_failed(njob)))
  ntotl = float(len(jobs(njob).subjobs))
  return 100 * nfail/ntotl


def make_report(njob):
  """Make a report of the number of jobs in each status"""
  print "Job "+str(njob)+":"
  print "Number of subjobs:"
  print "   completed  %d" % len(get_completed(njob))
  print "   completing %d" % len(get_completing(njob))
  print "   running    %d" % len(get_running(njob))
  print "   failed     %d" % len(get_failed(njob))
  print "   submitted  %d" % len(get_submitted(njob))
  print "   killed     %d" % len(get_killed(njob))
  print "   TOTAL      %d" % len(jobs(njob).subjobs)
  print "Complete      %.2f %%" % percentage_complete(njob)
  print "Failed        %.2f %%" % percentage_failed(njob)
  print "Failure ratio %.2f %%" % failure_ratio(njob)
  print 
  return


def resubmit_failed(njob):
  """Resubmits all failed subjobs"""
  print "Job "+str(njob)+": Resubmitting "+\
        str(len(jobs(njob).subjobs.select(status="failed")))+" failed subjobs."
  jobs(njob).subjobs.select(status="failed").resubmit()
  return 0


def reset_if_stuck(njob, nhours = 4):
  """Resets the (Dirac) backend if the job is stuck in completing"""
  print "Job %i:" % njob,
  print "There are %i subjobs 'completing'" % len(get_completing(njob))
  nskipped, nreset = 0,0
  for sj in get_completing(njob):
    t = sj.time.completing()
    if (abs(t.hour - t.now().hour) >= nhours):
      sj.backend.reset()
      nreset +=1
    else:
      nskipped += 1
  print "Reset the backend of %i subjobs." % nreset
  print "Skipped %i since they have been completing for < %i hrs." % (nskipped, nhours)


def download_completed(njob):
  """Downloads outputdata for all completed subjobs"""
  import os
  print "Job " + str(njob) + ": There are " + str(len(get_completed(njob))) +\
        " completed Jobs."

  for i in range(len(jobs(njob).subjobs)):
    sj = jobs(njob).subjobs(i)

    # skip incomplete
    if (sj.status is not "completed"): continue 

    # if file doesn"t already exist
    if ( not os.path.exists(sj.outputdir+sj.outputdata.files[0]) ) : 

      # then download it
      print "job %d, subjob %d data is downloading." %(njob,i)
      sj.backend.getOutputData()

  return 0


# makes a report, resubmits fails, checks for jobs stuck in completing 
# then downloads all completed subjobs
def do_everything(njob):
  """Resubmit fails, check for stuck and downloads completed."""
  make_report(njob)
  resubmit_failed(njob)
  reset_if_stuck(njob)
  download_completed(njob)
  return 0


# process string copied from online bookkeeping
def bkquery_from_string(string_from_web):
    """Parse a string from web bookkeeping gui into the form for BKQuery."""
    s  = string_from_web
    rd = s.find("LHCb")
    mc = s.find("MC")
    if rd != -1: 
        s = "%s" % s[rd:]
    elif mc != -1: 
        s = "%s" % s[mc:]
    else:
        print "Cannot find LHCb or MC in the string"
    s = s.replace(" ","")
    s = s.replace("RealData","Real Data")
    if s.find("(") != -1: 
        remove = s[s.find("("): s.find(")")+1]
        s = s.replace(remove,"")
    print s
    s = s.split("/")
    print s
    longno = [ x for x in s if x.isdigit() ][0]
    s = [ x for x in s if not x.isdigit() ]
    print s
    s.insert(-1,longno)
    s = "/%s"%"/".join(s)
    return s


def dataset_from_string(string_from_web, get_other_mag = True):
    """BKQueries on a string path from web, can get other mag polarity."""
    s = bkquery_from_string(string_from_web)

    # figure out which mag polarity and get the opposite
    strings = []
    if get_other_mag and (s.find("Down") != -1):
        print "Given mag UP string, now getting mag DOWN"
        strings.append(s)
        strings.append(s.replace("Down","Up"))
    elif get_other_mag and (s.find("Up") != -1):
        print "Given a mag DOWN string, now getting mag UP"
        strings.append(s)
        strings.append(s.replace("Up","Down"))
    elif not get_other_mag:
        strings.append(s)
    else:
        print "ERROR: Can't find mag polarity in the string."
        return -1

    # now have the strings, make the dataset
    ds = LHCbDataset()
    for s in strings:
        bk = BKQuery(s)
        dd = bk.getDataset()
        ds.extend(dd)
    return ds


print "\033[1mYou've got Sam's .ganga.py\033[0m with own functions."
