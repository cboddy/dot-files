"""parse a csv address-book export from thunderbird and create mutt-aliases for each contact"""

import csv
import collections
import argparse

Contact = collections.namedtuple("Contact", ["first", "last", "email"])

def line_to_contact(line):
    """return: Contact based on csv line"""
    return Contact(line[0], line[1], line[4])


def contact_to_alias(contact):
    """return: a mutt-contact alias statement for contact"""
    alias = contact.email
    if contact.first:
        alias = "-".join([contact.first.lower(), contact.last.lower()])
    return "alias {} {} {} <{}>".format(alias, contact.first, contact.last, contact.email)

def csv_to_contacts(path):
    """convert csv file to list of Contact objects"""
    with open(path, "r") as f_open:
        reader = csv.reader(f_open)
        reader.next() #read header line
        return [line_to_contact(line) for line in reader]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-address_book", help="Local path to input csv-formatted address book.", required=True)
    parser.add_argument("-alias_path", help="Local path to output file for mutt-aliases.", required=True)
    args = parser.parse_args()

    address_book_path = args.address_book
    alias_path = args.alias_path
    contacts = csv_to_contacts(address_book_path)
    print("Parsed", len(contacts), "contacts from", address_book_path)
    aliases = [contact_to_alias(contact) for contact in contacts]
    with open(alias_path, "w") as f_out:
        output_lines = "\n".join(aliases)
        f_out.write(output_lines)

if __name__ == "__main__":
    main()
