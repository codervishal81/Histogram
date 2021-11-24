from histogram import HistogramData

histogram = HistogramData()
# histogram.process_file('QuotationPartLineOption.feature')
histogram.process_file('emma.txt')

sorted_histo = histogram.sort_hist_by_freq_desc()
print("Total Words : " + str(histogram.total_words()))
print("Different Words : " + str(histogram.different_words()))
for freq, word in sorted_histo:
    print(word + ' : ' + str(freq))