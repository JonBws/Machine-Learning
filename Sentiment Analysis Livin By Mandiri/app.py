from flask import Flask, render_template, request
import pickle

app = Flask(__name__)

## load logistic regression model and count vectroizer
model = pickle.load(open('Sentiment Analysis Livin By Mandiri/logistic-regression.pkl', 'rb'))
cv = pickle.load(open('Sentiment Analysis Livin By Mandiri/count-vectorizer.pkl', 'rb'))

@app.route('/')
def homepage():
    return render_template('home.html')

@app.route('/predict', methods=['post'])
def predict():
    review = request.form['review']
    data = [review]
    data_transform = cv.transform(data).toarray()
    prediction = model.predict(data_transform)
    return render_template('result.html', result = prediction)

if __name__ == '__main__':
    app.run(debug=True)



