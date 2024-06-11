from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)

# Load the video classification pipeline
video_cls = pipeline(model="mohamedsaeed823/videomae-base-finetuned-kinetics-finetuned-arsl-subset")

@app.route('/classify_video', methods=['POST'])
def classify_video():
    if 'video' not in request.files:
        return jsonify({'error': 'No video file provided'}), 400
    
    video_file = request.files['video']
    
    # Save the video file to a temporary location
    video_path = "video.mp4"
    video_file.save(video_path)
    
    # Perform video classification
    classifications = video_cls(video_path, top_k=5)  # Only get the top score label

    # Extract the top label from the classification results
    top_label = classifications[0]['label']
    
    return jsonify({'top_label': top_label})

if __name__ == '__main__':
    app.run(debug=True)
