#install.packages("gutenbergr")
library(gutenbergr)
library(tidyverse)

works <- gutenberg_works()

# В каждом пункте используйте оператор pipe, не сохраняйте промежуточные результаты!

# (1) Отберите ряды, в которых gutenberg_author_id равен 65 или 410;
# после этого выберите два столбца: author, title
my_data <- works |> 
  # ваш код здесь
  filter(gutenberg_author_id == 65 | gutenberg_author_id == 410) |> 
  select(author, title)

# (2) Используйте функцию separate(), чтобы разделить 
# столбец с именем и фамилией на два новых: author, name. 
# Удалите столбец name
my_data2 <- my_data |>
  separate_wider_delim(author, delim = " ", names = c("author", "name"), too_few = "align_start") |> 
  select(-name)


# (3) Используйте group_by() и summarise(), чтобы узнать,
# сколько произведений Шекспира и Марлоу хранится в библиотеке Gutenberg
# новый столбец должен называться n, не делайте сортировку 
my_data3 <- my_data2 |>
   filter(gutenberg_author_id == 65 | gutenberg_author_id == 410) |> 
  group_by(gutenberg_author_id, author) |> 
  summarise(n = n())
