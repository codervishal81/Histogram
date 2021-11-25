'''Does Markov Analysis'''

import random

class MarkovAnalysisData:
    '''Prepares and holds data for Markov Analysis'''

    def __init__(self, prefix_length = 2):
        self.markov_mappings = {}
        self.prefix_length = prefix_length

    def update(self, ordered_words):
        '''Updates Markov Analysis data'''
        total_words = len(ordered_words)
        if total_words < (self.prefix_length + 1):
            return

        key = ()
        for j in range(self.prefix_length):
            key = key + (ordered_words[j],)

        for i in range(self.prefix_length, total_words):
            self.markov_mappings[key] = self.markov_mappings.get(key, [])
            self.markov_mappings[key].append(ordered_words[i])
            key = key[1:] + (ordered_words[i],)

    def generate(self, max_length=100):
        '''Generates sentences'''
        sentence = ''
        start = random.choice(list( self.markov_mappings.keys()))
        suffix = random.choice(self.markov_mappings[start])
        for prefix in start:
            sentence += prefix + ' '
        sentence += suffix + ' '

        i = 1
        while i <= max_length:
            start = start[1:] + (suffix,)
            possible_suffixes = self.markov_mappings.get(start, [])
            if len(possible_suffixes) < 1:
                return sentence
            suffix = random.choice(possible_suffixes)
            sentence += suffix + ' '
            i = i + 1
        return sentence
        