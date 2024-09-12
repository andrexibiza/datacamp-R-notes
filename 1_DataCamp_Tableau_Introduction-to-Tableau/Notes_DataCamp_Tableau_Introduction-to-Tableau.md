---
tags:
  - Tableau
---
# Key Terms
Based on your notes from the "Introduction to Tableau" course on DataCamp, here's a comprehensive term table that encapsulates all the key terms discussed across the chapters, organized alphabetically for quick reference. This table serves as a valuable resource for understanding the fundamental concepts of Tableau and their applications in data visualization and analysis.

| Term                             | Definition                                                                                                                                                                                                                               | Chapter Number |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| [[Aggregation]]                  | The process of summarizing or aggregating data points for analytics, such as summing sales, calculating average age, counting distinct customers, or finding maximum sales.                                                              | 2, 4           |
| [[Calculated Fields]]            | Fields created to generate new data from existing data in the dataset. They can be used for various transformations and calculations, such as currency conversion, rounding numbers, extracting parts of dates, or creating new metrics. | 2              |
| [[CSV (Comma-Separated Values)]] | A text file format where values are separated by commas, used for storing tabular data. Tableau can connect to CSV files as a data source.                                                                                               | 1              |
| [[Dashboards]]                   | A collection of several views in Tableau that allows for the comparison of data and helps uncover key insights. Dashboards are interactive and can contain filters, allowing users to drill down and do their own analysis.              | 4              |
| [[Discrete Dimensions]]          | Categorical fields in Tableau that have individually separate and distinct values. Examples include room type and neighborhood.                                                                                                          | 1              |
| [[Filled Map]]                   | A type of map visualization in Tableau where geographic regions are filled with color to represent data values.                                                                                                                          | 3              |
| [[Forecasting]]                  | The process of predicting future values of a measure in Tableau using mathematical models to capture trends or seasonality of the data and extrapolate them into the future.                                                             | 3              |
| [[Gapminder]]                    | A dataset used in Tableau exercises, containing a variety of social, economic, and environmental development indicators for countries.                                                                                                   | 2              |
| [[Tableau.geocoding\|Geocoding]] | The process by which Tableau assigns geographic coordinates to data points based on recognized geographic information types, such as cities, countries, or postal codes.                                                                 | 3              |
| [[Reference Line]]               | A line drawn on a chart in Tableau representing another measure or point of reference, useful for providing context within visualizations.                                                                                               | 3              |
| [[Stories]]                      | A sequence of visualizations in Tableau that work together to tell a story or narrative, helping users understand and remember concepts better. Each visualization within a story is called a story point.                               | 4              |
| [[Symbol Map]]                   | A type of map visualization in Tableau that uses symbols (e.g., circles) to represent data points in geographic regions, with the symbol placed in the center of the region.                                                             | 3              |
| [[Tableau]]                      | A powerful data visualization tool that enables users to create interactive and shareable dashboards from raw data through intuitive click, drag, and drop functionality.                                                                | 1              |
| [[Tableau.CEILING()]]            | A Tableau function mentioned in the context of calculated fields, likely used for rounding numbers up to the nearest integer.                                                                                                            | 2              |
| [[Tableau.DATEPART()]]           | A function in Tableau used to extract specific components from a date field, such as year, month, day, etc., for detailed data analysis.                                                                                                 | 3              |
| [[Tableau.DIV()]]                | A Tableau function mentioned in the context of calculated fields, likely used for division operations.                                                                                                                                   | 2              |
| [[Tableau.ENDSWITH()]]           | A Tableau function mentioned in the context of calculated fields, likely used to check if a string ends with a specific sequence of characters.                                                                                          | 2              |
| [[Tableau.POWER()]]              | A Tableau function that allows raising a field to a certain power, mentioned in the context of creating calculated fields.                                                                                                               | 2              |
| [[Trendline]]                    | A feature in Tableau used to predict the continuation of a certain trend within a visualization, making it easy to see the overall direction of a measure over time.                                                                     | 3              |

This table should serve as an effective educational tool and a practical resource for reference and study, providing quick access to definitions and their corresponding chapter occurrences within the "Introduction to Tableau" course notes.

# Chapter 1: Getting Started with Tableau

![[DataCamp_Tableau_Introduction-to-Tableau_chapter1.pdf]]

## Video 1.1: Introduction

### 1. Introduction

00:00 - 00:10

Welcome to this introductory course on Tableau! My name is Maarten and I will be your first instructor guiding you through your Tableau journey.

### 2. What is [[Tableau]]?

00:10 - 00:29
![[Pasted image 20240426131625.png]]

Tableau is a powerful and leading data visualization tool. It allows you to intuitively click, drag, and drop data elements to explore and interrogate your data. In other words: Tableau makes it easy to build beautiful, interactive visualizations from raw data.

### 3. Why use Tableau?

00:29 - 01:16
![[Pasted image 20240426131634.png]]

While Tableau is designed to be used by a range of business users and non-technical audiences, it also provides access to a deep computational ability for advanced data analytics. It's flexible because you can easily work with a lot of different data sources. In addition, Tableau is quite intuitive: visual cues and icons make the interface easier to navigate. Also, the drag and drop functionality makes prototyping very fast: you can build dashboards in hours or days instead of weeks. Overall, Tableau is great because you can frame the business question you want to answer, import and clean data, analyze and visualize data, make business decisions, and finally, present insights, all within one tool!

### 4. Who uses Tableau?

01:16 - 01:41
![[Pasted image 20240426131642.png]]

Tableau enables anyone to ask questions about their data. If you search for "Tableau" on job boards, the most common job titles you'll see are variants of data analyst, business analyst, and analytics consultant. Basically anyone who wants to analyze or visualize data can benefit from using Tableau. Let's look at some examples of what's possible with Tableau.

### 5. Possibilities with Tableau

01:41 - 01:57
![[Pasted image 20240426131651.png]]

Presenting sales performance over time and location using an interactive dashboard is a very common example for using Tableau. The user can select, filter, and hover over the various dashboard elements to learn more about the data.

1. 1 Author: Pradeep Kumar G. Originally published on: Tableau Public

### 6. Possibilities with Tableau

01:57 - 02:04
![[Pasted image 20240426131700.png]]

Secondly, Tableau is also a fantastic tool to present the results of your competitive analysis.

1. 1 Author: Daniel Ling. Originally published on: Tableau Public

### 7. Possibilities with Tableau

02:04 - 02:23
![[Pasted image 20240426131709.png]]

