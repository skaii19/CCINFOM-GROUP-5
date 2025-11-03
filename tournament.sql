CREATE SCHEMA IF NOT EXISTS vct;
USE vct;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Tournament (
	tournament_id VARCHAR(7) PRIMARY KEY,
	tournament_name VARCHAR(50),
    prize_pool DECIMAL(12,2),
    tournament_type VARCHAR(50),
	start_date DATE,
    end_date DATE,
	country VARCHAR(50),
	venue VARCHAR(50)
);

-- tournament_id must follow the format: year, type, number (ex. ‘2021_M1’ = ‘Masters Reykjavik 2021’).
-- INSERT SAMPLE DATA (2021)
INSERT INTO Tournament (tournament_id, tournament_name, prize_pool, tournament_type, start_date, end_date, country, venue)
VALUES
('2021_M1', 'Masters Reykjavík 2021', 600000.00, 'Masters', '2021-05-24', '2021-05-31', 'Iceland', 'Reykjavik'),
('2021_M2', 'Masters Berlin 2021', 700000.00, 'Masters', '2021-09-10', '2021-09-20', 'Germany', 'Berlin'),
('2021_C1', 'Valorant Champions 2021', 1000000.00, 'Champions', '2021-12-01', '2021-12-12', 'Germany', 'Berlin'),

-- 2022
('2022_M1', 'Masters Reykjavík 2022', 650000.00, 'Masters', '2022-04-10', '2022-04-24', 'Iceland', 'Reykjavik'),
('2022_M2', 'Masters Copenhagen 2022', 650000.00, 'Masters', '2022-07-10', '2022-07-24', 'Denmark', 'Copenhagen'),
('2022_C1', 'Valorant Champions 2022', 1000000.00, 'Champions', '2022-08-31', '2022-09-19', 'Turkey', 'Istanbul'),

-- 2023
('2023_M1', 'Masters Tokyo 2023', 1000000.00, 'Masters', '2023-06-11', '2023-06-25', 'Japan', 'Tokyo'),
('2023_C1', 'Valorant Champions 2023', 1000000.00, 'Champions', '2023-08-07', '2023-08-27', 'United States', 'Los Angeles'),

-- 2024
('2024_M1', 'Masters Madrid 2024', 500000.00, 'Masters', '2024-03-14', '2024-03-24', 'Spain', 'Madrid'),
('2024_M2', 'Masters Shanghai 2024', 1000000.00, 'Masters', '2024-05-23', '2024-06-10', 'China', 'VCT CN Arena'),
('2024_C1', 'Valorant Champions 2024', 2250000.00, 'Champions', '2024-08-01', '2024-08-25', 'South Korea', 'INSPIRE Arena, Incheon'),

-- 2025
('2025_M1', 'Masters Bangkok 2025', 500000.00, 'Masters', '2025-02-20', '2025-03-03', 'Thailand', 'UOB Live, Bangkok'),
('2025_M2', 'Masters Toronto 2025', 1000000.00, 'Masters', '2025-06-08', '2025-06-22', 'Canada', 'Enercare Arena, Toronto'),
('2025_C1', 'Valorant Champions 2025', 2250000.00, 'Champions', '2025-09-12', '2025-10-06', 'France', 'Accor Arena, Paris');

SELECT * FROM tournament;


