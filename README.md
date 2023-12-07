# Assignment_b4 - Penguins_ShinyApp updated New Version 

## Penguins_ShinyApp Discription :page_with_curl:

The original [Penguins_ShinyApp App](https://zhmm.shinyapps.io/assignment3_mmzh/) displays a dot plot that shows the body mass of penguins and the islands they belong to. The slider tool can be manipulated so that the data will be presented in the interactive table.  

The updated version [Penguins_ShinyApp2.0 App]()

## The Features of original App
1. Slider Tool: allows user to select for body mass data from min 2700 to max 6300 (g)
2. Download button: The selected data can be downloaded using the **Download selected data** button.  
3. Interactive Table: Click Tab **Table**, the users will see the other information of the penguins within selected body mass range.

## New features to the updated App
1. Add a checkbox which can show variables in certain columns of the raw data
2. Add a plot in a new tab that can show average weights of penguins in different islands
3. A slide bar was moved to the tab that includes the plot function, so it would be more convenient for users
4. A new theme was applied to the App that looks more like the cool environment penguins living in

## About the Dataset: penguins_raw
The dataset was from the Palmerpenguins R package including data collected over three year (2007-2009). It provided with information of study name, sample number, region, island, stage etc.

## Dataset citation 
By typing citation("palmerpenguins") in your R console, you will get the following information:

To cite palmerpenguins in publications use:

  Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer Archipelago (Antarctica) penguin data. R package
  version 0.1.0. https://allisonhorst.github.io/palmerpenguins/. doi: 10.5281/zenodo.3960218.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {palmerpenguins: Palmer Archipelago (Antarctica) penguin data},
    author = {Allison Marie Horst and Alison Presmanes Hill and Kristen B Gorman},
    year = {2020},
    note = {R package version 0.1.0},
    doi = {10.5281/zenodo.3960218},
    url = {https://allisonhorst.github.io/palmerpenguins/},
  }
## How to view or use this dataset: 
1. Download the palmerpenguins package using the install.packages() function.
2. Call the palmerpenguins package using the library() function.
3. There you go~ You can View() the data now! 

