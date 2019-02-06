<style>
.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
}
.small-code pre code {
  font-size: 1em;
}
</style>

The Rice Data App Presentation
========================================================
author: Ranxel Almario                
date: February 06, 2018
autosize: false

Abstract
========================================================

The __Rice Data__ Shiny application serves as an interactive data provider that showcases the major rice data of the Philippines for the past 17 years (2001-2017). Categories include:
- Total volume of production (metric ton)
- Total area harvested (hectare)
- Estimated yield per hectare (kilogram)
- Estimated gross returns (PhP per hectare)

You may visit and try the app: <br/>
Rice Data app: https://ralmario.shinyapps.io/ricedata/

Data Overview
========================================================




```r
head(riceData) 
```

```
  Year ProdVolume  AreaHA DryPrice
1 2001   12954870 4065441     8.52
2 2002   13270653 4046318     9.69
3 2003   13499884 4006421     9.86
4 2004   14496784 4126645     9.73
5 2005   14603005 4070421    11.08
6 2006   15326706 4159930    11.05
```

The __riceData__ dataset contains 4 variables: Year, ProdVolume (volume of production), AreaHA (area harvested), and DryPrice (price of dry palay paddy/kilogram). Yield and gross returns showed in the application is computed and dynamically generated using the __riceData__ dataset.

Preview
========================================================
<img src="https://i.imgur.com/YySPvOQ.png.png"></img>

Data Source
========================================================

Philippine Statistics Authority. CountrySTAT Philippines. Retrieved from http://countrystat.psa.gov.ph/

## Links
Source code: https://github.com/ralmario/ShinyAppProject <br/>
Link of the Presentation: https://ralmario.github.io/ShinyAppProject/R%20Presentation/riceData%20Pres.html#/<br/>
__Rice Data__ app is made on Shiny: https://shiny.rstudio.com/

