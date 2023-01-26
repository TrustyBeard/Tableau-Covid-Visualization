--SQL Queries For Data

Select SUM(cast(new_cases as int)) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(new_cases as float))*100 as MortalityRate
From CovidDeaths
--Where location like '%states%'
where continent <> ''
--Group By date
order by 1,2


Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
Where continent <> ''
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc



Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/NULLIF(population, 0)))*100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc



Select Location, Population, date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/NULLIF(population, 0)))*100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc