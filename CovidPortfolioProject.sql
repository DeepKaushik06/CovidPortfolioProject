select location, date, total_cases, new_cases, total_deaths, population
from covidDeaths
order by 1,2;



-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as Death_Percentage
From covidDeaths
Where Location like'%states%'
Rrder by 1,2;


-- Looking at Total Cases Vs Population
-- Shows what percentage of population gotten covid
Select Location, date, Population, total_cases, (total_deaths/population) * 100 as Death_Percentage
From covidDeaths
-- Where Location like'%states%'
Order by 1,2;


-- Looking at nations with highest infection rate compared to population
Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((Total_cases/population))*100 as PercentPopulationInfected
From covidDeaths
Group By Location,Population
Order by PercentPopulationInfected DESC;

-- Showing nations with the highest death count per population
Select Location, MAX(Total_deaths) as TotalDeathCount
from covidDeaths
where continent != ''
Group By Location
Order by TotalDeathCount DESC;

-- Lets break things down by continent
Select continent, MAX(Total_deaths) as TotalDeathCount
From covidDeaths
Where continent != ''
Group By continent
Order by TotalDeathCount DESC;

-- Global Numbers
Select date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
From covidDeaths
Where continent != ''
Group by date
order by 1,2;


-- Looking at Total Population vs Vaccinations

With PopvsVac (Continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations, 
SUM(cv.new_vaccinations) OVER (Partition by cd.location Order by cd.location, cd.date) as RollingPeopleVaccinated
From covidDeaths cd
Join covidVaccinations cv
	On cd.location = cv.location
	And cd.date = cv.date
Where cd.continent != ''
-- order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac;

-- Temp Table
CREATE TEMPORARY TABLE PercentPopulationVaccinated
(
    Continent varchar(255),
    Location varchar(255),
    Date datetime,
    Population numeric,
    New_vaccinations numeric,
    RollingPeopleVaccinated numeric
);

Insert into PercentPopulationVaccinated
Select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations, 
SUM(cv.new_vaccinations) OVER (Partition by cd.location Order by cd.location, cd.date) as RollingPeopleVaccinated
From covidDeaths cd
Join covidVaccinations cv
	On cd.location = cv.location
	And cd.date = cv.date
Where cd.continent != '';
-- order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From PercentPopulationVaccinated;


-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations, 
SUM(cv.new_vaccinations) OVER (Partition by cd.location Order by cd.location, cd.date) as RollingPeopleVaccinated
From covidDeaths cd
Join covidVaccinations cv
	On cd.location = cv.location
	And cd.date = cv.date
Where cd.continent != '';
-- order by 2,3














