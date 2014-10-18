import os, sys

#
# where is the jar with with com.temis.tsl.* ???
#

def usage() : 
    return """Finds all jars a given path (recursively) and searches their file contents for a particular filename
    eg. python findJar.py <path> <class-snippet>"""

def main():
    if len(sys.argv) !=3:
        print usage() 
        return

    path, search_term = sys.argv[1],  sys.argv[2]
    
    for (dirPath, dirNames, fileNames) in os.walk(path):
        for name in filter(lambda x: x.endswith(".jar"), fileNames):
            fullPath = os.path.join(path, dirPath, name)
            p = os.popen("jar -tf "+ fullPath)
            contents = p.read().split()
            p.close()
            for f in filter(lambda f: f.find(search_term) >=0, contents):
                print fullPath, f

if __name__ == "__main__":
    main()