Thirdly, Tableau can also be used to track outbreaks and epidemic progression, like the coronavirus. Factual data is convincing, and visualization is an incredibly efficient way to get your point across - so Tableau can be an appropriate tool in various circumstances.

1. 1 Author: Thi Ho. Originally published on: Tableau Public

### 8. Tableau versions

02:23 - 03:28
![[Pasted image 20240426131727.png]]

Before we head over to the exercises, let's quickly talk about Tableau versions. Tableau Public is essentially a free version of Tableau. It has most of the software features: you have access to all the available visualizations and can connect to Excel and CSV files. However, you can't load more than 15 million rows and can't save your workbook locally. Your work is stored publicly on Tableau's gallery, so using Tableau public with sensitive data is definitely not recommended. The professional version requires a license, you can create visualizations, connect to all available data sources, add an unlimited amount of rows, and save your work locally. In this course, you will be using Tableau Public. Although you can download Tableau Public on your local machine if you want to, you don't have to install anything to complete this course. Everything, including a virtual machine running Tableau, and the necessary datasets, are available for you online.

### 9. Let's practice!

03:28 - 03:33

Got it? Let's see how well you know Tableau.

## Video 1.2: Connecting to data
### 1. Connecting to data

00:00 - 02:19

When opening Tableau, you land on the Start Page.

![[Pasted image 20240426132250.png]]

Before creating any visualization, however, you need to have some data available. Let’s see how to connect to a data source using Tableau. 

![[Pasted image 20240426132323.png]]

There are many data sources you can connect to: here on the left, you can see the data sources that are available with Tableau Public. 

The professional version of Tableau has a lot more possibilities. Throughout this course, you will mainly use [[CSV (Comma-Separated Values)]] files, so let’s see how to connect to those. CSV means Comma Separated Values: it’s a text file where values are separated by commas. So let’s click on Text File here. This takes you to the Datasources folder on the Desktop. Let’s open the Airbnb San Francisco CSV. Tableau redirects you to the Data Source page, where you can now preview the data. 
![[Pasted image 20240426132630.png]]

Each row is a different Airbnb listing. 
![[Pasted image 20240426132659.png]]

We have data about neighborhood, location, room type, price, and so on. 
- If you want to rename a column, you can change it by double-clicking the column name. 
- Note that this will not change the column name in the original data source. 
- Let’s change “neighbourhood” to use the US spelling. 

Above the column names, icons indicate the data type.
![[Pasted image 20240426134310.png]]

For example, there is a number sign for numbers, a globe for locations, or Abc for text. Tableau is pretty good at guessing data types, but it can make mistakes, so reviewing the assigned types is good practice. You can change these types if necessary, by clicking the icon and selecting the appropriate data type.
![[Pasted image 20240426134327.png]]


From here, you can also go to the worksheet, which we will discuss in the next lesson; create a new worksheet; or create dashboards and stories, which will be covered later. You can also load a prepared Tableau workbook, containing data sources and visualizations. Clicking on File, and then Open, you can navigate to the Workbooks folder on the Desktop. Here, you will find the necessary workbooks for the exercises. Ready to start using Tableau? Let’s do some exercises.

## Video 1.3: Navigating Tableau
### 1. Navigating Tableau

00:00 - 00:08

Welcome back! Now that we've connected our data sources, let's get comfortable with the Tableau interface.

### 2. Tableau interface

00:08 - 00:24
![[Pasted image 20240426143726.png]]

This is the interface for Tableau worksheets, where you will create your visualizations. You can see that there are different components that make up the interface. We'll explore them in the demo, but first there is some Tableau jargon to get familiar with.

### 3. Data

00:24 - 00:38
![[Pasted image 20240426143738.png]]

The data pane shows the data sources you've loaded. Here we have just one file, our Airbnb listings in San Francisco. You can see there's another pane, Analytics, which you will look into later on.

### 4. Dimensions and measures

00:38 - 00:50
![[Pasted image 20240426143747.png]]

The data pane also shows all available fields or columns of your data source. Notice the use of two different colors, green and blue.

### 5. Continuous

00:50 - 01:03
![[Pasted image 20240426143759.png]]

Green fields are continuous fields, treated as an infinite range. Examples are the number of reviews per month, room price, or the longitude of the location.

### 6. Discrete

01:03 - 01:18
![[Pasted image 20240426143811.png]]

Blue fields are discrete, or categorical fields, which means they have individually separate and distinct values. Examples include room type, neighborhood, and the ID number of the listing.

### 7. Dimensions

01:18 - 01:46
![[Pasted image 20240426143819.png]]

While the color of the fields indicate whether they are continuous or discrete, the position of the fields in the data pane indicate whether fields are treated as dimensions or measures. Dimensions, positioned at the top, contain qualitative values, such as names or dates. Our dimensions include Neighborhood, Room Type, or number of reviews per month.

### 8. Measures

01:46 - 02:14
![[Pasted image 20240426143830.png]]

Measures (positioned under the dimensions) contain numeric quantitative values that you can, well, measure, and aggregate. Examples of measures in this dataset include price, the number of minimum nights, and the total number of reviews. Tableau assigns these so-called data roles to fields automatically. Again, it is good practice to review these and adapt where necessary.

### 9. Converting between dimensions and measures

02:14 - 02:28
![[Pasted image 20240426143842.png]]

For example, it makes sense to convert the number of reviews per month to a measure, as you might want to calculate the average of it, for example. You can convert fields between measures and dimensions,

### 10. Converting between discrete and continuous

02:28 - 02:35
![[Pasted image 20240426143851.png]]

or between discrete and continuous. As any combination of data roles is possible in theory,

### 11. Data roles in Tableau

02:35 - 02:51
![[Pasted image 20240426143900.png]]

here is an overview. [[Discrete dimensions]] and [[continuous measures]] are the more common combinations of data roles. They include the classic examples of eye color and sex, and height and weight, respectively.

### 12. Data roles in Tableau

02:51 - 03:01
![[Pasted image 20240426143915.png]]

Less common combinations are [[discrete measures]] (for example, shoe size and age) and [[continuous dimensions]] (for example, date).

### 13. Segmenting with dimensions

03:01 - 03:29
![[Pasted image 20240426143925.png]]

Why are data roles so important in Tableau? Note that changing the data role of a field will affect your visualization possibilities. Dimensions allow you to group and segment data, while measures can be aggregated and add quantitative values to dimensions. [[Segmenting]] means grouping similar data for each category, for example calculating the average price for each room type.

### 14. Dragging dimensions and measures

03:29 - 03:38
![[Pasted image 20240426143937.png]]

