CREATE SCHEMA IF NOT EXISTS vct;
USE vct;

SET SQL_SAFE_UPDATES = 0;

-- matches
DROP TABLE IF EXISTS matches;
CREATE TABLE matches (
    match_id VARCHAR(20) PRIMARY KEY,
    tournament_id VARCHAR(7) NOT NULL, 			
    match_date DATE,
    match_time TIME,
    bracket VARCHAR(50), 
    team1_id VARCHAR(4) NOT NULL, 
    team2_id VARCHAR(4) NOT NULL,
    map_winner_team_id VARCHAR(4),
    map_played VARCHAR(20),
    score VARCHAR(5), 
    mvp_player_id INT, 							
    
    CONSTRAINT FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id),
    CONSTRAINT FOREIGN KEY (team1_id) REFERENCES team(team_id),
    CONSTRAINT FOREIGN KEY (team2_id) REFERENCES team(team_id),
    CONSTRAINT FOREIGN KEY (mvp_player_id) REFERENCES player(player_id), 	
    CONSTRAINT FOREIGN KEY (map_winner_team_id) REFERENCES team(team_id)
);

-- match_agent_picks
DROP TABLE IF EXISTS agent_pick;
CREATE TABLE agent_pick (
    match_id VARCHAR(20) NOT NULL,
    player_id INT NOT NULL, 					
    agent_name VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (match_id, player_id), 			
    CONSTRAINT FOREIGN KEY (match_id) REFERENCES matches(match_id),
    CONSTRAINT FOREIGN KEY (player_id) REFERENCES player(player_id) 
);

