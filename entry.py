'''Entry point module'''

from histogram import HistogramData
from filereader import FileReader
from markovanalysis import MarkovAnalysisData

###################### Prepare histogram ####################################
def prepare_histogram():
    histo = HistogramData()
    callback = lambda _, words : histo.update(words)
    fr = FileReader('emma.txt', callback)

    fr.process_file()

    sorted_histo = histo.sort_hist_by_freq_desc()
    print("Total Words : " + str(histo.total_words()))
    print("Different Words : " + str(histo.different_words()))
    for freq, word in sorted_histo:
        print(word + ' : ' + str(freq))

###################### Markov Analysis ####################################
def prepare_markov_sentence():
    markov = MarkovAnalysisData(2)
    callback = lambda _, words : markov.update(words)
    fr = FileReader('emma.txt', callback)

    fr.process_file()
    # markov.update('Half a bee, philosophically, Must, ipso facto, half not be. But half the bee has got to be Vis a vis, its entity. D’you see? But can a bee be said to be Or not to be an entire bee When half the bee is not a bee Due to some ancient injury?'.split())

    sentence = markov.generate()
    print(sentence)

# prepare_histogram()
prepare_markov_sentence()