Creating visualizations is done by dragging and dropping dimensions and measures on the canvas, shelves and cards.

### 15. Canvas

03:38 - 03:42
![[Pasted image 20240426143944.png]]

The canvas is where your visualizations will appear.

### 16. Columns

03:42 - 03:46
![[Pasted image 20240426143954.png]]

Columns correspond to the x axis of your view,

### 17. Rows

03:46 - 03:49
![[Pasted image 20240426144001.png]]

and rows to the y axis.

### 18. Pages

03:49 - 03:57
![[Pasted image 20240426144008.png]]

The Pages shelf lets you break a visualization into several pages; for example, one page for each neighborhood.

### 19. Filters

03:57 - 04:03
![[Pasted image 20240426144015.png]]

The filters shelf lets you filter your data, and you will learn more about this in a next chapter.

### 20. Marks

04:03 - 04:08
![[Pasted image 20240426144023.png]]

The marks field contains marks cards and marks types.

### 21. Marks cards

04:08 - 04:15
![[Pasted image 20240426144033.png]]

Marks cards encompass color, size, and shape: these let you add context and detail to your view.

### 22. Marks types

04:15 - 04:21
![[Pasted image 20240426144043.png]]

You can change the type of marks displayed in the view to fit your analysis better.

### 23. Toolbar

04:21 - 04:31
![[Pasted image 20240426144051.png]]

Finally, the tool bar lets you quickly access useful features, such as undoing, sorting, clearing the canvas, and so on.

### 24. Our business question

04:31 - 04:42
![[Pasted image 20240426144058.png]]

Alright, enough theory for now - let's start playing with some data in Tableau! In the exercises, you'll look at the price of rooms in each New York neighborhood.

### 25. Let's practice!

04:42 - 04:47

But first, let's test your knowledge on dimensions and measures.

## Video 1.4: A Tour of the Interface

00:00 - 03:57

Now that you’re familiar with the most important Tableau terminology, let’s see Tableau’s interface in action. We currently have a blank worksheet. In the data pane, we have our San Francisco data loaded, with its dimensions and measures. Remember blue fields are discrete, and green fields are continuous. The data type icons you saw on the Data Source page when loading the data also appear here. Notice Tableau automatically generated new fields for us, shown in italic: measure names, the number of records (given by san francisco dot csv (count)), and the measure values. We’d like to know which neighborhoods have the highest number of reviews. So let’s focus on neighborhoods first. When you start dragging a field, some places are highlighted in orange. These are all the places we can drop our field on. Let’s drag it into rows. Whether you drag it here or here has the same result. Then, we would like to see the total number of reviews for each of neighborhoods, so we drag the number of reviews to the text card, and we get the number of reviews per neighborhood! Notice how by default, Tableau takes the sum of the data. If you click on the down arrow, you can change the measure's aggregation: you could use the average, or the maximum, for example. Sum makes sense in this case, so we keep it that way. You could also drag the number of reviews field to size instead, or color. Tableau automatically adds a legend. We’ll stick with text for now. In the toolbar, you have different buttons. This one gets you back to the Start Page. This back arrow lets you undo your changes, and this one allows you to clear your sheet to make it blank again. Currently, you can see that Bayview has a total of 6,119 reviews. Let’s now find out the number of reviews for listings under $200 a night. To do that, we use the Filter shelf. We will get into more detail about filters in a next chapter. For now, you just drag the price field onto the Filter shelf. The popup window offers several ways to aggregate the data. We want to consider all values, which is selected by default, so click next. You then input a range of values from 0 to 199. Let’s apply it: our values have changed. Bayview now has 5,137 reviews for listings under $200. To remove a field, just drag it out until you see a red cross appearing, and release. Now imagine you would like to know the number of reviews in each neighborhood for each room type. You just need to drag the room type to rows. See how dimensions help you segment the data into groups. Now you see that Bayview has 2,807 reviews on entire homes, 3,311 reviews on private rooms, and just one review for shared rooms. Now if you find that overwhelming, you can drag neighborhood to Pages. We now have a page for each neighborhood, and we can navigate through each neighborhood separately. You can also use the drop-down menu to find a neighborhood directly. Time for you to try it out in the exercises!

## Video 1.5: How to create visualizations in Tableau

00:00 - 04:20

Hi again! I hope you’re enjoying the course so far. This is the state in which we left our sheet in the last video. Isn’t there another way to visualize the count and proportion of reviews for the different types of rooms, instead of clicking or browsing through a dull table? We’re talking about Tableau, of course there is! And it’s incredibly easy. See this Show Me button, in the top right corner of the interface? Tableau is smart: based on the data you use to create your view, it can suggest appropriate visualization options. In our case, we could build a pie chart, a bar chart, a box plot, or a bubble plot, for example. Let’s go with a stacked bar chart. Et voilà! It’s that easy to build visualizations in Tableau. Notice how our pages disappeared. Now, we have a bar for each neighborhood. The height of the bar is the total number of reviews, but we also have more granular information for each room type. Tableau automatically created a color legend. You can see that there is often a similar proportion of reviews for entire homes (in blue) and private rooms (in yellow). Shared rooms, in red, have the least number of reviews. However, Downtown Civic Center has many more reviews for private rooms than entire homes. And Financial District is the neighborhood with the most reviews for shared rooms. Mission is the neighborhood with the most reviews overall. It’s much easier to read that from a stacked bar chart than from a table! For peace of mind, let’s look at some other options that Show Me offers. Pie charts are not very helpful, we just get one pie chart per neighborhood. Side by side bars give us a very dense plot, and there are too many colors, information just does not jump to our eyes. A box plot is interesting, if you know how to interpret it. With 3,009 reviews, Downtown Civic Center is at the median for the Entire home/apartment category. In other words, if we were to take all reviews per neighborhood for each type of apartment and order them in ascending order, Downtown Civic Center would be right in the middle for the entire home category. You can confirm the median value by looking at the box plot metrics. Mission is considered an outlier with more than 15,000 reviews. Notice what happened: as you hover over elements on the canvas, you get more information about them. The box that appears is called a tooltip. Let’s go back to the stacked bar chart. If you want to know the exact number of reviews for the entire home/apartment segment in Mission, you can hover over this blue area. Unsurprisingly, it reveals the same number of reviews as we saw in our box plot. There are two key takeaways here. One, Tableau makes it super easy to try different visualizations. Two, Tableau shows you what you CAN build, not what you SHOULD build. It’s up to you to build a visualization that makes sense based on the question you want to answer. There are many things you could do to customize this chart further. For example, you may want to see the reviews count directly instead of hovering over bars on a case-by-case basis. To do this, you can click this Show Mark Labels button. Now it’s explicit that Mission has 15,768 reviews for entire homes and apartments, and 17,376 reviews for private rooms. The shared rooms area is too small to show a number, but you can still hover over it to find out there are only 1,268. Now it’s your turn to build some visualizations in this chapter’s last set of exercises!

