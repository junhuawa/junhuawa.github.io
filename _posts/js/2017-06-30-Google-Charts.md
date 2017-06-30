---
layout: post
title:  "Google Charts!"
date: 2017-06-30
category: web
tags: [web]
---

#### Google Charts

    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(drawChart);//draw the chart when the load happen

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Topping');
    data.addColumn('number', 'Slices');//data type, value
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);//multi-dimention array, dictionary

Search your document for an element with id called 'chart_div'.

[Google Charts](https://google-developers.appspot.com/chart/)





