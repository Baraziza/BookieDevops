from flask import Blueprint, render_template, request, redirect, url_for
from app import db  
from app.models import Book

app = Blueprint("app", __name__)

@app.route('/')
def home():
    books = Book.query.all()  
    return render_template('book_list.html', books=books)

@app.route('/add', methods=['GET', 'POST'])
def add_book():
    if request.method == 'POST':
        title = request.form.get('title')
        author = request.form.get('author')
        new_book = Book(title=title, author=author)
        db.session.add(new_book)
        db.session.commit()
        return redirect(url_for('app.home'))
    return render_template('add_book.html')

@app.route('/update/<int:book_id>')
def mark_as_read(book_id):
    book = Book.query.get(book_id)
    if book:
        book.status = "Read"
        db.session.commit()
    return redirect(url_for('app.home'))

@app.route('/delete/<int:book_id>')
def delete_book(book_id):
    book = Book.query.get(book_id)
    if book:
        db.session.delete(book)
        db.session.commit()
    return redirect(url_for('app.home'))