# Chapter 2: Building and Customizing Visualizations

![[DataCamp_Tableau_Introduction-to-Tableau_chapter2.pdf]]
## Video 2.1: Filtering and Sorting
### 1. Filtering and sorting

00:00 - 00:09

Welcome to chapter two, where we will cover the basics of building and customizing visualizations. We will start with filtering and sorting.

### 2. Filtering

00:09 - 00:25
![[Pasted image 20240427110851.png]]

Filtering is a natural step in creating visualizations and you've already done some in the first chapter. Filtering involves deciding what should be kept and excluded from a view, from filtering by category, date range, location, or a minimum value.

### 3. Types of filters in Tableau

00:25 - 00:55
![[Pasted image 20240427110859.png]]

Filtering can happen at multiple points in the user flow of Tableau. So there is an order of operations to when filters are executed. Order matters, especially if you are fetching top records. The first two, extract and data source filters, occur when you are connecting and loading data sources. This usually happens before opening a worksheet. Context filters are a more advanced feature that won't be covered in this course. The last two occur in the worksheet and they will be our focus.

### 4. Dimension filters (in blue)

00:55 - 01:23
![[Pasted image 20240427110908.png]]

Remember that dimension fields are often categorical data, so when you are filtering on dimension, it usually has to do with selecting which categories to keep or exclude. For example, we can do this with room type in the last chapter. There are other options such as creating a wildcard that looks for matches in characters, or setting conditions based on other fields. You can also return the top or bottom records.

### 5. Measure filters (in green)

01:23 - 01:36
![[Pasted image 20240427110916.png]]

Measures contain quantitative data, which means we're filtering numbers rather than categories. Another set of filters are applicable to measures, from specifying a range of values or selecting null or non-null values.

### 6. Sorting

01:36 - 02:02
![[Pasted image 20240427110927.png]]

Sorting is another fundamental step in creating a visualization and more straightforward compared to filtering. Tableau defaults on alphabetical sorting on dimension, which is not always ideal. An important alternative is sorting by a metric, whether it's ascending or descending value. For example, sorting products by their gross profit makes a way more interesting visual than sorting products alphabetically.

### 7. Dataset

02:02 - 02:26
![[Pasted image 20240427110935.png]]

In the next several exercises, we will be using the [[gapminder]] dataset which is publicly available and contains a variety of social, economic and environmental development indicators for countries. Specifically, we will look look at the average number of cell phones and broadband subscribers per 100 people at the country level. This metric can be used to evaluate a country’s development in communication infrastructure.

### 8. Let's practice!

02:26 - 02:32

Time to try out sorting and filtering on Tableau!

## Video 2.2: Sorting and filtering through selection

00:00 - 01:33

Here is a simple horizontal bar graph showing the cell phone metric segmented by country and year. 
![[Pasted image 20240427112549.png]]

We can sort directly on the view by clicking the headers. 
![[Pasted image 20240427112559.png]]

Or, we can also use the icons on the tool bar to sort in ascending and descending order. 
![[Pasted image 20240427112612.png]]

One of the ways to filter is by selection. 
![[Pasted image 20240427112635.png]]

Let’s say we wanted the top 10 countries in 2006, we highlight the first 10 rows and right click to keep only. Say we only wanted 2015 to 2017, we could select those categories and keep only. You can also choose to exclude, for example filtering out 2015. You can filter at the different levels from the year, the country, to the measure itself. If you look at the filter card, you can see that our filtering is being recorded Dragging these cards away removes the filter. The standard way of filtering is dragging fields to the filter shelf. 
![[Pasted image 20240427112737.png]]

Dragging a dimension, allows us to check which values we want to see. 
![[Pasted image 20240427112804.png]]

When dragging a measure, we get an option for aggregation, which we can skip for now. 
![[Pasted image 20240427112827.png]]


We can specify a range or max/min for values. 
![[Pasted image 20240427112850.png]]

The default values are the actual range in the view currently. 
![[Pasted image 20240427112919.png]]

For example, I can filter for countries with at most 20 cell phone users per 100 people. We can always edit all these filters back on the filter shelf!

## Video 2.3: Filtering Through the Filter Shelf
We now have the cellphone and broadband metric in our visualization. Let’s use the show me feature to pick a more suitable visualization like the side-by-side bar graph. Both communication metrics are in the filter card. If we select show filter for both, we can see interactive filter cards on the side. The same can be done with a dimension like country which comes in the form of a checklist. In each interactive filter, you can customize the appearance and if single or multiple values can be selected. You may notice there are null values in our graph. This is misleading because it makes it look like the values are 0 when we just don’t know the actual values of those countries. We can filter out null values by going to the special tab and selecting non-null values. Another useful filter is the TOP filters for dimensions. For example, let’s say we wanted to only show the top 5 countries with the highest cellphone metric average across all years. We go into the top tab to do this. 
![[Pasted image 20240427114432.png]]

Note that you can also choose bottom instead of top.

## Video 2.4: Aggregation

00:00 - 00:05

In this video and following exercises, we will be looking at aggregation.

### 2. What is aggregation?

00:05 - 00:23
![[Pasted image 20240427120059.png]]

[[Aggregation]] means gathering and summarizing data points for analytics. This can mean different things depending on your use case. For example, it could be adding up sales, getting a user's average age, counting distinct customers, or finding the product with the maximum sales.

### 3. Aggregating measures

00:23 - 00:40
![[Pasted image 20240427120121.png]]

Most commonly, we aggregate measures and Tableau automatically does so with sum. As you have probably seen in past exercises, there are several options for aggregations from average, count, percentile, to variance.

### 4. Aggregating dimensions

00:40 - 01:04
![[Pasted image 20240427120131.png]]

Not as much of a common use-case as measures, we can also aggregate dimensions. Tableau doesn't automatically aggregate dimensions, however the platform provides four options: minimum, maximum, count, and distinct count. If you choose to aggregate on a dimension, it creates a temporary measure like this.

### 5. Dataset

01:04 - 01:39
![[Pasted image 20240427120138.png]]

