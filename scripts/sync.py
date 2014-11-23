import os, sys, shutil, hashlib
from os.path import *

def md5sum(path, block_size=2**20):
    md5 = hashlib.md5()
    f = open(path, "r")
    try :
        while True:
            data = f.read(block_size)
            if not data:
                break
            md5.update(data)
    finally :
        f.close()
    return md5.digest()

def syncDirectory(srcDir, destDir):
    for root, dirs, files in os.walk(srcDir, topdown=False):
        for name in files:
            print "root", root, "name", name
            srcPath = os.path.join(root, name)
            destPath = os.path.join(destDir, srcPath[len(srcDir):])
            syncFile(srcPath, destPath)

def ensureDirectory(f):
    d = os.path.dirname(f)
    if not os.path.exists(d):
        os.makedirs(d)

def syncFile(path, toPath):
    try:
        if not os.path.exists(toPath) or os.path.getsize(toPath) != os.path.getsize(path) or md5sum(path) != md5sum(toPath):
            ensureDirectory(toPath) 
            print "Updating ", path, "to", toPath
            shutil.copy(path, toPath)
    except: 
        print "Problem syncing file ", path, "to", toPath
        print sys.exc_info()

def usage(): 
    return """Recursively synchronizes the contents of a source directory to a destination directory. 

    usage : 
        python sync.py source-directory-path destination-directory-path
    """
def main(): 
    if not len(sys.argv) == 3:
        print usage()
        return

    srcRootDir = sys.argv[1]
    destRootDir = sys.argv[2]
    syncDirectory(srcRootDir, destRootDir)

if __name__== "__main__":
    main()
