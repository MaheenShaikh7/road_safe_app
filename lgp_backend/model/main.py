from flask import Flask , request , jsonify


app = Flask(__name__)



@app.route("/",methods=["GET","POST"])
def ro():
    if request.method == "POST":
        print("e")
        print(request.files)
        request.files['file'].save("upload/file.jpg")
        return jsonify({})
    return """    <form method="POST" action="" enctype="multipart/form-data">
      <p><input type="file" name="file"></p>
      <p><input type="submit" value="Submit"></p>
    </form>"""

app.run("192.168.137.2",port=5000,debug=True)