In the next few exercises, we'll be using another Gapminder dataset with four metrics: Child mortality rate per 1000 births, GDP per Capita, C02 Emissions per Person in tonnes, and Life expectancy. These are popular indicators of economic development and there are often relationships between these metrics. There are also two others columns that segment Life Expectancy and GDP per Capita into categories of ranges. We will see why it is useful to have some measures in a dimension form.

### 6. Let's practice!

01:39 - 01:44

Now let's try it on Tableau!

## Video 2.5: Calculated Fields

00:00 - 00:05

Now that you've mastered the basics of filtering and sorting, let's move on to calculated fields!

### 2. What are [[calculated fields]]?

00:05 - 00:18
![[Pasted image 20240427124730.png]]

According to Tableau, Calculated fields allow you to create new data from data that already exists in your data source. So what does that mean? When would you want to create new data from existing data?

1. https://help.tableau.com/current/pro/desktop/en-us/calculations_calculatedfields_create.htm

### 3. Examples of calculated fields

00:18 - 00:46
![[Pasted image 20240427124925.png]]

Let's step back and look at some examples. Say you have a field with the sales amount your company makes each quarter. It's in US dollar, but you'd also like to have it in Euros. You can create a calculated field by multiplying the sales amount in USD by the current exchange rate - in this case zero point nine. Another example could be rounding gas prices up or creating a new field that indicates whether an email is a gmail account.

### 4. Examples of calculated fields

00:46 - 01:11
![[Pasted image 20240427124931.png]]

You could also create a field with the year from a field holding the entire date. This is nice if you are trying to segment data by year. Calculated fields can use more than one field. For example, if you wanted to calculate the price earnings ratio, you can divide both data fields. Calculated fields are simple and very powerful. These are just some examples of what you can do with them.

### 5. What are calculated fields?

01:11 - 01:29
![[Pasted image 20240427124946.png]]

Let's go back to the original definition and add a few more details. When you create a calculated field, you are creating a new column or data field - and it can be a measure or a dimension. This does not affect the underlying data, meaning you are not manipulating your data sources.

1. 1 https://help.tableau.com/current/pro/desktop/en-us/calculations_calculatedfields_create.htm

### 6. Functions

01:29 - 01:47
![[Pasted image 20240427125001.png]]

To create a calculated field, you use functions. You may have noticed a few of them in the examples. They have a pair of parenthesis, where arguments are held within them. There are several different types of functions. At this stage, we will only focus on number functions.
- [[Tableau.CEILING()]]
- [[Tableau.ENDSWITH()]]
- [[Tableau.DIV()]]

1. https://help.tableau.com/current/pro/desktop/en-us/functions.htm

### 7. Dataset

01:47 - 02:12
![[Pasted image 20240427125009.png]]

In the next demos, we will be working with a new Gapminder indicator, mean years in school. This is the mean amount of years spent in school, from primary to graduate studies. This is a useful indicator of social and economic development. The indicator is split into gender and five age groups. So besides the column for country and year, there are ten columns of different demographics for this metric.

### 8. Let's practice!

02:12 - 02:17

Let's get to it and create some calculated fields!

## Video 2.6: Creating calculated fields

00:00 - 02:19

This is a table with the G20 countries and the average years spent in school for the 25 to 34 age group from 1970 to 2015. 

![[Pasted image 20240427130014.png]]

To create a new calculated field, you go to the analysis tab and create a calculated field. 
![[Pasted image 20240427130042.png]]

You enter the name of the field here and in the space below you write the formula.
![[Pasted image 20240427130108.png]]

Let’s say we wanted to get the difference between these two columns to better analyze the gender inequality in different countries. We would simply subtract with no special Tableau function. 
![[Pasted image 20240427130134.png]]

We have to switch this new measure from sum to average. Through sorting we see that Saudi Arabia has the largest difference. Calculated fields can always be edited by going to their drop down. Tableau has built in documentation for their functions. Let’s look one up - like [[Tableau.POWER()]] - which lets you raise a field to a certain power. 

![[Pasted image 20240427130222.png]]
![[Pasted image 20240427130449.png]]

Now this table is focused on the mean years men spend in school across age groups. 
![[Pasted image 20240427130514.png]]

Although having this metric separated is useful, I now want a new column for the average across age groups for men. I’ll add up the 5 age groups to do this and divide by 5. Note that this won’t be a weighted average because each group has different amounts of people. And let’s drag it into view and try to visualize it. To simplify, I’m going to focus on the year 2015 and get rid of the other age groups. In the show me feature, I’ll select the treemap. 

![[Pasted image 20240427130726.png]]

In a [[treemap]], each rectangle represents a ==dimension== and its size is ==proportional to a measure==. In our case, each country has a rectangle proportional to the years spent in school. We see USA has the highest average and India has the lowest average.

# Chapter 3: Digging Deeper
![[DataCamp_Tableau_Introduction-to-Tableau_chapter3.pdf]]

## Video 3.1: Mapping your data

00:00 - 00:14

Welcome to Chapter 3. In this chapter we will be creating some more complex visualizations. In this lesson, we'll cover what geographic data is and how Tableau can use this data to create maps.

### 2. What is geographic data?

00:14 - 00:33
![[Pasted image 20240427132018.png]]

If you're visualizing countries globally, flight paths regionally or looking at local oil pipeline coverage, you are likely working with geographic data. Seeing that data on a map helps you make better decisions to solve the problem at hand. There are two types of maps in Tableau.

### 3. Filled map

00:33 - 00:48
![[Pasted image 20240427132030.png]]

You can create what is called a [[filled map]]. Like its name suggests a filled map is basically boundaries of a geographic region filled with color. Here the different US states are colored in.

### 4. Symbol maps

00:48 - 01:06
![[Pasted image 20240427132041.png]]

A [[symbol map]] uses symbols to represent a geographic region. It places the symbol in the center of the region. As you can see in the map on the slide, there is a circle in the center of each US state. This is what we will be doing in this lesson.

### 5. Recognized geographic types

01:06 - 01:42
![[Pasted image 20240427132050.png]]

Tableau’s robust internal database can recognize a number of different geographic information types. These include US area codes, cities worldwide, US congressional districts, worldwide countries and regions, US counties, worldwide states and provinces, and postal codes. So, Tableau can automatically assign coordinates to those places. This process is called [[Tableau.geocoding|geocoding]]. In Tableau all geocoded fields will have a globe icon associated with it.
![[Pasted image 20240427135200.png]]


1. https://help.tableau.com/current/pro/desktop/en-us/maps_geographicroles.htm

### 6. Data

01:42 - 02:05

![[Pasted image 20240427132519.png]]

