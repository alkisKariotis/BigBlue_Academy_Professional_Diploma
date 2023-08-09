--Part 3 Exercises 



--1.a. Find all allstar MVP players.
select
	players.full_name
from
	allstar_mvps
inner join players on
	players.id = allstar_mvps.id


--b. Find all players born in New York.
select
	full_name,
	birth_place
from
	players
where
	birth_place like '%New York%';

--c. Which players born in New York hold a MVP title?
select
	players.full_name,
	birth_place
from
	players
inner join allstar_mvps on
	allstar_mvps.id = players.id
where
	birth_place like '%New York%';


--2.Which players have the same height?
select
	count(distinct full_name),
	players.height
from
	players
group by
	height
order by
	count desc


select
	players.full_name ,
	players2.full_name,
	players.height
from
	players
inner join players as players2 on --players2.id = players.id 
	players.height = players2.height
	and players.id <> players2.id;


--3.List the top 10 of the players having the most Player of the Month Awards.
select
	players.full_name ,
	count(award_type)
from
	monthly_player_awards
inner join players on
	players.id = monthly_player_awards.player_id
where
	award_type = 'Player of the Month'
group by
	players.full_name
order by
	count(award_type) desc
limit 10;

--4.Using table teams, create a new column that writes the messages "More than 2000 wins", "2000 wins" or "Less than 2000 wins" depending the number of wins it has, and also print the name and the number of wins for each team.
select
	team_name,
	total_wins,
	case
		when total_wins>2000 then 'More than 2000 wins'
		when total_wins = 2000 then '2000 wins'
		when total_wins<2000 then 'Less than 2000 wins'
	end number_of_wins
from
	teams
order by
	number_of_wins asc;

	--case total_wins
	--	when >2000 then 'More than 2000 wins'
	--	when = 2000 then '2000 wins'
	--	when <2000 then 'Less than 2000 wins'
--	end number_of_wins
	
--5a.  Create a view with the team id, team name and number of championships.
create or replace
view team2 as
select
	team_id,
	team_name,
	champions as number_of_championships
from
	teams;

--drop view team2; 

--5b.b. Print from the view all the teams from Miami or Milwaukee that have a championship.
select
	team_name,
	number_of_championships
from
	team2
where
	number_of_championships >= 1
	and (team_name like '%Miami%'
		or team_name like '%Milwaukee%')

--Update view with total wins and total loses.
--update team2  total_looses;
create or replace
view team2 as
select
	team_id,
	team_name,
	champions as number_of_championships,
	total_wins,
	total_losses
from
	teams;

--drop view team2; 

-- apla ksanadimiourgw create or replace view 

--Find all players that have both awards and other awards and print the name of the award as well.
select
	players.full_name,
	player_awards.award,
	other_player_awards.award,
	monthly_player_awards.award_type,
	weekly_player_awards.award_type
from
	players
inner join other_player_awards on
	other_player_awards.payer_id = players.id
inner join monthly_player_awards on
	monthly_player_awards.player_id = players.id
inner join weekly_player_awards on
	weekly_player_awards.player_id = players.id
inner join player_awards on
	player_awards.player_id = players.id
where
	other_player_awards.award is not null
	and monthly_player_awards.award_type is not null
	and weekly_player_awards.award_type is not null 
	and player_awards.award is not null