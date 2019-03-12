Workout 1
================
Angie Chen

Code
----

``` r
twopt_yes = filter(dataframe, shot_type == "2PT Field Goal" & shot_made_flag == "shot_yes")
twopt_yes = select(twopt_yes, name, shot_made_flag)
twopt_yes = count(twopt_yes, name, shot_made_flag)
twopt_yes = twopt_yes %>% rename(made = n)
twopt_yes = select(twopt_yes, name, made)
twopt_no = filter(dataframe, shot_type == "2PT Field Goal" & shot_made_flag == "shot_no")
twopt_no = select(twopt_no, name, shot_made_flag)
twopt_no = count(twopt_no, name, shot_made_flag)
twopt_no = twopt_no %>% rename(missed = n)
twopt_no = select(twopt_no, name, missed)
```

``` r
twopt = merge(twopt_yes, twopt_no, by = "name")
twopt$total = twopt$made + twopt$missed
twopt$perc_made = twopt$made / twopt$total
twopt = select(twopt, name, total, made, perc_made)
table1 = twopt[with(twopt, order(-perc_made)), ]
```

``` r
threept_yes = filter(dataframe, shot_type == "3PT Field Goal" & shot_made_flag == "shot_yes")
threept_yes = select(threept_yes, name, shot_made_flag)
threept_yes = count(threept_yes, name, shot_made_flag)
threept_yes = threept_yes %>% rename(made = n)
threept_yes = select(threept_yes, name, made)
threept_no = filter(dataframe, shot_type == "3PT Field Goal" & shot_made_flag == "shot_no")
threept_no = select(threept_no, name, shot_made_flag)
threept_no = count(threept_no, name, shot_made_flag)
threept_no = threept_no %>% rename(missed = n)
threept_no = select(threept_no, name, missed)
```

``` r
threept = merge(threept_yes, threept_no, by = "name")
threept$total = threept$made + threept$missed
threept$perc_made = threept$made / threept$total
threept = select(threept, name, total, made, perc_made)
table2 = threept[with(threept, order(-perc_made)), ]
```

``` r
total_yes = filter(dataframe, shot_made_flag == "shot_yes")
total_yes = select(total_yes, name, shot_made_flag)
total_yes = count(total_yes, name, shot_made_flag)
total_yes = total_yes %>% rename(made = n)
total_yes = select(total_yes, name, made)
total_no = filter(dataframe, shot_made_flag == "shot_no")
total_no = select(total_no, name, shot_made_flag)
total_no = count(total_no, name, shot_made_flag)
total_no = total_no %>% rename(missed = n)
total_no = select(total_no, name, missed)
```

``` r
totaltbl = merge(total_yes, total_no, by = "name")
totaltbl$total = totaltbl$made + totaltbl$missed
totaltbl$perc_made = totaltbl$made / totaltbl$total
totaltbl = select(totaltbl, name, total, made, perc_made)
table3 = totaltbl[with(totaltbl, order(-perc_made)), ]
```

Introduction
------------

Background
----------

Data
----

2PT Effective Shooting Percentage by Player

    ##             name total made perc_made
    ## 1 Andre Iguodala   210  134 0.6380952
    ## 3   Kevin Durant   643  390 0.6065319
    ## 5  Stephen Curry   563  304 0.5399645
    ## 4  Klay Thompson   640  329 0.5140625
    ## 2 Draymond Green   346  171 0.4942197

3PT Effective Shooting Percentage by Player

    ##             name total made perc_made
    ## 4  Klay Thompson   580  246 0.4241379
    ## 5  Stephen Curry   687  280 0.4075691
    ## 3   Kevin Durant   272  105 0.3860294
    ## 1 Andre Iguodala   161   58 0.3602484
    ## 2 Draymond Green   232   74 0.3189655

Overall Effective Shooting Percentage by Player

    ##             name total made perc_made
    ## 3   Kevin Durant   915  495 0.5409836
    ## 1 Andre Iguodala   371  192 0.5175202
    ## 4  Klay Thompson  1220  575 0.4713115
    ## 5  Stephen Curry  1250  584 0.4672000
    ## 2 Draymond Green   578  245 0.4238754

GSW Shot Charts

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

Analysis
--------

Discussion
----------

Conclusion
----------

References
----------