In this chapter, you will be looking at worldwide health statistics from the [[gapminder]] and UN datasets. You are working for the World Health Organization and are asked to look into some historic data. Spotting patterns in the past will help make decisions on directing and coordinating international health within the United Nations system today.

### 7. Business question

02:05 - 02:22

![[Pasted image 20240427132529.png]]

The question you will be answering at the end of this lesson is: What was the population growth of the country with the highest population in 2008? Knowing this, the World Health Organization will have a better idea of where to reduce health risks due to overpopulation.

### 8. Demo time!

02:22 - 02:28

Let's have a look at how you can create a symbol map in Tableau.

## Video 3.2: Creating a Symbol Map

We’ve connected to the Gapminder data source and we’re interested in learning which countries had the most cases of lung cancer. Before we dive into the process though, let’s take a quick look at the data pane. Here we have one geocoded dimension. This field is marked with a globe icon. When we drag Country from Dimensions into the view, two things happen. The first is that Tableau automatically adds the Country field to detail on the Marks card. The second is that Tableau generates the latitude and longitude fields on Columns and Rows since the Country field was geocoded for us. Before starting, let’s filter the data on the latest year in our dataset, 2008 Now that we’ve generated a map, let’s see which countries had the most lung cancer cases. First, we’ll drag Lung Cancer from Measures to Size on the Marks card. We can increase the size of the circles, so it’s easier to see which countries had the most cases. A symbol map is perfect here because the circles in our view standardize how the data is shown and you don’t get a biased view of lung cancer cases based on the relative size of the countries. Instead, you’re focussing on the size of each circle within each country. It’s important to note that Tableau will assign the smallest circle size to the lowest value and the largest circle size to the highest value. Everything in between is represented by a proportional size based on the actual lung cancer cases. So it’s not a good idea to put a measure with potentially negative values on Size because it’s not immediately clear whether a mark with a negative number is positive or negative. Now let’s see how the countries compare with regards to their population growth rate, meaning the percentage change in population compared to the previous year. We can drag population Growth to Color on the Marks card. Notice that the default aggregation is SUM. Let’s change this to average. Then, we can click Color on the Marks card and add a black border around the circles, and remove the halo. This makes the circles stand out more from the grey map image. We can see by the orange circles that some countries’ population declined from 2007 to 2008. Note that although measures with negative values are not recommended on Size, they work really well on Color. You can adjust the background map settings too. Select the Map menu, then click Map Layers. The Map Layers pane will appear on the left panel. We can unselect Land Cover and select Coast Line. You can see how the map view changes with each selection. Looks good right? Symbol maps are great if you want to show two measures on the same map. Both circle size and color carry information we can use to make decisions. Okay, let’s practice.

## Video 3.3: Working with dates

00:00 - 00:05

In this video, we'll explore how to work with dates in Tableau.

### 2. Dates

00:05 - 00:21
![[Pasted image 20240427141658.png]]

In your analysis you will often want to understand when something happened. You'll ask questions like: when did a certain event take place, or what kind of seasonal trends do we see. Fortunately, Tableau makes this kind of visual discovery and analysis easy.

### 3. Date data

00:21 - 00:38
![[Pasted image 20240427141706.png]]

Dates are automatically placed in the Dimensions area of the Data pane and are identified by the date icon. For example, the Date dimension from the UN data source, which we will work with in the exercises, is shown on the slide.

### 4. Date hierarchy

00:38 - 00:49

![[Pasted image 20240427141714.png]]

Tableau provides a robust built-in date hierarchy for any date field. You can drill down from year, to quarter, to month, to day.

### 5. Business question

00:49 - 01:17
![[Pasted image 20240427141722.png]]

The question the World Health Organization wants to answer is the following: Is there seasonality to the number of births in Chile? If yes, during which month are the fewest babies typically born? Knowing this will help them plan how many resources should be sent over to ensure newborn care at birth throughout the year. By the end of this lesson you will be able to build a visualization that will help answer the question.

### 6. Let's practice!

01:17 - 01:25

Let's first look at how to do a similar analysis for Portugal before answering the business question.

## Video 3.4: Visualizing Dates
This time we’ve connected to a new dataset. This new data contains health statistics from the United Nations Statistics Division. Let’s first take a quick look at our data. If we click on View Data we’ll see that we have geographic data about the continent and country, the number of births and gender, and also a date variable. Combining all this we can create a visualization that gives us an idea of the evolution of births in a country over the years. If we go back to the sheet and look at the data pane you can see that the date dimension is marked with a calendar icon. To create the line chart we need to drag date to Columns and the measure Births to Rows. 

![[Pasted image 20240427144701.png]]

Let’s also filter by dragging Country to the Filters shelve and selecting Portugal. 

![[Pasted image 20240427144725.png]]
![[Pasted image 20240427144814.png]]

Notice how Tableau has automatically aggregated the data for every year. So, there is a datapoint with the total number of births for every year and they are all connected through the line chart. This visualization gives us a good idea of the evolution of Portuguese births over the years. We know that our data is much more granular than that. There’s data down to the month-level. Let’s explore how we can get down to that level of granularity. We can click on the arrow next to YEAR(Date) to make a dropdown menu appear. You’ll see that there are two sections that are responsible for time. There’s this section which has year, quarter, month, day and there’s this section which also has these values. 
![[Pasted image 20240427144937.png]]


So what’s the difference? Let’s first click on month in the first section. Now we no longer have years at the bottom but months. There's only one January, one February and so on though, while there are multiple years in our data. In our case, that doesn’t make sense since we’re interested in the evolution over time. What is happening is that Tableau considers month as a dimension, meaning a discrete value, and aggregates the number of births for every month. You can see this by the blue color. So how do we get to a timeline at the bottom? Let’s go to the dropdown menu and select the second month. Now, month is recognized as a measure, meaning a continuous value. Notice that it has turned green. This is what we wanted. We can see values for each month in each year. So pay attention when selecting the granularity level for dates. The first section makes it discrete, the second continuous. Over to you!

## Video 3.5: Reference lines, trend lines, and forecasting

00:00 - 00:06

Let's end this chapter by looking at ways to take your visualization to the next level.

### 2. Enhancing your visualization

00:06 - 00:19
![[Pasted image 20240427150011.png]]

There are a couple of things you can do in Tableau to enhance your visualization. These include adding reference lines, trend lines, and forecasting. Let's take a closer look at each of these.

### 3. Reference lines

00:19 - 00:39
![[Pasted image 20240427150019.png]]

A [[reference line]] is simply a line that gets drawn on a chart representing another measure or point of reference. Reference lines can be useful in providing context. For example, a line showing the average will visually show the difference of each mark in the chart relative to the average.

