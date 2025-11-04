CREATE SCHEMA IF NOT EXISTS vct;
USE vct;

SET SQL_SAFE_UPDATES = 0;

-- team
drop table team;
CREATE TABLE team (
	team_id VARCHAR(4) PRIMARY KEY,
	team_name VARCHAR(15),
    region VARCHAR(5),
    total_winnings DECIMAL(10,2),
	active_status BIT NOT NULL
);

TRUNCATE team;

INSERT INTO team(team_id, team_name, region, total_winnings, active_status)
-- active teams
-- Americas
	-- NA (North America)
VALUES  ('100T', '100 Thieves', 'NA', 478500, 1),
	   	('BERZ', 'Berzerkers', 'NA', 3695, 1),
	    ('BLU', 'Blue Otter', 'NA', 10235, 1),
		('C9', 'Cloud9', 'NA', 259143, 1),
	    ('CUA', 'Cubert Academy', 'NA', 7250, 1),
		('ENVY', 'ENVY', 'NA', 324750, 1),
		('EG', 'Evil Genuises', 'NA', 1283000, 1),
		('FCN', 'Fisher College Navy', 'NA', 31300, 1),
		('FLY', 'FlyQuest Red', 'NA', 51955, 1),
		('G2', 'G2 Esports', 'NA', 747250, 1),
		('JMU', 'James Madison University', 'NA', 2750, 1),
		('LDR', 'Landor', 'NA', 6625, 1),
		('ME', 'Maryville Esports', 'NA', 35285, 1),
		('NBG', 'Nightblood Gaming', 'NA', 7225, 1),
		('NU', 'Northwood University', 'NA', 91019, 1),
	    ('NRG', 'NRG', 'NA', 1415375, 1),
		('OC', 'OC Esports', 'NA', 14900, 1),
		('QOR', 'QoR Gaming', 'NA', 25865, 1),
		('SAD', 'SaD Esports', 'NA', 17120, 1),
		('SJSU', 'San Jose State University Esports', 'NA', 20275, 1),
		('SEN', 'Sentinels', 'NA', 608000, 1),
		('SCS', 'St. Clair College', 'NA', 30620, 1),
		('TAMU', 'Texas A&M University', 'NA', 29388, 1),
        ('TSM', 'TSM', 'NA', 254019, 1),
		('UH', 'University of Houston', 'NA', 19025, 1),
		('UM', 'University of Missouri', 'NA', 14750, 1),
		('UST', 'University of St. Thomas', 'NA', 17625, 1),
		('VT', 'Virginia Tech', 'NA', 3300, 1),
		('WU', 'Winthrop University', 'NA', 57838, 1),
		('YFP', 'YFP', 'NA', 24375, 1),

	-- BR (Brazil)
		('2G', '2GAME Academy', 'BR', 10737, 1),
		('COR', 'Corinthians Esports', 'BR', 13299, 1),
		('EL', 'Elevate', 'BR', 10038, 1),
		('FUR', 'FURIA', 'BR', 147889, 1),
		('FURA', 'FURIA Academy', 'BR', 6101, 1),
		('LOS', 'LOS', 'BR', 34322, 1),
		('LOUD', 'LOUD', 'BR', 950156, 1),
		('MIBR', 'MIBR', 'BR', 119458, 1),
		('MIBA', 'MIBR Academy', 'BR', 3553, 1),
		('RC', 'RED Canids', 'BR', 55593, 1),
		('STL', 'Stellae Gaming', 'BR', 50881, 1),
		('TBK', 'TBK Esports', 'BR', 48332, 1),
		('TSL', 'Team Solid', 'BR', 26907, 1),

	-- LATAM (Latin America)
		('6K', 'Six Karma', 'LATAM', 80988, 1),
		('9Z', '9z Team', 'LATAM', 138128, 1),
		('AB3', 'AB3 Esports', 'LATAM', 55593, 1),
		('AUS', 'Australs', 'LATAM', 50941, 1),
		('CHVS', 'Chivas Esports', 'LATAM', 5625, 1),
		('FUS', 'FUSION', 'LATAM', 72647, 1),
		('KLG', 'Kaos Latin Gamers', 'LATAM', 3900, 1),
		('KRU', 'KRU Esports', 'LATAM', 390229, 1),
		('LAZR', 'E-Xolos LAZER', 'LATAM', 145477, 1),
		('LEV', 'Leviatan', 'LATAM', 565896, 1),
		('OXEN', 'OXEN', 'LATAM', 27999, 1),
		('RB', 'Rebirth Esports', 'LATAM', 17813, 1),
		('SN', 'ShindeN', 'LATAM', 19000, 1),
		('ZEN', 'Zen eSports', 'LATAM', 7605, 1),

