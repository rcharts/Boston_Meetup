---
title       : 
subtitle    : 
author      : 
job         : 
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light     # 
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
--- &tabs

<style>
li.tab::before{
  content: ""
}
</style>

## Read-An-Delete

***

## JSON

```js
"dataset": {
     "Brown": [
       {"name": "Black", "value": 32 },
       {"name": "Brown", "value": 53 },
       {"name": "Red","value":  10},
       {"name": "Blond", "value": 3} 
     ],
    "Blue": [
       {"name": "Black", "value": 11 },
       {"name": "Brown", "value": 50 },
       {"name": "Red","value":  10},
       {"name": "Blond", "value": 30} 
     ],
    ...
} 
```

*** .active

## DataFrame


```r
   Hair   Eye  Sex Freq
1 Black Brown Male   32
2 Brown Brown Male   53
3   Red Brown Male   10
4 Blond Brown Male    3
5 Black  Blue Male   11
6 Brown  Blue Male   50
```


