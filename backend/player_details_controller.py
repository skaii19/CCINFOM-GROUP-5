# player_details_controller.py
from db import get_cursor

class PlayerDetailsController:

    def get_basic_player_info(self, player_id):
        """
        Return basic IGN + name only.
        """
        cur = get_cursor()
        cur.execute("""
                    SELECT player_ign, player_name
                    FROM player
                    WHERE player_id = %s
                    """, (player_id,))
        return cur.fetchone()

    def get_player_stats(self, player_id):
        """
        Return raw stats from player_stats table, NOT aggregated.
        Each row corresponds to a tournament.
        """
        cur = get_cursor()
        cur.execute("""
                    SELECT
                        ps.tournament_id,
                        ps.agents_used,
                        ps.headshot_pct,
                        ps.kd_ratio,
                        ps.avg_combat_score,
                        ps.mvps
                    FROM player_stats ps
                    WHERE ps.player_id = %s
                    ORDER BY ps.tournament_id
                    """, (player_id,))
        return cur.fetchall()

    def get_team_history(self, player_id):
        """
        List of all historical teams, with dates.
        """
        cur = get_cursor()
        cur.execute("""
                    SELECT
                        th.team_id,
                        t.team_name,
                        th.start_date,
                        th.end_date
                    FROM team_history th
                             JOIN team t ON t.team_id = th.team_id
                    WHERE th.player_id = %s
                    ORDER BY th.start_date ASC
                    """, (player_id,))
        return cur.fetchall()

    def get_agent_picks(self, player_id):
        """
        List of all agents the player used in matches.
        """
        cur = get_cursor()
        cur.execute("""
                    SELECT ap.match_id, ap.agent_name
                    FROM agent_pick ap
                    WHERE ap.player_id = %s
                    ORDER BY ap.match_id
                    """, (player_id,))
        return cur.fetchall()

    def get_mvp_count(self, player_id):
        """
        Count how many times this player was MVP.
        """
        cur = get_cursor()
        cur.execute("""
                    SELECT COUNT(*) AS mvp_count
                    FROM matches
                    WHERE mvp_player_id = %s
                    """, (player_id,))
        return cur.fetchone()