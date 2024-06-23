from flask import Flask, request, jsonify
from clearml import Task , TaskTypes
import cv2
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision
from transformers import pipeline
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
phrase_map = {
    'Alhamdulillah': "الحمد لله",
  'Good bye': "مع السلامة",
  'Good evening': "مساء الخير",
  'Good morning': "صباح الخير",
  'How are you': "ايه الاخبار",
  'I am pleased to meet you': "فرصة سعيدة",
  'I_m fine': "انا كويس",
  'I_m sorry': "انا اسف",
  'Not bad': "مش وحش ",
  'Salam aleikum': "السلام عليكم",
  'Sorry (Excuse me)': "لو سمحت",
  'Thanks': "شكرا"
}
video_cls = pipeline(model="mohamedsaeed823/VideoMAE-small-finetuned-ARSL-diverse-dataset")
# Load the gesture recognition model
model_path = os.path.abspath("F:/Graduation Project/Fluent-Hands/arabic_signlanguage_characters_model.task")
recognizer = vision.GestureRecognizer.create_from_model_path(model_path)


def recognize_gesture(image):
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
@app.route('/classify_video', methods=['POST'])
def classify_video():
    if 'video' not in request.files:
        return jsonify({'error': 'No video file provided'}), 400
    
    video_file = request.files['video']
    
    # Save the video file to a temporary location
    video_path = "video.mp4"
    video_file.save(video_path)
    
    # Perform video classification
    classifications = video_cls(video_path, top_k=10,frame_sampling_rate=4)  # Only get the top score label

    # Extract the top label from the classification results
    top_label = classifications[0]['label']
    
    return jsonify({'result': phrase_map[top_label]})

if __name__ == "__main__":
    app.run(debug=True)