### 4. Trend lines

00:39 - 00:56
![[Pasted image 20240427150026.png]]

Trend lines are used to predict the continuation of a certain trend. As you can see in the slide, adding a [[trendline]] makes it easy to see that overall this measure is decreasing. Tableau takes a time dimension and a measure field to create a trend line.

### 5. Forecasting

00:56 - 01:15
![[Pasted image 20240427150036.png]]

[[Forecasting]] is about predicting the future value of a measure. Mathematical models capture the evolving trend or seasonality of the data and extrapolate them into the future. Once again, Tableau needs a time dimension and a measure field to create a forecast.

### 6. Business question

01:15 - 01:27
![[Pasted image 20240427150046.png]]

The question you will be answering is the following: Is the forecasted number of births in Japan during December 2019 higher than the average over the last five years?

### 7. Demo time!

01:27 - 01:35

Let's first see how to do a similar analysis for Portugal before answering the business question.

## Video 3.6: Adding reference lines, trend lines, and forecasting

Once again we are connected to the UN Health data and we're going to look at the monthly evolution of the number of births in Portugal over the past five years. 
![[Pasted image 20240427150329.png]]

Let’s start by building a line chart. We’ll do this as we've learned before. - 
- First, drag Date to Columns and Births to Rows, 
![[Pasted image 20240427150443.png]]

- then go to the dropdown menu next to YEAR(Date) and select Month in the second section to ensure that it’s interpreted as continuous. 
![[Pasted image 20240427150504.png]]

- Let’s also filter by dragging Country to the Filters shelf and selecting Portugal.
![[Pasted image 20240427150534.png]]

- Do the same for Years. We only keep the last five years and click OK. Great! 
![[Pasted image 20240427150554.png]]

Let’s take this line chart to the next level by adding a [[reference line]] indicating the average number of monthly births. To do this you need to go to the Analytics pane. Then, under Custom, you’ll see Reference Line. 
![[Pasted image 20240427150624.png]]

Drag this into the View. You’ll notice a grid with options appears. 
![[Pasted image 20240427150656.png]]

We want to apply the calculation across the entire table, the average over all months, and we want the average of the births measure. In the dialog box that opens you see that the default calculation is average so that’s perfect. Click OK. There we go. 
![[Pasted image 20240427150716.png]]

The reference line makes it really easy to compare how the number of Portuguese births compares to the average over time.

![[Pasted image 20240427150749.png]]

There are also other options to enhance this chart. Let’s first remove the reference line. You can do this by clicking the line and then, Remove. 
![[Pasted image 20240427150812.png]]

Imagine we want to know if over the past five years there was an upward or downward trend in the number of births. It’s kind of hard to see based on this visualisation. Let’s add a trend line. Once again, navigate to the Analytics pane. Under Model you’ll see Trend Line. 
![[Pasted image 20240427150847.png]]

Drag it to the view and select linear. 
![[Pasted image 20240427150904.png]]

Don’t worry about the different models. For now, we will just stick with the linear one. There we go. Now you can see that overall there seems to be a slight upward trend in the number of births. There is another cool thing that you can do in Tableau. Imagine you want to have an estimate of the number of births next year. Tableau’s built-in analytics make visualizing this really easy. Let’s first remove the trend line. In the Analytics Pane you’ll see Forecast. 
![[Pasted image 20240427150956.png]]

You can drag it to the view and drop it on the forecast box. Now you can see the forecasted number of births for 2019. Cool right? Over to you.

# Chapter 4: Presenting Your Data
![[DataCamp_Tableau_Introduction-to-Tableau_chapter4.pdf]]

## Video 4.1: Make Your Data Visually Appealing
### 1. Make your data visually appealing

00:00 - 00:22

Welcome to the final chapter of this course. My name is Carl, and I will be your instructor. You will learn how to make your graphs visually appealing and ready to show to your professor, fellow students, boss, or even your grandma! You will learn how to format your visualizations, how to create a dual axis graph, and even how to create your first dashboard!

### 2. The art of formatting

00:22 - 00:36
![[Pasted image 20240427152741.png]]

First, let's see how not to build a graph. This line chart has many issues: an unclear title, no legend, a rather small font size, and missing axes titles. Let's have a look at how we can improve it.

### 3. The art of formatting

00:36 - 01:14
![[Pasted image 20240427152750.png]]

This looks way better! First of all, we notice that one of the lines, corresponding to the global sales, was replaced by a bar chart. This was done to make it clear that this metric is slightly different than the lines representing sales by region. Secondly, the chart now has a clear title, the font size is bigger, the axes are clearly labeled, and there is a legend explaining the colors on the graph. We are looking at video game sales by release year per region. Notice 2008 was the best selling year with almost 700 million video game sales worldwide.

### 4. Formatting tips

01:14 - 01:48
![[Pasted image 20240427152758.png]]

Let's have a look at formatting tips in general. Using the following techniques, you can easily enhance your visualizations: write informative titles that explain the content of the graph, use colors and large enough fonts to increase legibility, add a legend to explain colors, adjust axes and their titles if necessary, and create tooltips so the user learns more when hovering over the graph. As a data visualization tool, Tableau has great default formatting options. It should give you a great starting spot, but you can easily adjust the formatting if necessary.

1. More information can be found in the Understanding Data Visualization and Data Visualization in Tableau courses

### 5. Format at the workbook and sheet level

01:48 - 02:27
![[Pasted image 20240427152804.png]]

You can format at both the workbook and sheet level. But what exactly is the difference between the two? A workbook is what you open at the start of an exercise. It can be used to organize, save, share, and publish results. It contains multiple sheets and can be compared to a whole Excel file. A sheet on the other hand can be compared to a single tab in Excel. They are displayed along the bottom of a workbook as tabs. There are three different types of sheets: worksheets, which is what you used this far to create visualizations, and dashboards and stories, but more on that later.

### 6. Let's practice!

02:27 - 02:33

Let's test if you understand the basics of formatting.

## Video 4.2: Applying visual best practices

00:00 - 03:27

