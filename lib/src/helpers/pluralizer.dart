String pluralize(String word) {
  if (word.isEmpty) {
    return word;
  }

  // Handle irregular plurals
  if (irregularPlurals.containsKey(word.toLowerCase())) {
    return irregularPlurals[word.toLowerCase()]!;
  }

  // Handle words ending in 'y'
  if (word.endsWith('y') && !isVowel(word[word.length - 2])) {
    return word.substring(0, word.length - 1) + 'ies';
  }

  // Handle words ending in 'o'
  if (word.endsWith('o') && !isVowel(word[word.length - 2])) {
    return word + 'es';
  }

  // Handle words ending in 'f' or 'fe'
  if ((word.endsWith('f') && word.length > 1 && !isVowel(word[word.length - 2])) ||
      word.endsWith('fe')) {
    if (word.endsWith('f')) {
      return word.substring(0, word.length - 1) + 'ves';
    } else {
      return word.substring(0, word.length - 2) + 'ves';
    }
  }

  // Handle irregular endings like 'man' -> 'men'
  if (irregularEndings.containsKey(word)) {
    return irregularEndings[word]!;
  }

  // Add 's' for most cases
  return word + 's';
}

bool isVowel(String letter) {
  return ['a', 'e', 'i', 'o', 'u'].contains(letter.toLowerCase());
}

// Irregular plurals mapping
Map<String, String> irregularPlurals = {
  'person': 'people',
  'child': 'children',
  'foot': 'feet',
  'tooth': 'teeth',
  'goose': 'geese',
  'mouse': 'mice',
  'man': 'men',
  'woman': 'women',
  'book':'books'
};

// Irregular word endings mapping
Map<String, String> irregularEndings = {
  'cactus': 'cacti',
  'focus': 'foci',
  'fungus': 'fungi',
  'nucleus': 'nuclei',
  'syllabus': 'syllabi',
};