-- EMEA
	-- EU (Europe)
		('AT', 'ACEGEAR TEMPEST', 'EU', 18074, 1),
		('ALTX', 'ALTERNATE aTTaX', 'EU', 20135, 1),
		('AXL', 'Axolotl Esports', 'EU', 6386, 1),
		('FCB', 'Barca eSports', 'EU', 8621, 1),
		('BFX', 'Bitfix Gaming', 'EU', 8718, 1),
		('BRS', 'Boars Gaming', 'EU', 4126, 1),
		('CGN', 'CGN Esports', 'EU', 74286, 1),
		('CLRS', 'Colors Esport', 'EU', 6191, 1),
		('DNST', 'DNSTY', 'EU', 17440, 1),
		('EFE', 'Eintracht Frankfurt Esports', 'EU', 13415, 1),
		('ENT', 'Entropy Gaming', 'EU', 6250, 1),
		('ESC', 'ESC Gaming', 'EU', 4656, 1),
		('EF', 'Eternal Fire', 'EU', 6460, 1),
		('XLTY', 'Exalty', 'EU', 3650, 1),
		('F9E', 'F9 EICAR', 'EU', 12883, 1),
		('FLK', 'FALKE ESPORTS', 'EU', 2301, 1),
		('FNC', 'FNATIC', 'EU', 2158026, 1),
		('FMG', 'Formulation Gaming', 'EU', 16402, 1),
		('GM', 'Gentle Mates', 'EU', 73805, 1),
		('GX', 'GIANTX', 'EU', 141179, 1),
		('HGE', 'HGE Esports', 'EU', 2154, 1),
		('JL', 'Joblife', 'EU', 40015, 1),
		('KC', 'Karmine Corp', 'EU', 77516, 1),
		('KCBS', 'Karmine Corp Blue Stars', 'EU', 4437, 1),
		('KOI', 'KOI', 'EU', 6556, 1),
		('KPI', 'KPI Gaming', 'EU', 19574, 1),
		('KRC', 'KRC Genk Esports', 'EU', NULL, 1),
		('LK', 'Lotus Knights', 'EU', 4026, 1),
		('MCK', 'MACKO Esports', 'EU', 5262, 1),
		('MND', 'Mandatory', 'EU', 64865, 1),
		('MT', 'Melilla Titans', 'EU', 5655, 1),
		('MOUZ', 'MOUZ', 'EU', 61151, 1),
		('NAVI', 'Natus Vincere', 'EU', 211380, 1),
		('NOVO', 'NOVO Esports', 'EU', 6617, 1),
		('NXT', 'NXT', 'EU', 3962, 1),
		('OE', 'Otakar Esports', 'EU', 3691, 1),
		('RC', 'Ramboot Club', 'EU', 4210, 1),
		('RMG', 'Reveal Multigaming', 'EU', 5800, 1),
		('RZN', 'RIZON', 'EU', 13812, 1),
		('SZK', 'Suzaku Esports', 'EU', 3448, 1),
		('SZM', 'Szack Mat', 'EU', 15003, 1),
		('GLG', 'Team Galaga', 'EU', 12751, 1),
		('TH', 'Team Heretics', 'EU', 1402894, 1),
		('TL', 'Team Liquid', 'EU', 738104, 1),
		('TLA', 'Team Liquid Academy', 'EU', 11385, 1),
		('VIT', 'Team Vitality', 'EU', 240876, 1),
		('TOG', 'TeamOrangeGaming', 'EU', 1956, 1),
		('TUD', 'TUD Apes', 'EU', 1620, 1),
		('UCAM', 'UCAM Esports Club', 'EU', 26361, 1),
		('UWAY', 'UNIWAY', 'EU', 2524, 1),
		('VT', 'Valiant', 'EU', 23586, 1),
		('WGR', 'Wygers', 'EU', 4566, 1),
		('WLD', 'WYLDE', 'EU', 2438, 1),
		('ZRN', 'ZERANCE', 'EU', 9992, 1),
		('ZTG', 'ZETA Gaming', 'EU', 4505, 1),

	-- TR (Turkey)
		('BBL', 'BBL Esports', 'TR', 216764, 1),
		('BBLP', 'BBL PCIFIC', 'TR', 44846, 1),
		('FNB', 'Fenerbahce Esports', 'TR', 4167, 1),
		('FFX', 'Fire Flux Esports', 'TR', 46091, 1),
		('FUT', 'FUT Esports', 'TR', 409236, 1),
		('GLK', 'Galakticos', 'TR', 10821, 1),
		('GLT', 'Galatasaray Esports', 'TR', 17566, 1),
		('PSM', 'Papara SuperMassive', 'TR', 62337, 1),
		('S2G', 'S2G Esports', 'TR', 11188, 1),
		('ULF', 'ULF Esports', 'TR', 39508, 1),
	
	-- MEA (Middle East & North Africa)
		('ALQ', 'AlQadsiah Esports', 'MEA', 53564, 1),
		('BAAM', 'BAAM Esports', 'MEA', 5000, 1),
		('CTS', 'CriTics Esports', 'MEA', 7991, 1),
		('NASR', 'NASR Esports', 'MEA', 70777, 1),
		('NBL', 'NOBLES', 'MEA', 20573, 1),
		('STL', 'Stallions Esports', 'MEA', 15997, 1),
		('RAAD', 'Team RA AD', 'MEA', 115128, 1),
		('TWST', 'Twisted Minds', 'MEA', 75501, 1),
		('UND', 'Underground Gaming', 'MEA', 43807, 1),
	
-- inactive
	-- Americas
	-- NA
		('AKR', 'Akrew', 'NA', 20125, 0),
		('ASC', 'Ascend', 'NA', 2150, 0),
		('GG', 'Ghost Gaming', 'NA', 49100, 0),
		('SR', 'Shopify Rebellion', 'NA', 38000, 0),
	-- EMEA
	-- EU
        ('SSP', 'Sissi State Punks', 'EU', 13949, 0),
	-- APAC
	    ('PRX', 'Paper Rex', 'APAC', 1899351, 1),
	-- CN
        ('EDG', 'Edward Gaming', 'CN', 1367287, 1),
        ('AG', 'All Gamers', 'CN', 3334, 1),
        ('ALG', 'Ambitious Legend Gaming', 'CN', 4159, 1);

SELECT * FROM team;
