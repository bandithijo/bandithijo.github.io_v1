---
layout: 'page'
title: 'Grep'
permalink: '/grep/'
---

<!-- Html Elements for Search -->
{% include search.html %}

<!-- Script pointing to search-script.js -->
<script src="{{ '/assets/js/search.js' | absolute_url }}" type="text/javascript"></script>

<!-- Configuration -->
<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json'
})
</script>
