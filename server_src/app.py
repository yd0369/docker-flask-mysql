from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'toor'
app.config['MYSQL_DB'] = 'items_db'

mysql = MySQL(app)

@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM items')
    results = cur.fetchall()
    cur.close()
    items = [f'Item {row[0]}: {row[1]}' for row in results]
    return '<br>'.join(items)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
