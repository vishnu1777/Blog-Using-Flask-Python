# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


from flask import Flask, render_template, request, session, redirect
from werkzeug.utils import secure_filename
from flask_sqlalchemy import SQLAlchemy
import os
import math
from flask_mail import Mail
import json
from datetime import datetime

with open('C:/Users/Vishnu M/PycharmProjects/codebash/templates/config.json', 'r') as c:
    params = json.load(c)["params"]

localServer = True

app = Flask(__name__)
app.secret_key = 'the random string'
app.config['file_upload'] = params['uploading_folder']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-username'],
    MAIL_PASSWORD=params['gmail-password']

)
mail = Mail(app)

if localServer:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_url']

db = SQLAlchemy(app)


class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_no = db.Column(db.String(12), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    image_file = db.Column(db.String(15), nullable=False)
    date = db.Column(db.String(12), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_post']))

    page = request.args.get('page')

    if not str(page).isnumeric():
        page = 1
    page = int(page)

    posts = posts[
            (page - 1) * int(params['no_of_post']):(page - 1) * int(params['no_of_post']) + int(params['no_of_post'])]

    if page <= 1:
        prev = "#"
        Next = "/?page=" + str(page + 1)
    elif page > last-1:
        prev = "/?page=" + str(page - 1)
        Next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        Next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, Next=Next)


@app.route('/dashboard', methods=['GET', 'POST'])
def login():
    if 'user' in session and session['user'] == params['admin_username']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('pass')
        if username == params['admin_username'] and password == params['admin_password']:
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
        else:
            return render_template('login.html', params=params)

    else:
        return render_template('login.html', params=params)


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/about')
def about():
    return render_template('About.html', params=params)


@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['file_upload'], secure_filename(f.filename)))
            return "Uploaded successfully"



@app.route('/delete/<string:sno>', methods=['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return render_template('dashboard.html', params=params)


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            title = request.form.get('title')
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if sno == '0':
                post = Posts(title=title, tagline=tagline, slug=slug, content=content, image_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = title
                post.tagline = tagline
                post.slug = slug
                post.content = content
                post.image_file = img_file
                post.date = date
                db.session.commit()
        post = Posts.query.filter_by(sno=sno).first()

        return render_template('edit.html', params=params, post=post,sno = sno)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    posts = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', posts=posts, params=params)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        phone = request.form.get('phone')
        email = request.form.get('email')
        message = request.form.get('message')
        entry = Contact(name=name, phone_no=phone, email=email, message=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message(sender=email, recipients=[params['gmail-username']],
                          body=message + '\n' + phone

                          )

    return render_template('contact.html', params=params)


app.run(debug=True)
