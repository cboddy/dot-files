import os
import os.path
from collections import defaultdict
import argparse
import subprocess


def call(cmd):
    proc = subprocess.Popen(cmd.split(),
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    out, err = proc.communicate()
    return out


def find(root_dir, f_name):
    """find files with name f_name in root_dir"""
    cmd = 'find {} -name {} -type f'.format(root_dir, f_name)
    return call(cmd).split()


def get_hash(f_path):
    """Get md5 hash as a string for f_path"""
    cmd = 'md5sum {}'.format(f_path)
    return call(cmd).split()[0]


def main():
    parser = argparse.ArgumentParser("Check the existence and content of files in one (recursive) directory are matched in another, irrespective of location.")
    parser.add_argument('--ref-dir', required=True)
    parser.add_argument('--test-dir', required=True)
    args = parser.parse_args()
    ref_dir = args.ref_dir
    test_dir = args.test_dir
    print 'Running', ref_dir, test_dir
    all_test_files = call('find {} -type f'.format(test_dir)).split()
    print 'Found {} files in {}'.format(len(all_test_files), test_dir)
    for f_path in all_test_files:
        f_name = os.path.basename(f_path)
        ref_files = find(ref_dir, f_name)
        if not len(ref_files):
            print('Could not find {} in ref-dir {}'.format(
                f_path, ref_dir))
            continue

        f_hash = get_hash(f_path)
        hashes = {get_hash(f) for f in ref_files}
        if f_hash not in hashes:
            print('File  {} has different contents to {}!'.format(f_path, ref_files))


if __name__ == '__main__':
    main()
