--TABLE 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_Cases)*100 as DeathPercentage
From coviddata..Deaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2


--TABLE 2. 
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From coviddata..Deaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

--TABLE 3. 
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddata..Deaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc



--TABLE 4. 
Select location, population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PopulationInfected
From coviddata..Deaths
--Where location like '%states%'
Group by location, population, date
order by PopulationInfected desc
