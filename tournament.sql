CREATE SCHEMA IF NOT EXISTS vct;
USE vct;

SET SQL_SAFE_UPDATES = 0;	

-- tournament
CREATE TABLE tournament (
    tournament_id VARCHAR(7) PRIMARY KEY,
    tournament_name VARCHAR(50),
    prize_pool DECIMAL(12,2),
    tournament_type VARCHAR(50),
    start_date DATE,
    end_date DATE
);

-- tournament_location
CREATE TABLE tournament_location (
    tournament_id VARCHAR(7) NOT NULL,
    country VARCHAR(50),
    city VARCHAR(50),
    venue VARCHAR(100),

    FOREIGN KEY (tournament_id) REFERENCES tournament(tournament_id)
);

-- tournament_id must follow the format: year, type, number (ex. ‘2021_M1’ = ‘Masters Reykjavik 2021’).
-- INSERT SAMPLE DATA (2021)
INSERT INTO tournament (tournament_id, tournament_name, prize_pool, tournament_type, start_date, end_date)
VALUES
('2021_M1', 'Masters Reykjavík 2021', 600000.00, 'Masters', '2021-05-24', '2021-05-31'),
('2021_M2', 'Masters Berlin 2021', 700000.00, 'Masters', '2021-09-10', '2021-09-20'),
('2021_C1', 'Valorant Champions 2021', 1000000.00, 'Champions', '2021-12-01', '2021-12-12'),

-- 2022
('2022_M1', 'Masters Reykjavík 2022', 650000.00, 'Masters', '2022-04-10', '2022-04-24'),
('2022_M2', 'Masters Copenhagen 2022', 650000.00, 'Masters', '2022-07-10', '2022-07-24'),
('2022_C1', 'Valorant Champions 2022', 1000000.00, 'Champions', '2022-08-31', '2022-09-19'),

-- 2023
('2023_M1', 'Masters Tokyo 2023', 1000000.00, 'Masters', '2023-06-11', '2023-06-25'),
('2023_C1', 'Valorant Champions 2023', 1000000.00, 'Champions', '2023-08-07', '2023-08-27'),

-- 2024
('2024_M1', 'Masters Madrid 2024', 500000.00, 'Masters', '2024-03-14', '2024-03-24'),
('2024_M2', 'Masters Shanghai 2024', 1000000.00, 'Masters', '2024-05-23', '2024-06-10'),
('2024_C1', 'Valorant Champions 2024', 2250000.00, 'Champions', '2024-08-01', '2024-08-25'),

-- 2025
('2025_M1', 'Masters Bangkok 2025', 500000.00, 'Masters', '2025-02-20', '2025-03-03'),
('2025_M2', 'Masters Toronto 2025', 1000000.00, 'Masters', '2025-06-08', '2025-06-22'),
('2025_C1', 'Valorant Champions 2025', 2250000.00, 'Champions', '2025-09-12', '2025-10-06');


INSERT INTO tournament_location (tournament_id, country, city, venue)
VALUES
-- 2021
('2021_M1', 'Iceland', 'Reykjavik', 'Laugardalshöll'),
('2021_M2', 'Germany', 'Berlin', 'Verti Music Hall'),
('2021_C1', 'Germany', 'Berlin', 'Marlene-Dietrich-Halle'),
('2021_C1', 'Germany', 'Berlin', 'Verti Music Hall'),

-- 2022
('2022_M1', 'Iceland', 'Reykjavik', 'Laugardalshöll'),
('2022_M2', 'Denmark', 'Copenhagen', 'Forum Copenhagen'),
('2022_C1', 'Turkey', 'Istanbul', 'Volkswagen Arena'),

-- 2023
('2023_M1', 'Japan', 'Tokyo', 'TIPSTAR DOME CHIBA'),
('2023_M1', 'Japan', 'Tokyo', 'Makuhari Messe'),
('2023_C1', 'United States', 'Los Angeles', 'Shrine Expo Hall'),
('2023_C1', 'United States', 'Los Angeles', 'Kia Forum'),

-- 2024
('2024_M1', 'Spain', 'Madrid', 'Madrid Arena'),
('2024_M2', 'China', 'Shanghai', 'VCT CN Arena'),
('2024_M2', 'China', 'Shanghai', 'Mercedes-Benz Arena'),
('2024_C1', 'South Korea', 'Seoul', 'COEX Artium'),
('2024_C1', 'South Korea', 'Incheon', 'INSPIRE Arena'),

-- 2025
('2025_M1', 'Thailand', 'Bangkok', 'UOB Live'),	
('2025_M2', 'Canada', 'Toronto', 'Enercare Arena'),
('2025_C1', 'France', 'Paris', 'Accor Arena'),
('2025_C1', 'France', 'Évry-Courcouronnes', 'Les Arènes');

SELECT * FROM tournament;
SELECT * FROM tournament_location;






