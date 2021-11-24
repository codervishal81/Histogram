'''Word Histogram for file'''
import string

class HistogramData:
    '''Holds data for creating histogram'''

    def __init__(self):
        self.word_frequency = dict()

    def process_line(self, line):
        '''Prepares word histogram for a line'''
        line = line.replace('-', ' ')
        for word in line.split():
            word = word.strip(string.punctuation + string.whitespace)
            word = word.lower()
            self.word_frequency[word] = self.word_frequency.get(word, 0) + 1

    def process_file(self, filename):
        '''Prepares word histogram for a file'''
        file_to_process = open(filename, encoding="utf8")
        for line in file_to_process:
            self.process_line(line)

    def sort_hist_by_freq_desc(self, limit=10):
        '''Sorts histogram'''
        sorted_list = []
        for key, val in self.word_frequency.items():
            sorted_list.append((val, key))

        sorted_list.sort(reverse=True)
        return sorted_list[0:limit] if limit < len(sorted_list) else sorted_list

    def total_words(self):
        '''Counts total words'''
        return sum(self.word_frequency.values())

    def different_words(self):
        '''Counts different words'''
        return len(self.word_frequency)
