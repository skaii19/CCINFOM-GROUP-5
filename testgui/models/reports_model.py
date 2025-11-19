from db import get_cursor, get_connection

class ReportsModel:
    def revenue_tournament_day (self, tournament_id, date_of_ticket) :
        try:
            cur = get_cursor() 
            cur.execute("""
                        SELECT t.tournament_id, SUM(c.ticket_price) AS total_ticket_sales, c.date_of_ticket FROM customer c
                        JOIN tournament t ON c.tournament_id = t.tournament_id
                        WHERE t.tournament_id = %s AND c.date_of_ticket = %s
                        GROUP BY t.tournament_id, c.date_of_ticket
                        ORDER BY c.date_of_ticket
                        """, (tournament_id, date_of_ticket))
            return cur.fetchall()
        except Exception as e:
            print("Error loading revenue for tournament day:", e)
            return []
        
    def revenue_tournament (self, tournament_id) :
        try:
            cur = get_cursor() 
            cur.execute("""
                        SELECT t.tournament_id, SUM(c.ticket_price) AS total_ticket_sales FROM customer c
                        JOIN tournament t ON c.tournament_id = t.tournament_id
                        WHERE t.tournament_id = %s
                        GROUP BY t.tournament_id
                        ORDER BY t.tournament_id
                        """, (tournament_id))
            return cur.fetchall()
        except Exception as e:
            print("Error loading revenue for tournament:", e)
            return []
        
    def revenue_year (self, year) :
        try:
            cur = get_cursor() 
            cur.execute("""
                        SELECT 
                            YEAR(date_of_ticket) AS tourn_year,
                            SUM(ticket_price) AS total_ticket_sales
                        FROM customer
                        WHERE YEAR(date_of_ticket) = %s
                        GROUP BY 
                            YEAR(date_of_ticket)
                        ORDER BY tourn_year
                        """, (year))
            return cur.fetchall()
        except Exception as e:
            print("Error loading revenue for year:", e)
            return []
        
    def average_per_tournament(self) :
        try:
            cur = get_cursor() 
            cur.execute("""
                        SELECT 
                            t.tournament_id,
                            AVG(c.ticket_price) AS average_ticket_sales
                        FROM customer c
                        JOIN tournament t 
                            ON c.tournament_id = t.tournament_id
                        GROUP BY 
                            t.tournament_id
                        ORDER BY 
                            t.tournament_id
                        """)
            return cur.fetchall()
        except Exception as e:
            print("Error loading revenue for year:", e)
            return []