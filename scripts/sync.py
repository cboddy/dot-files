'''A script to backup a directory with rsync, and send an email status notification when the job completes.'''

import os.path
import smtplib
import subprocess
import argparse
import logging
from email.mime.text import MIMEText

def send_email(to_address, email_server, email_user, email_password, msg_body, msg_header='Backup Status'):
    """send an email message"""
    server = smtplib.SMTP(email_server)
    server.starttls()
    server.login(email_user, email_password)
    msg = MIMEText(msg_body)
    msg['Subject'] = msg_header 
    msg['From'] = email_user
    msg['To'] = to_address

    server.sendmail(email_user, to_address, msg.as_string())
    server.quit()

def rsync(src_dir, dest_dir):
    """rsync -avh src_dir  dest_dir"""
    return subprocess.call(['rsync', '-avh', src_dir, dest_dir])

def main(): 
    parser = argparse.ArgumentParser('rsync with email notification')
    parser.add_argument('-src', help='Path to source directory.', required=True)
    parser.add_argument('-dest', help='Path to destination directory.', required=True)
    parser.add_argument('-to-address', help='Email address to  send error reports.', required=True)
    parser.add_argument('-username', help='Email username.', required=True)
    parser.add_argument('-password', help='Email password.', required=True)
    parser.add_argument('-server', help='Email server URL.', required=True)
    parser.add_argument('-log-file', help='Log file path.', default=os.path.expanduser('~/.sync.log'))
    args = parser.parse_args()

    logging.basicConfig(filename=args.log_file, 
                        level=logging.INFO,
                        format='%(asctime)s %(message)s')

    src, dest = args.src, args.dest
    logging.info('Running rsync from {} to {}'.format(src, dest))
    rc = rsync(src, dest)

    status = 'Success' if not rc else 'Failure'
    msg = 'rsync from {} to {} : {}'.format(src, dest, status)
    logging.info(msg)

    send_email(
            args.to_address,
            args.server,
            args.username,
            args.password,
            msg)
if __name__== "__main__":
    main()
