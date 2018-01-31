#!/usr/bin/env wolframscript
(* ::Package:: *)

Remove["Global`*"]


SetDirectory[NotebookDirectory[]];


Run["git log"
  <> " --pretty=format:\"BEGIN%n"
  <> "  %x22commit%x22: %x22%H%x22,%n"
  <> "  %x22subject%x22: %x22%f%x22,%n"
  <> "  %x22date%x22: %x22%ai%x22,\""
  <> " --shortstat"
  <> " > git-log.log"];
Run["texlua git-log.lua"];
Run["del git-log.log"];


list = Import["git-log.json"];


dateListRaw = "date" /. list[[#]]& /@ Range[Length @ list];


dateList   = DateObject @ (#[[1]] <> " " <> #[[2]])& /@ StringSplit /@ dateListRaw;
timeList   = TimeObject @ #[[2]]& /@ StringSplit /@ dateListRaw;
commitList = {"insertions", "deletions"} /. list;


dateCount = {DateValue[#, "Hour"], DateValue[#, "ISOWeekDay"]}& /@ dateList;


DateHistogram[dateList, "Week", DateTicksFormat -> {"Year", "/", "Month"}, 
  PlotTheme -> "HeightGrid", AspectRatio -> 1/3, ImageSize -> 400, PlotLabel -> "Commits"]
DateHistogram[timeList, "Hour", DateTicksFormat -> {"Hour24Short", ":", "Minute"}, 
  PlotTheme -> "HeightGrid", AspectRatio -> 1/3, ImageSize -> 400, PlotLabel -> "Commits in the day"]


yTick = Transpose @ {Range[7], {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"}};
BubbleChart[Flatten /@ Tally[dateCount],
  AspectRatio -> 1/2.4, ImageSize -> 750, FrameTicks -> {{yTick, None}, {Range[0, 23, 2], None}},
  PlotTheme -> "HeightGrid", PlotLabel -> "Punch card"]


DateListPlot[{Transpose @ {dateList, commitList /. {x_, y_} -> x},
    Transpose @ {dateList, commitList /. {x_, y_} -> -y}},
  PlotRange -> All, Filling -> Axis, PlotTheme -> "Detailed",
  PlotStyle -> {RGBColor[0.560181, 0.691569, 0.194885], RGBColor[0.922526, 0.385626, 0.209179]},
  PlotLabel -> "Code frequency"]


dateCommitGroup   = GroupBy[Transpose @
  {DayRound[#1, Sunday, "Preceding"]& /@ dateList, commitList}, First];
dateListPerWeek   = Keys @ dateCommitGroup;
commitListPerWeek = Map[Total, Transpose /@
  (Values @ dateCommitGroup /. {x_DateObject, y_} -> y), {2}];


DateListPlot[{Transpose @ {dateListPerWeek, commitListPerWeek /. {x_, y_} -> x},
    Transpose @ {dateListPerWeek, commitListPerWeek /. {x_, y_} -> -y}},
  PlotRange -> All, Filling -> Axis, PlotTheme -> "Detailed",
  PlotStyle -> {RGBColor[0.560181, 0.691569, 0.194885], RGBColor[0.922526, 0.385626, 0.209179]},
  PlotLabel -> "Code frequency (per week)"]