Hello again! This dataset on video game sales from 1980 to 2010 will let us take a tour through gaming history! During this course you will answers questions like: what is the most sold video game, or which gaming genre was the most popular in the early 2000's? You could even filter for your old favorite video game to see how many other people enjoyed it! The data structure looks straightforward: You have the name of the game, the platform it was released on like the Wii, Gameboy, or Playstation. We have the year the game was released, the genre, the publisher, and finally the sales in million by region. Note sales does not refer to the sales in Dollar or Euro, but to the amount or copies of video games sold. Before we continue let's make sure we understand the term release year correctly. Pokemon Blue and Red for example was released in 1996, meaning that all sales for Pokemon Blue and Red get attributed to the year 1996. We are interested in comparing the sales across all regions. Let's start by dragging Release year to columns and global sales to rows. We see a line chart appearing of global sales over time. We can add the other regions by creating a dual axis graph. In order to create this graph we can drag any measure such as North America sales to the right until a dotted line appears and release. That's a great start but we see that our axes are not synchronized. We can fix this by clicking synchronize axes, and now the 700 on the right axis aligns with the 700 on the left axis. Let's make it very clear before we add the other regions that global sales is the sum of all the other regions sales, by making it into a bar chart using the marks card. The best way to add these other regions is by dragging measure values on top of North America sales. This field here, Measure Values, refers to all 6 measures above, so when dragging this on top of NA sales, it gets replaced by all six measures. The first line you see in red is the count of video games - sales dot csv, is a count of the amount of rows from the dataset and can be removed because it is irrelevant. We can remove it by dragging it out of the measure values card. Secondly we have global sales in here as well, which is already visible on the bar chart, so we remove this one too. We can clean up the graph by firstly renaming the worksheet to All Regions - Sales. We center the title and hide the right axis as it doesn’t add any value, by unticking Show Header. Finally we can rename the left axis title to Global Video Game Sales (in million). When hovering over the graph we see this little window pop up. That window is called the tooltip. We can improve this by having it automatically show the sales for all regions. Let's drag EU, Global, Japan, North America, and Other Sales to tooltip. There we have it - now all measures are visible! We can still format the tooltip to make it look nicer, but we will leave that to you to explore during the exercises.

## Video 4.3: Dashboards and stories

00:00 - 00:20

In the final part of this course you will get an introduction to [[dashboards]] and [[stories]]. You've built good-looking visualizations in the previous exercises, and as we build more of them, it will be really convenient to see them all on one page. By using a dashboard, a built-in Tableau feature, we can easily do that.

### 2. Dashboards

00:20 - 00:36

![[Pasted image 20240427154703.png]]

On this slide you can see a dashboard built using the Videogames dataset. It contains four visualizations about the Playstation product family, and gives insights on the sales by platform, the top video games and the top genres.

### 3. Dashboard

00:36 - 01:15

![[Pasted image 20240427154712.png]]

A dashboard is a collection of several views. It makes it easy to compare data and helps uncover key insights. The data is automatically connected to your worksheets, so if you make a change on a worksheet it will automatically be visible on your dashboard and vice versa. Dashboards are interactive: more advanced dashboards contain filters and allow users to drill down and do their own analysis. Views can be connected, allowing one view to function as an interactive filter. We will go through a live example to dig deeper in this in the next video.

### 4. Stories

01:15 - 01:42
![[Pasted image 20240427154725.png]]

Useful dashboard or worksheet insights can be bookmarked using stories. In other words, a story is a sequence of visualizations that work together to tell a story or a narrative. Since people tend to understand and remember concepts better through stories, they might be a very effective tool for your business case. Each individual visualization in a story is called a story point.

### 5. Stories

01:42 - 01:57
![[Pasted image 20240427154733.png]]

This is an example of a story in Tableau. It allows you to cycle between two story points. The first story point called Platform Comparison, enables the user to compare sales across Xbox, Playstation and Nintendo.

### 6. Stories

01:57 - 02:07
![[Pasted image 20240427154742.png]]

The second story point allows the user to deepdive into a certain product family such as Playstation, where sales by platform can be investigated.

### 7. How does everything fit together?

02:07 - 02:41
![[Pasted image 20240427154751.png]]

So how does everything fit together? Let’s make an analogy using Russian dolls. A worksheet can be placed into a dashboard as we saw in the Playstation example. The first story we saw contained two dashboards: one to compare product families and one to deepdive into platforms. A worksheet can thus be placed into a dashboard, and a dashboard can be placed into a story. Although it doesn't happen frequently, just as with Russian dolls you can also fit a worksheet straight into a story.

### 8. Let's practice!

02:41 - 02:50

It's time to see if you understand the difference between a worksheet, a dashboard, and a story. Good luck!

![[Pasted image 20240427155455.png]]

## Video 4.4: Creating dashboards and stories

00:00 - 03:23

In this lesson you will learn how to create your first dashboard and first story. We will do so by using four different visualizations about Nintendo. The first sheet contains an area chart of video games sales for Nintendo by release year. The second visualization contains info on the amount of sales per platform such as the Gameboy and Gameboy Advance. The third visualization contains a treemap with information about the genre, while the last sheet ranks the top sold video games. This is a lot of information, and it would be a lot easier to see this all in one overview, which is where dashboards come in! We click the new dashboard button (next to new worksheet) after which we get an empty sheet. Let's rename it to Nintendo. We have space for the actual dashboard in the middle, and a pane with different options on the left. The main part of this pane is the sheets sections, which shows the worksheets present in the workbook. We drag the first sheet to the canvas for it to appear. Consecutively, we drag the second sheet to the right. Notice this gray overlay, which is where the released dashboard will appear. Let's drag the other two visualizations in so they appear at the bottom. A legend and a filter appeared when we dragged in Top Video Games. This happened automatically because the legend and filter were shown on the worksheet. Let’s place the filter at the top. On the right side of the legend is a more options arrow to reveal a dropdown menu with different options. In this case we select floating, after which the legend can be moved around freely. If we type in Pokemon in the name filter, the whole dashboard adapts. We see that the sales on the Wii dropped dramatically and that the best selling pokemon game is Pokemon Red and Blue. This interactive element is where the power of dashboards come in, and it can become even more powerful by using visualizations as filters. Let’s remove Pokemon again. Navigate to the tree map and select "Use as filter" by clicking this funnel icon. If we now click on for example the Simulation genre, we notice that Nintendogs is the most sold video game within this genre. If we click on the simulation genre again, the filter gets removed. A similar dashboard for Playstation and Xbox has already been setup, so let's combine the three to create our first story. We click the new story icon and rename the story to "Competitor Analysis 1994 - 2010". We could drag a sheet to the story, but double-clicking will also add it. Let's rename the tabs to Playstation, Xbox, and Nintendo. There we have it - we just built an interactive dashboard and combined them with 2 other dashboards to create our first story! At the end of this chapter you will be able to create a very similar story. Don't worry if it looks overwhelming, you won't have to build everything from scratch and we'll guide you along the way! Have fun!