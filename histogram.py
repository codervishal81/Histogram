import string

class HistogramData:
    '''Holds data for creating histogram'''

    def __init__(self):
        self.word_frequency = dict()

    def process_line(self, line):
        line = line.replace('-', ' ')
        for word in line.split():
            word = word.strip(string.punctuation + string.whitespace)
            word = word.lower()
            self.word_frequency[word] = self.word_frequency.get(word, 0) + 1

    def process_file(self, filename):
        fp = open(filename, encoding="utf8")
        for line in fp:
            self.process_line(line)

    def sort_hist_by_freq_desc(self, limit=10):
        sorted_list = []
        for key, val in self.word_frequency.items():
            sorted_list.append((val, key))

        sorted_list.sort(reverse=True)
        return sorted_list[0:limit] if limit < len(sorted_list) else sorted_list

    def total_words(self):
        return sum(self.word_frequency.values())

    def different_words(self):
        return len(self.word_frequency)