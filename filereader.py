'''Reads text file line by line and executes call back method for each line'''

import string

class FileReader:
    '''Reads text file line by line and executes call back method for each line'''

    def __init__(self, file_name, callback):
        self.file_name = file_name
        self.callback = callback

    def process_file(self):
        '''Prepares word histogram for a file'''
        file_to_process = open(self.file_name, encoding="utf8")
        for line in file_to_process:
            self.process_line(line)

    def process_line(self, line):
        '''Prepares word histogram for a line'''
        words = []
        line = line.replace('-', ' ')
        for word in line.split():
            word = word.strip(string.punctuation + string.whitespace)
            word = word.lower()
            words.append(word)

        self.callback(line, words)
