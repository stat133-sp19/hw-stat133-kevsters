#' @Title: Make-Shots-Charts-Script
#' @Description: Creating shot charts for various players on the Warriors
#' @Input: The csv in the data folder
#' @Output: various plots (shot charts)

library(ggplot2)
library(jpeg)
library(grid)


court_file = "images/nba-court.jpg"


court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

curry_shot_chart
ggsave("images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5, units = "in")

iggy_shot_chart <- ggplot(data = iggy) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

iggy_shot_chart
ggsave("images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5, units = "in")

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

durant_shot_chart
ggsave("images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5, units = "in")


klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

klay_shot_chart
ggsave("images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5, units = "in")



dray_shot_chart <- ggplot(data = dray) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

dray_shot_chart
ggsave("images/draymond-green-shot-chart.pdf", width = 6.5, height = 5, units = "in")


player_name_faceted = ggplot(data = stacked) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal() +
  facet_wrap(~ player_name)

player_name_faceted
ggsave("images/gsw-shot-charts.png", width = 8, height = 7, units = "in")