INSERT INTO matches (match_id, tournament_id, match_date, match_time, bracket, team1_id, team2_id, map_winner_team_id, map_played, score, mvp_player_id)
VALUES	
		-- ==================================================
		--    TOURNAMENT: Masters Reykjavík 2021 (2021_M1) 
		-- ==================================================
		-- Upper Round 1 --
		-- FNC vs KRÜ
        ('MR21-UR1-01', '2021_M1', '2021-05-24', '23:00:00', 'Upper Round 1', 'FNC', 'KRÜ', 'FNC', 'Haven', '13-5', '20'),
        ('MR21-UR1-02', '2021_M1', '2021-05-25', '00:15:00', 'Upper Round 1', 'FNC', 'KRÜ', 'FNC', 'Icebox', '13-4', '20'),
        -- V1 vs CR
		('MR21-UR1-03', '2021_M1', '2021-05-25', '01:25:00', 'Upper Round 1', 'V1', 'CR', 'V1', 'Ascent', '13-11', '9'),
        ('MR21-UR1-04', '2021_M1', '2021-05-25', '02:45:00', 'Upper Round 1', 'V1', 'CR', 'V1', 'Icebox', '13-10', '6'),
        
		-- Upper QuarterFinals --
        -- SHK vs NU
		('MR21-UQF-01', '2021_M1', '2021-05-25', '04:45:00', 'Upper Quarterfinals', 'SHK', 'NU', 'SHK', 'Haven', '13-5', '35'),
		('MR21-UQF-02', '2021_M1', '2021-05-25', '05:55:00', 'Upper Quarterfinals', 'SHK', 'NU', 'NU', 'Bind', '5-13', '26'),
        ('MR21-UQF-03', '2021_M1', '2021-05-25', '06:45:00', 'Upper Quarterfinals', 'SHK', 'NU', 'NU', 'Ascent', '5-13', '27'),     
        -- VKS1 vs X10
		('MR21-UQF-04', '2021_M1', '2021-05-25', '23:00:00', 'Upper Quarterfinals', 'VKS1', 'X10', 'VKS1', 'Icebox', '13-11', '22'),
        ('MR21-UQF-05', '2021_M1', '2021-05-26', '00:30:00', 'Upper Quarterfinals', 'VKS1', 'X10', 'VKS1', 'Ascent', '14-12', '22'),        
        -- TL vs V1        
		('MR21-UQF-06', '2021_M1', '2021-05-26', '02:05:00', 'Upper Quarterfinals', 'TL', 'V1', 'TL', 'Split', '16-14', '11'),
        ('MR21-UQF-07', '2021_M1', '2021-05-26', '03:40:00', 'Upper Quarterfinals', 'TL', 'V1', 'V1', 'Ascent', '11-13', '6'),
        ('MR21-UQF-08', '2021_M1', '2021-05-26', '05:00:00', 'Upper Quarterfinals', 'TL', 'V1', 'V1', 'Haven', '4-13', '9'),	
        -- SEN vs FNC
        ('MR21-UQF-09', '2021_M1', '2021-05-26', '06:05:00', 'Upper Quarterfinals', 'SEN', 'FNC', 'SEN', 'Icebox', '13-11', '1'),
        ('MR21-UQF-10', '2021_M1', '2021-05-26', '07:25:00', 'Upper Quarterfinals', 'SEN', 'FNC', 'SEN', 'Haven', '13-10', '3'),
        
        -- Lower Round 1 --
        -- X10 vs CR
		('MR21-LR1-01', '2021_M1', '2021-05-26', '23:00:00', 'Lower Round 1', 'X10', 'CR', 'X10', 'Haven', '13-9', '47'),
		('MR21-LR1-02', '2021_M1', '2021-05-27', '00:15:00', 'Lower Round 1', 'X10', 'CR', 'X10', 'Icebox', '13-5', '50'),        
        -- SHK vs KRÜ
		('MR21-LR1-03', '2021_M1', '2021-05-27', '01:20:00', 'Lower Round 1', 'SHK', 'KRÜ', 'KRÜ', 'Icebox', '5-13', '37'),
		('MR21-LR1-04', '2021_M1', '2021-05-27', '02:35:00', 'Lower Round 1', 'SHK', 'KRÜ', 'KRÜ', 'Bind', '6-13', '40'),
		
		-- Upper SemiFinals --
        -- SEN vs VKS1
        ('MR21-USF-01', '2021_M1', '2021-05-27', '03:30:00', 'Upper SemiFinals', 'SEN', 'VKS1', 'SEN', 'Icebox', '13-7', '1'),
        ('MR21-USF-02', '2021_M1', '2021-05-27', '04:30:00', 'Upper SemiFinals', 'SEN', 'VKS1', 'SEN', 'Haven', '13-6', '3'),        
        -- V1 vs NU
        ('MR21-USF-03', '2021_M1', '2021-05-27', '23:00:00', 'Upper SemiFinals', 'V1', 'NU', 'V1', 'Haven', '13-3', '6'),
        ('MR21-USF-04', '2021_M1', '2021-05-27', '23:50:00', 'Upper SemiFinals', 'V1', 'NU', 'NU', 'Ascent', '13-15', '30'),
        ('MR21-USF-05', '2021_M1', '2021-05-28', '01:15:00', 'Upper SemiFinals', 'V1', 'NU', 'NU', 'Split', '12-14', '27'),
        
        -- Lower Round 2 --
        -- FNC vs X10
		('MR21-LR2-01', '2021_M1', '2021-05-28', '02:40:00', 'Lower Round 2', 'FNC', 'X10', 'FNC', 'Icebox', '13-4', '18'),
		('MR21-LR2-02', '2021_M1', '2021-05-28', '03:30:00', 'Lower Round 2', 'FNC', 'X10', 'FNC', 'Haven', '13-9', '17'),        
        -- TL vs KRÜ
		('MR21-LR2-03', '2021_M1', '2021-05-28', '04:45:00', 'Lower Round 2', 'TL', 'KRÜ', 'TL', 'Split', '13-2', '11'),
		('MR21-LR2-04', '2021_M1', '2021-05-28', '05:25:00', 'Lower Round 2', 'TL', 'KRÜ', 'TL', 'Ascent', '13-9', '11'),
        
        -- Lower Round 3 --
        -- V1 vs FNC
		('MR21-LR3-01', '2021_M1', '2021-05-28', '23:00:00', 'Lower Round 3', 'V1', 'FNC', 'FNC', 'Icebox', '12-14', '20'),
		('MR21-LR3-02', '2021_M1', '2021-05-29', '00:20:00', 'Lower Round 3', 'V1', 'FNC', 'FNC', 'Ascent', '6-13', '20'),        
        -- VKS1 vs TL
		('MR21-LR3-03', '2021_M1', '2021-05-29', '01:25:00', 'Lower Round 3', 'VKS1', 'TL', 'TL', 'Ascent', '8-13', '15'),
		('MR21-LR3-04', '2021_M1', '2021-05-29', '02:25:00', 'Lower Round 3', 'VKS1', 'TL', 'TL', 'Haven', '5-13', '15'),
        
        -- Upper Final --
        -- SEN vs NU
		('MR21-UF-01', '2021_M1', '2021-05-29', '03:30:00', 'Upper Final', 'SEN', 'NU', 'SEN', 'Bind', '13-5', '2'),
		('MR21-UF-02', '2021_M1', '2021-05-29', '04:30:00', 'Upper Final', 'SEN', 'NU', 'SEN', 'Haven', '13-4', '3'),
        
        -- Lower Round 4 --
        -- FNC vs TL
		('MR21-LR4-01', '2021_M1', '2021-05-30', '01:00:00', 'Lower Round 4', 'FNC', 'TL', 'FNC', 'Bind', '13-10', '17'),
		('MR21-LR4-02', '2021_M1', '2021-05-30', '02:15:00', 'Lower Round 4', 'FNC', 'TL', 'FNC', 'Ascent', '13-10', '19'),
        
        -- Lower Final --
        -- NU vs FNC
		('MR21-LF-01', '2021_M1', '2021-05-30', '03:30:00', 'Lower Final', 'NU', 'FNC', 'FNC', 'Bind', '8-13', '17'),
		('MR21-LF-02', '2021_M1', '2021-05-30', '04:25:00', 'Lower Final', 'NU', 'FNC', 'NU', 'Ascent', '13-8', '28'),
		('MR21-LF-03', '2021_M1', '2021-05-30', '05:15:00', 'Lower Final', 'NU', 'FNC', 'NU', 'Haven', '8-13', '20'),
        
        -- Grand Final --
        -- SEN vs FNC
		('MR21-GF-01', '2021_M1', '2021-05-31', '01:00:00', 'Grand Final', 'SEN', 'FNC', 'SEN', 'Split', '14-12', '3'),
		('MR21-GF-02', '2021_M1', '2021-05-31', '02:35:00', 'Grand Final', 'SEN', 'FNC', 'SEN', 'Bind', '16-14', '3'),
		('MR21-GF-03', '2021_M1', '2021-05-31', '03:50:00', 'Grand Final', 'SEN', 'FNC', 'SEN', 'Haven', '13-11', '3');
        
        
