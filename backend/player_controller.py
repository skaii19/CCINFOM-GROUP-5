from db import get_cursor, get_connection

class PlayerController:

    # Load all players with their current team (if any)
    def load_players(self):
        cur = get_cursor()
        cur.execute("""
                    SELECT
                        p.player_id,
                        p.player_ign,
                        p.player_name,
                        p.active_status,
                        p.team_id,
                        t.team_name AS current_team
                    FROM player p
                             LEFT JOIN team t ON p.team_id = t.team_id
                    ORDER BY p.player_id
                    """)
        return cur.fetchall()

    # Add a new player
    def add_player(self, ign, name, team_id, status):
        cur = get_cursor()
        cur.execute("""
                    INSERT INTO player (player_ign, player_name, team_id, active_status)
                    VALUES (%s, %s, %s, %s)
                    """, (ign, name, team_id, status))
        get_connection().commit()

    # Update an existing player
    def update_player(self, pid, ign, name, team_id, status):
        cur = get_cursor()
        cur.execute("""
                    UPDATE player
                    SET player_ign=%s, player_name=%s, team_id=%s, active_status=%s
                    WHERE player_id=%s
                    """, (ign, name, team_id, status, pid))
        get_connection().commit()

    # Delete a player
    def delete_player(self, pid):
        cur = get_cursor()
        cur.execute("DELETE FROM player WHERE player_id=%s", (pid,))
        get_connection().commit()

    # For dropdowns in the Add/Edit dialog (tba)
    def get_teams(self):
        cur = get_cursor()
        cur.execute("""
                    SELECT team_id, team_name
                    FROM team
                    ORDER BY team_name
                    """)
        return cur.fetchall()
