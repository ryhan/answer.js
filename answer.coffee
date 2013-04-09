# answer.coffee

sentenceSimilarity = (stemA, stemB) ->
    _.intersection(stemA, stemB).length

class @answer

  constructor: () ->
    @tag = new POSTagger().tag
    @tokenize = new Lexer().lex
    @stem = natural.PorterStemmer.tokenizeAndStem
    @sentences = [ ]
    @stemmedSentences = [ ]


  read: (article) -> 
    stem = @stem

    article = article.replace(/Dr./g, "Dr")
    sentences = @sentences.concat article.split(".")
    stemmed = _.map(sentences, (text) -> stem text )

    @sentences = @sentences.concat sentences
    @stemmedSentences = @stemmedSentences.concat stemmed


  match: (sentence) ->
    
    corpus = @sentences
    stemmedCorpus = @stemmedSentences
    stemA = @stem sentence

    scores = _.map(stemmedCorpus, (stemB) -> sentenceSimilarity(stemA, stemB))
    ranked = _.sortBy(_.zip(scores, corpus), (x) -> -1 * x[0])
    _.filter(ranked, (score) -> (score[0] > 0))