INSERT INTO agent_pick (match_id, player_id, agent_name)
VALUES	
		-- ==================================================
		--    TOURNAMENT: Masters Reykjavík 2021 (2021_M1) 
		-- ==================================================
		-- Upper Round 1 --
		-- FNC vs KRÜ
        -- Match 1
        -- FNATIC (FNC)
        ('MR21-UR1-01', '16', 'Astra'),		-- Boaster
        ('MR21-UR1-01', '17', 'Sage'),		-- doma
        ('MR21-UR1-01', '18', 'Skye'),		-- Mistic
        ('MR21-UR1-01', '19', 'Killjoy'),	-- MAGNUM
        ('MR21-UR1-01', '20', 'Jett'),		-- Derke
        -- KRÜ Esports (KRÜ)
		('MR21-UR1-01', '36', 'Sage'),		-- NagZ
        ('MR21-UR1-01', '37', 'Skye'),		-- bnj
        ('MR21-UR1-01', '38', 'Astra'),		-- delz1k
        ('MR21-UR1-01', '39', 'Killjoy'),	-- Klaus
        ('MR21-UR1-01', '40', 'Viper'),		-- Mazino
        
        -- Match 2
        -- FNATIC (FNC)
        ('MR21-UR1-02', '16', 'Sova'),		-- Boaster
        ('MR21-UR1-02', '17', 'Sage'),		-- doma
        ('MR21-UR1-02', '18', 'Viper'),		-- Mistic
        ('MR21-UR1-02', '19', 'Killjoy'),	-- MAGNUM
        ('MR21-UR1-02', '20', 'Jett'),		-- Derke
        -- KRÜ Esports (KRÜ)
		('MR21-UR1-02', '36', 'Jett'),		-- NagZ
        ('MR21-UR1-02', '37', 'Sova'),		-- bnj
        ('MR21-UR1-02', '38', 'Sage'),		-- delz1k
        ('MR21-UR1-02', '39', 'Killjoy'),	-- Klaus
        ('MR21-UR1-02', '40', 'Viper'),		-- Mazino

		-- V1 vs CR
        -- Match 3
        -- Version1 (V1)
		('MR21-UR1-03', '6', 'Jett'),		-- penny
        ('MR21-UR1-03', '7', 'Killjoy'),	-- jammyz
        ('MR21-UR1-03', '8', 'Sova'),		-- effys
        ('MR21-UR1-03', '9', 'Phoenix'),	-- Zellsis
        ('MR21-UR1-03', '10', 'Astra'),		-- vanity
        -- Crazy Raccoon (CR)
        ('MR21-UR1-03', '41', 'Raze'),		-- Munchkin
        ('MR21-UR1-03', '42', 'Jett'),		-- zepher
        ('MR21-UR1-03', '43', 'Astra'),		-- rion
        ('MR21-UR1-03', '44', 'Sova'),		-- Medusa
        ('MR21-UR1-03', '45', 'Killjoy'),	-- neth
                
        -- Match 4
        -- Version1 (V1)
		('MR21-UR1-04', '6', 'Jett'),		-- penny
        ('MR21-UR1-04', '7', 'Viper'),		-- jammyz
        ('MR21-UR1-04', '8', 'Sova'),		-- effys
        ('MR21-UR1-04', '9', 'Phoenix'),	-- Zellsis
        ('MR21-UR1-04', '10', 'Omen'),		-- vanity
        -- Crazy Raccoon (CR)
        ('MR21-UR1-04', '41', 'Raze'),		-- Munchkin
        ('MR21-UR1-04', '42', 'Jett'),		-- zepher
        ('MR21-UR1-04', '43', 'Omen'),		-- rion
        ('MR21-UR1-04', '44', 'Sova'),		-- Medusa
        ('MR21-UR1-04', '45', 'Killjoy'),	-- neth
        
        -- Upper QuarterFinals --
		-- SHK vs NU
        -- Match 1
        -- Sharks Esports (SHK)
        ('MR21-UQF-01', '31', 'Killjoy'),	-- fra
        ('MR21-UQF-01', '32', 'Omen'),		-- light
        ('MR21-UQF-01', '33', 'Raze'),		-- prozin
        ('MR21-UQF-01', '34', 'Sova'),		-- deNaro
        ('MR21-UQF-01', '35', 'Sage'),		-- gaabxx
        -- NUTURN (NU)
        ('MR21-UQF-01', '26', 'Astra'),		-- peri
        ('MR21-UQF-01', '27', 'Sova'),		-- Lakia
        ('MR21-UQF-01', '28', 'Jett'),		-- allow
        ('MR21-UQF-01', '29', 'Raze'),		-- Suggest
        ('MR21-UQF-01', '30', 'Breach'),	-- solo
        
        -- Match 2
        -- Sharks Esports (SHK)
        ('MR21-UQF-02', '31', 'Skye'),		-- fra
        ('MR21-UQF-02', '32', 'Brimstone'),	-- light
        ('MR21-UQF-02', '33', 'Raze'),		-- prozin
        ('MR21-UQF-02', '34', 'Sova'),		-- deNaro
        ('MR21-UQF-02', '35', 'Viper'),		-- gaabxx
        -- NUTURN (NU)
        ('MR21-UQF-02', '26', 'Omen'),		-- peri
        ('MR21-UQF-02', '27', 'Sova'),		-- Lakia
        ('MR21-UQF-02', '28', 'Jett'),		-- allow
        ('MR21-UQF-02', '29', 'Raze'),		-- Suggest
        ('MR21-UQF-02', '30', 'Breach'),	-- solo
        
        -- Match 3
        -- Sharks Esports (SHK)
        ('MR21-UQF-03', '31', 'Killjoy'),	-- fra
        ('MR21-UQF-03', '32', 'Omen'),		-- light
        ('MR21-UQF-03', '33', 'Phoenix'),	-- prozin
        ('MR21-UQF-03', '34', 'Sova'),		-- deNaro
        ('MR21-UQF-03', '35', 'Raze'),		-- gaabxx
        -- NUTURN (NU)
        ('MR21-UQF-03', '26', 'Astra'),		-- peri
        ('MR21-UQF-03', '27', 'Sova'),		-- Lakia
        ('MR21-UQF-03', '28', 'Jett'),		-- allow
        ('MR21-UQF-03', '29', 'Skye'),		-- Suggest
        ('MR21-UQF-03', '30', 'Killjoy'),	-- solo
        
        -- VKS1 vs X10
        -- Match 4
        -- Team Vikings (VKS1)
        ('MR21-UQF-04', '21', 'Jett'),		-- frz
        ('MR21-UQF-04', '22', 'Sova'),		-- Sacy
        ('MR21-UQF-04', '23', 'Killjoy'),	-- saadhak
        ('MR21-UQF-04', '24', 'Raze'),		-- gtn
        ('MR21-UQF-04', '25', 'Omen'),		-- sutecas
        -- X10 Esports (X10)
        ('MR21-UQF-04', '46', 'Sova'),		-- foxz
        ('MR21-UQF-04', '47', 'Jett'),		-- Patiphan
        ('MR21-UQF-04', '48', 'Cypher'),	-- Sushiboys
        ('MR21-UQF-04', '49', 'Skye'),		-- Crws
        ('MR21-UQF-04', '50', 'Viper'),		-- sScary
        
        -- Match 5
        -- Team Vikings (VKS1)
        ('MR21-UQF-05', '21', 'Phoenix'),	-- frz
        ('MR21-UQF-05', '22', 'Sova'),		-- Sacy
        ('MR21-UQF-05', '23', 'Killjoy'),	-- saadhak
        ('MR21-UQF-05', '24', 'Raze'),		-- gtn
        ('MR21-UQF-05', '25', 'Omen'),		-- sutecas
        -- X10 Esports (X10)
        ('MR21-UQF-05', '46', 'Sova'),		-- foxz
        ('MR21-UQF-05', '47', 'Sage'),		-- Patiphan
        ('MR21-UQF-05', '48', 'Killjoy'),	-- Sushiboys
        ('MR21-UQF-05', '49', 'Skye'),		-- Crws
        ('MR21-UQF-05', '50', 'Astra'),		-- sScary
        
        -- TL vs V1
        -- Match 6
        -- Team Liquid (TL)
        ('MR21-UQF-06', '11', 'Sage'),		-- ScreaM
        ('MR21-UQF-06', '12', 'Viper'),		-- Kryptix
        ('MR21-UQF-06', '13', 'Brimstone'),	-- L1NK
        ('MR21-UQF-06', '14', 'Skye'),		-- soulcas
        ('MR21-UQF-06', '15', 'Jett'),		-- Jamppi
        -- Version1 (V1)
		('MR21-UQF-06', '6', 'Jett'),		-- penny
        ('MR21-UQF-06', '7', 'Viper'),		-- jammyz
        ('MR21-UQF-06', '8', 'Sage'),		-- effys
        ('MR21-UQF-06', '9', 'Killjoy'),	-- Zellsis
        ('MR21-UQF-06', '10', 'Astra'),		-- vanity
        
		-- Match 7
        -- Team Liquid (TL)
        ('MR21-UQF-07', '11', 'Phoenix'),	-- ScreaM
        ('MR21-UQF-07', '12', 'Killjoy'),	-- Kryptix
        ('MR21-UQF-07', '13', 'Omen'),		-- L1NK
        ('MR21-UQF-07', '14', 'Sova'),		-- soulcas
        ('MR21-UQF-07', '15', 'Jett'),		-- Jamppi
        -- Version1 (V1)
		('MR21-UQF-07', '6', 'Jett'),		-- penny
        ('MR21-UQF-07', '7', 'Viper'),		-- jammyz
        ('MR21-UQF-07', '8', 'Sova'),		-- effys
        ('MR21-UQF-07', '9', 'Killjoy'),	-- Zellsis
        ('MR21-UQF-07', '10', 'Astra'),		-- vanity
        
        -- Match 8
        -- TL vs V1
        -- Team Liquid (TL)
        ('MR21-UQF-08', '11', 'Sage'),		-- ScreaM
        ('MR21-UQF-08', '12', 'Viper'),		-- Kryptix
        ('MR21-UQF-08', '13', 'Brimstone'),	-- L1NK
        ('MR21-UQF-08', '14', 'Skye'),		-- soulcas
        ('MR21-UQF-08', '15', 'Killjoy'),	-- Jamppi
        -- Version1 (V1)
		('MR21-UQF-08', '6', 'Jett'),		-- penny
        ('MR21-UQF-08', '7', 'Viper'),		-- jammyz
        ('MR21-UQF-08', '8', 'Sova'),		-- effys
        ('MR21-UQF-08', '9', 'Killjoy'),	-- Zellsis
        ('MR21-UQF-08', '10', 'Astra'),		-- vanity
        
        -- SEN vs FNC
        -- Match 9
		-- Sentinels (SEN)
        ('MR21-UQF-09', '1', 'Jett'),		-- ShahZam
        ('MR21-UQF-09', '2', 'Sova'),		-- SicK
        ('MR21-UQF-09', '3', 'Reyna'),		-- TenZ
        ('MR21-UQF-09', '4', 'Viper'),		-- zombs
        ('MR21-UQF-09', '5', 'Sage'),		-- dapr
        -- Version1 (V1)
        ('MR21-UR1-09', '16', 'Sova'),		-- Boaster
        ('MR21-UR1-09', '17', 'Sage'),		-- doma
        ('MR21-UR1-09', '18', 'Viper'),		-- Mistic
        ('MR21-UR1-09', '19', 'Killjoy'),	-- MAGNUM
        ('MR21-UR1-09', '20', 'Jett'),		-- Derke
        
        -- Match 10
		-- Sentinels (SEN)
        ('MR21-UQF-10', '1', 'Sova'),		-- ShahZam
        ('MR21-UQF-10', '2', 'Phoenix'),	-- SicK
        ('MR21-UQF-10', '3', 'Jett'),		-- TenZ
        ('MR21-UQF-10', '4', 'Astra'),		-- zombs
        ('MR21-UQF-10', '5', 'Cypher'),		-- dapr
        -- Version1 (V1)
        ('MR21-UR1-10', '16', 'Astra'),		-- Boaster
        ('MR21-UR1-10', '17', 'Sage'),		-- doma
        ('MR21-UR1-10', '18', 'Skye'),		-- Mistic
        ('MR21-UR1-10', '19', 'Killjoy'),	-- MAGNUM
        ('MR21-UR1-10', '20', 'Jett'),		-- Derke
        
        -- Lower Round 1 --
		-- X10 vs CR
        -- Match 1
        -- X10 Esports (X10)
        ('MR21-LR1-01', '46', 'Jett'),		-- foxz
        ('MR21-LR1-01', '47', 'Viper'),		-- Patiphan
        ('MR21-LR1-01', '48', 'Killjoy'),	-- Sushiboys
        ('MR21-LR1-01', '49', 'Skye'),		-- Crws
        ('MR21-LR1-01', '50', 'Astra'),		-- sScary
        -- Crazy Raccoon (CR)
		('MR21-LR1-01', '41', 'Phoenix'),		-- Munchkin
        ('MR21-LR1-01', '42', 'Jett'),		-- zepher
        ('MR21-LR1-01', '43', 'Astra'),		-- rion
        ('MR21-LR1-01', '44', 'Sova'),		-- Medusa
        ('MR21-LR1-01', '45', 'Killjoy'),	-- neth
        
        -- Match 2
		-- X10 Esports (X10)
        ('MR21-LR1-02', '46', 'Sova'),		-- foxz
        ('MR21-LR1-02', '47', 'Jett'),		-- Patiphan
        ('MR21-LR1-02', '48', 'Cypher'),	-- Sushiboys
        ('MR21-LR1-02', '49', 'Breach'),	-- Crws
        ('MR21-LR1-02', '50', 'Viper'),		-- sScary
        -- Crazy Raccoon (CR)
		('MR21-LR1-02', '41', 'Sage'),		-- Munchkin
        ('MR21-LR1-02', '42', 'Jett'),		-- zepher
        ('MR21-LR1-02', '43', 'Viper'),		-- rion
        ('MR21-LR1-02', '44', 'Sova'),		-- Medusa
        ('MR21-LR1-02', '45', 'Killjoy'),	-- neth
        
        -- SHK vs KRÜ
        -- Match 3
        -- Sharks Esports (SHK)
        ('MR21-LR1-03', '31', 'Sage'),		-- fra
        ('MR21-LR1-03', '32', 'Omen'),		-- light
        ('MR21-LR1-03', '33', 'Raze'),		-- prozin
        ('MR21-LR1-03', '34', 'Sova'),		-- deNaro
        ('MR21-LR1-03', '35', 'Jett'),		-- gaabxx
        -- KRÜ Esports (KRÜ)
		('MR21-UR1-03', '36', 'Jett'),		-- NagZ
        ('MR21-UR1-03', '37', 'Sova'),		-- bnj
        ('MR21-UR1-03', '38', 'Sage'),		-- delz1k
        ('MR21-UR1-03', '39', 'Killjoy'),	-- Klaus
        ('MR21-UR1-03', '40', 'Viper'),		-- Mazino
        
        -- Match 4
        -- Sharks Esports (SHK)
        ('MR21-LR1-04', '31', 'Skye'),		-- fra
        ('MR21-LR1-04', '32', 'Brimstone'),	-- light
        ('MR21-LR1-04', '33', 'Raze'),		-- prozin
        ('MR21-LR1-04', '34', 'Sova'),		-- deNaro
        ('MR21-LR1-04', '35', 'Viper'),		-- gaabxx
        -- KRÜ Esports (KRÜ)
		('MR21-LR1-04', '36', 'Sage'),		-- NagZ
        ('MR21-LR1-04', '37', 'Raze'),		-- bnj
        ('MR21-LR1-04', '38', 'Brimstone'),	-- delz1k
        ('MR21-LR1-04', '39', 'Skye'),		-- Klaus
        ('MR21-LR1-04', '40', 'Viper'),		-- Mazino
        
        -- Upper SemiFinals -- 
        -- SEN vs VKS1
        -- Match 1
		-- Sentinels (SEN)
        ('MR21-USF-01', '1', 'Jett'),		-- ShahZam
        ('MR21-USF-01', '2', 'Sova'),		-- SicK
        ('MR21-USF-01', '3', 'Reyna'),		-- TenZ
        ('MR21-USF-01', '4', 'Viper'),		-- zombs
        ('MR21-USF-01', '5', 'Sage'),		-- dapr
		-- Team Vikings (VKS1)
        ('MR21-USF-01', '21', 'Jett'),		-- frz
        ('MR21-USF-01', '22', 'Sova'),		-- Sacy
        ('MR21-USF-01', '23', 'Killjoy'),	-- saadhak
        ('MR21-USF-01', '24', 'Raze'),		-- gtn
        ('MR21-USF-01', '25', 'Omen'),		-- sutecas
        
		-- Match 2
		-- Sentinels (SEN)
        ('MR21-USF-02', '1', 'Sova'),		-- ShahZam
        ('MR21-USF-02', '2', 'Phoenix'),	-- SicK
        ('MR21-USF-02', '3', 'Jett'),		-- TenZ
        ('MR21-USF-02', '4', 'Astra'),		-- zombs
        ('MR21-USF-02', '5', 'Cypher'),		-- dapr
		-- Team Vikings (VKS1)
        ('MR21-USF-02', '21', 'Phoenix'),	-- frz
        ('MR21-USF-02', '22', 'Sova'),		-- Sacy
        ('MR21-USF-02', '23', 'Cypher'),	-- saadhak
        ('MR21-USF-02', '24', 'Raze'),		-- gtn
        ('MR21-USF-02', '25', 'Astra'),		-- sutecas
        
        -- V1 vs NU
        -- Match 3
        -- Version1 (V1)
		('MR21-USF-03', '6', 'Jett'),		-- penny
        ('MR21-USF-03', '7', 'Viper'),		-- jammyz
        ('MR21-USF-03', '8', 'Sova'),		-- effys
        ('MR21-USF-03', '9', 'Killjoy'),	-- Zellsis
        ('MR21-USF-03', '10', 'Astra'),		-- vanity
        -- NUTURN (NU)
        ('MR21-USF-03', '26', 'Astra'),		-- peri
        ('MR21-USF-03', '27', 'Sova'),		-- Lakia
        ('MR21-USF-03', '28', 'Jett'),		-- allow
        ('MR21-USF-03', '29', 'Raze'),		-- Suggest
        ('MR21-USF-03', '30', 'Breach'),	-- solo
        
        -- Match 4
        -- Version1 (V1)
		('MR21-USF-04', '6', 'Jett'),		-- penny
        ('MR21-USF-04', '7', 'Viper'),		-- jammyz
        ('MR21-USF-04', '8', 'Sova'),		-- effys
        ('MR21-USF-04', '9', 'Killjoy'),	-- Zellsis
        ('MR21-USF-04', '10', 'Astra'),		-- vanity
        -- NUTURN (NU)
        ('MR21-USF-04', '26', 'Astra'),		-- peri
        ('MR21-USF-04', '27', 'Sova'),		-- Lakia
        ('MR21-USF-04', '28', 'Jett'),		-- allow
        ('MR21-USF-04', '29', 'Skye'),		-- Suggest
        ('MR21-USF-04', '30', 'Killjoy'),	-- solo
        
        -- Match 5
        -- Version1 (V1)
		('MR21-USF-05', '6', 'Jett'),		-- penny
        ('MR21-USF-05', '7', 'Viper'),		-- jammyz
        ('MR21-USF-05', '8', 'Sage'),		-- effys
        ('MR21-USF-05', '9', 'Killjoy'),	-- Zellsis
        ('MR21-USF-05', '10', 'Astra'),		-- vanity
        -- NUTURN (NU)
        ('MR21-USF-05', '26', 'Omen'),		-- peri
        ('MR21-USF-05', '27', 'Raze'),		-- Lakia
        ('MR21-USF-05', '28', 'Jett'),		-- allow
        ('MR21-USF-05', '29', 'Breach'),	-- Suggest
        ('MR21-USF-05', '30', 'Killjoy');	-- solo
        
        
SELECT * FROM matches
ORDER BY match_date, match_time;

SELECT * FROM agent_pick;


