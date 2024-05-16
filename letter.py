from flask import Flask, request, jsonify
import cv2
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision
import os
app = Flask(__name__)

eng_ara_mapping ={
'':'not clear',
"ain":'ع',
"aleff":'أ',
"bb":'ب',
"dal":'د',
"dha":'ظ',
"dhad":"ض",
"fa":"ف",
"gaaf":'ق',
"ghain":'غ',
"ha":'ه',
"haa":'ح',
"jeem":'ج',
"kaaf":'ك',
"laam":'ل',
"meem":'م',
"nun":"ن",
"ra":'ر',
"saad":'ص',
"seen":'س',
"sheen":"ش",
"ta":'ت',
"taa":'ط',
"thaa":"ث",
"thal":"ذ",
"waw":'و',
"ya" : "ي",
"zay":'ز',
"khaa":'خ' }

def recognize_gesture(image):
    # Load the gesture recognition model
    model_path = os.path.abspath("arabic_signlanguage_characters_model.task")
    recognizer = vision.GestureRecognizer.create_from_model_path(model_path)

    # Convert image to MediaPipe format
    image = mp.Image.create_from_file(image)

    # Perform gesture recognition
    recognition_result = recognizer.recognize(image)

    # Extract the top gesture
    top_gesture = recognition_result.gestures[0][0]

    # Return the gesture label and score
    return f"{eng_ara_mapping[top_gesture.category_name]}"

@app.route("/recognize", methods=["POST"])
def recognize():
    if request.method == "POST":
        if "image" in request.files:
            image_file = request.files["image"]
            image_path = "temp.jpg"
            image_file.save(image_path)
            result = recognize_gesture(image_path)
            os.remove(image_path)  # Remove temporary image file
            return jsonify({"result": result})
    return jsonify({"error": "Image not provided"})

if __name__ == "__main__":
    app.run(debug=True)
