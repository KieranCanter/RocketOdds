import pytest
import psycopg2

@pytest.fixture
def db_connection():
    conn = psycopg2.connect("dbname=testdb user=testuser password=testpass")
    conn.autocommit = False
    yield conn
    conn.rollback()
    conn.close()

def test_seed_data(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("SELECT * FROM my_table;")
    rows = cursor.fetchall()
    assert len(rows) > 0  # Test seed data