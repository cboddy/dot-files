'''Standalone utility to send an email via SMTP with TLS using only python builtins.'''

import os.path
import smtplib
import subprocess
import argparse
import logging
from email.mime.text import MIMEText


def send_email(address, email_server, email_user, email_password, msg_subject, msg_body):
    """Send an email message."""
    server = smtplib.SMTP(email_server)
    server.starttls()
    server.login(email_user, email_password)
    msg = MIMEText(msg_body)
    msg['Subject'] = msg_subject
    msg['From'] = email_user
    msg['To'] = address

    server.sendmail(email_user, address, msg.as_string())
    server.quit()


def main():
    parser = argparse.ArgumentParser('Send an email message.')
    parser.add_argument('-address', help='Email address to send message to.', required=True)
    parser.add_argument('-username', help='Email account username.', required=True)
    parser.add_argument('-password', help='Email account password.', required=True)
    parser.add_argument('-server', help='Email SMTP server address.', required=True)
    parser.add_argument('-subject', help='Email subject.', required=True)
    parser.add_argument('-path', help='Path to file with content for email msg.', required=False)

    args = parser.parse_args()

    if args.path:
        with open(args.path, "r") as f:
            content = f.read()
    else:
        content = ""

    send_email(args.address,
               args.server,
               args.username,
               args.password,
               args.subject,
               content,


if __name__ == "__main__":
    main()
