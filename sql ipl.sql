create database ipl2;
use ipl2;
show tables;
select * from `ipl dataset`;
drop table `ipl dataset`;
select * from ipl;


## i) General Analysis of IPL Matches 
## 1.list of table
select distinct(season) from ipl;

## 2. First ball of IPL history
select * from ipl
limit 1;

select * from ipl
where season = 2008
order by start_date
limit 1;

## 3. Season Wise IPL Matches

select season ,count(distinct (match_id)) as matches_played from ipl
group by season;

## 4. Most IPL Matches played in a Venue

select * from ipl;
select venue, count(distinct (match_id)) as matches_played from ipl
group by (venue)
order by matches_played desc;

select venue, count(distinct (match_id)) as matches_played from ipl
group by (venue)
order by matches_played desc
limit 1;

### 5. IPL Matches Played by Each Team
select * from ipl;
select batting_team as team , count(distinct match_id) as match_played from ipl
group by batting_team;


## ii) IPL Batting Analysis
### 6. Most Run Scored by IPL Teams
select batting_team , sum(run) as total_run from ipl
group by batting_team
order by total_run desc; 

### 7. Most IPL Runs by a Batsman
select striker, sum(runs_off_bat) as run from ipl
group by striker
order by run desc;

## 8. Avg Run by Teams in Powerplay
select * from ipl;

## 9. Most IPL Century by a Player
select * from ipl;
select striker, sum(runs_off_bat) as runs from ipl
group by start_date,striker
having runs>=100
order by runs desc;

select striker, count(runs) as centuries from 
(select striker, sum(runs_off_bat) as runs from ipl
group by start_date,striker
having runs>=100
order by runs desc) as subquery
group by striker
order by centuries desc;

## 10. Most IPL Fifty by Player
select striker, count(runs) as half_centuries from 
(select striker, sum(runs_off_bat) as runs from ipl
group by start_date,striker
having runs>=50
order by runs desc) as subquery
group by striker
order by half_centuries desc;


## 11.  Orange Cap Holder Each Season


select season,bowler, count(bowler) as wickets from ipl
where wicket_type in ("bowled","caught","caught and bowled","hit wicket","lbw","stumped")
group by season,bowler; 

select season, bowler, max(wickets) from (select season,bowler, count(bowler) as wickets from ipl
where wicket_type in ("bowled","caught","caught and bowled","hit wicket","lbw","stumped")
group by season,bowler) as subquery
group by season;

select * from ipl;
## 12. Most Sixes in an IPL Inning
select striker, count(season) as sixes from ipl
where runs_off_bat = 6
group by start_date, striker
order by sixes desc;

## 13. 1.Most Boundary (4s) hit by a Batsman in one inning
select striker, count(season) as fours from ipl
where runs_off_bat = 4
group by start_date, striker
order by fours desc;

## 13. 2.Most Boundary (4s) hit by a Batsman
select * from ipl;
select striker, count(striker) as total_fours from ipl
where runs_off_bat = 4
group by striker
order by total_fours desc;

## 14. Most runs in an IPL season by Player
select * from ipl;
select season, striker, sum(run) as runs from ipl
group by season,striker
order by runs desc;



## 15. 1.No. of Sixes in IPL Seasons
select * from ipl;
select season, count(season) as sixes from ipl
where runs_off_bat = 6
group by season;

## 15. 2.No. of Sixes in IPL Seasons by players
select * from ipl;
select striker, count(striker) as sixes from ipl
where runs_off_bat = 6
group by striker
order by sixes desc;

## 16. Highest Total by IPL Teams
select * from ipl;
select batting_team, sum(run) as runs from ipl
group by start_date,batting_team
order by runs desc;

## 17. Most IPL Sixes Hit by a batsman
select striker, count(striker) as sixes from ipl
where runs_off_bat = 6
group by striker
order by sixes desc;

## 18. Highest Individual IPL Score
select * from ipl;
select striker, sum(runs_off_bat) as runs from ipl
group by start_date, striker
order by runs desc;

## iii) Bowling Statistics
## 19. Most run conceded by a bowler in an inning
select * from ipl;
select bowler, sum(run) as runs from ipl
group by start_date, bowler
order by runs desc;


## 20. Purple Cap Holders
select * from ipl;
select season,bowler, count(wicket_type) from ipl
where wicket_type in ("bowled","caught","caught and bowled","hit wicket","lbw","stumped")
group by season,bowler;

## 21. Most IPL Wickets by a Bowler
select * from ipl;
select bowler, count(wicket_type) as outs from ipl
where wicket_type in ("bowled","caught","caught and bowled","hit wicket","lbw","stumped")
group by bowler
order by outs desc;

## 22. Most Dot Ball by a Bowler
select * from ipl;
select bowler, count(run) as dots from ipl
where run=0
group by bowler
order by dots desc; 

## 23. Most Maiden over by a Bowler
select * from ipl;


## 24. Most Wickets by an IPL Team
select bowling_team, count(wicket_type) as outs from ipl
where wicket_type in ("bowled","caught","caught and bowled","hit wicket","lbw","stumped","run out")
group by bowling_team
order by outs desc;

## 25. Most No Balls by an IPL team
select * from ipl;
select bowling_team, count(noballs) as noballs from ipl
where noballs = 1
group by bowling_team
order by noballs desc;

## 26. Most No Balls by an IPL Bowler
select bowler, count(noballs) as noballs from ipl
where noballs = 1
group by bowler
order by noballs desc;

## 27. Most run given by a team in Extras
select bowling_team, sum(extras) as extras from ipl
group by bowling_team
order by extras desc;

select batting_team, sum(extras) as extras from ipl
group by batting_team
order by extras desc;

## 28. Most Wides Conceded by an IPL team
select * from ipl;
select batting_team, sum(wides) as wides from ipl
group by batting_team
order by wides desc;