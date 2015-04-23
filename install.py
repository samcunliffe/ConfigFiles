#!/usr/bin/python

"""
Makes a symbolic link in the home dir for all config files with pattern: 
    "dot.file" or "dot.dir" 
in the repo. This setup structcture was stolen from github.com/rumblesan.
Optionally installs gnome-terminal colour scheme.
"""




import os
pattern = "dot."
debug = False




def symbolic_link(target_file, link_name):
    """makes a symbolic link"""
    if debug:
        print "ln -s %s %s" % (target_file, link_name)
        return
    else:
        return os.system("ln -s %s %s" % (target_file, link_name))




def move_file(from_here, to_here):
    """moves a file"""
    if debug:
        print "mv %s %s" % (from_here, to_here)
        return
    else:
        return os.system("mv %s %s" % (from_here, to_here))




def check_path(path):
    """check path can be appended to"""
    if path.endswith("/"):
        return path
    else:
        return path + "/"




def file_exists(directory, file_name):
    """checks if the file exists"""
    out = os.listdir(directory).count(file_name)
    if debug and out:
        print directory + file_name, "exists"
    elif debug and not out:
        print directory + file_name, "does not exist"
    return out




def backup_if_exists(directory, file_name, i=0):
    """if file_name exists then back it up using pattern file_name.backup0"""
    if debug:
        print file_name
    if file_exists(directory, file_name):

        # check if it's already a backupX
        if file_name.endswith(".backup%i" % (i-1)):
            backup_file_name = file_name.replace(".backup%i" % (i-1), ".backup%i" % i)
        else:
            backup_file_name = file_name + ".backup%i" % i
        
        if debug:
            print backup_file_name

        # do the backing-up
        if file_exists(directory, backup_file_name):
            backup_if_exists(directory, backup_file_name, i+1)
            move_file(directory + file_name, directory + backup_file_name)
        else:
            move_file(directory + file_name, directory + backup_file_name)
            return True
    else:
        # file doesn't exist so nothing to backup
        return True




def make_config_link(path_to_configfile, configfile, homedir):
    """makes a link to the config file from the repo dir"""
    
    # ensure trailing '/'
    homedir =            check_path(homedir)
    path_to_configfile = check_path(path_to_configfile)

    # backup any existing config files
    backup_if_exists(homedir, configfile.replace(pattern, "."))

    # make the link
    return symbolic_link(path_to_configfile + configfile, 
                         homedir + configfile.replace(pattern, "."))




def install_all_configfiles(repodir, homedir):
    """gets all config files matching the pattern and makes the link"""
    files_to_link = [ x for x in os.listdir(repodir) if x.count(pattern) ]
    if debug:
        print "files_to_link", files_to_link
    for file_or_dir in files_to_link:
        make_config_link(repodir, file_or_dir, homedir)
    return




def install_terminal_colors(repodir, homedir):
    """makes link for gnome-terminal color preferences"""
    file_to_link = repodir + "/gnome-terminal/%gconf.xml"
    place_to_link = homedir + "/.gconf/apps/gnome-terminal/profiles/Profile0/%gconf.xml"
    return symbolic_link(file_to_link, place_to_link)





if __name__ == "__main__":

    # get options from user or environment variables
    from optparse import OptionParser
    op = OptionParser()
    op.add_option("-R", "--repo-dir", dest = "repodir", 
                  default = os.environ["HOME"] + "/ConfigFiles",
                 help = "path to this repository")
    op.add_option("-H", "--home-dir", dest = "homedir", 
                  default = os.environ["HOME"],
                  help = "path where the config files should be put")
    op.add_option("-G", "--gnome-terminal", dest = "gnometerm",
                  action = "store_true",
                  help = "also install nice gnome-terminal colors")
    op.add_option("-d", "--debug", dest = "debug", 
                  action = "store_true",
                  help = "print the commands rather than running them")
    opts, args = op.parse_args()

    # set global debug variable
    debug = opts.debug

    # do the installing
    install_all_configfiles(opts.repodir, opts.homedir)
    symbolic_link(opts.repodir+"/config.zathura", opts.homedir+"/.config/zathura")
    if opts.gnometerm: install_terminal_colors(opts.repodir, opts.homedir)
