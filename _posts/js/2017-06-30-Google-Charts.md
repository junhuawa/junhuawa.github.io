---
layout: post
title:  "Google Charts!"
date: 2017-06-30
category: web
tags: [web]
---

#### Google Visualization API Reference

#### Google Charts
Google Charts 是在Web上画各种图表的一个库，用起来很方便。 

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
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

Search your document for an element with id called 'chart_div'.

[Google Charts](https://google-developers.appspot.com/chart/)


    google.visualization.data.join  Joins two data tables on one or more key columns.

    /* Joined all graphs data */
        this.joined_data = new google.visualization.DataTable();

    this.joined_data = google.visualization.data.join(this.graph_data[0].graph_data, this.graph_data[1].graph_data, 'full', [[0, 1]], [1], [1]);
