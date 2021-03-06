# import the libraries
import os
import face_recognition
import pprint
import sys
import glob
import shutil

# make a list of all the available images
encoded_images = []
for image in glob.glob('dataset/*.jpeg'):
    # load the image
    current_image = face_recognition.load_image_file(image)
    # encode the loaded image into a feature vector
    current_image_encoded = face_recognition.face_encodings(current_image)[0]
    encoded_images.append(current_image_encoded)


video_dir = sys.argv[1]
if os.path.isdir(video_dir):
    print(video_dir)
    matches_dir = video_dir + "/matches"
    if not os.path.isdir(matches_dir):
        oS.mkdir(matches_dir)
    for filename in sorted(glob.glob(video_dir + '/*.jpg')):
        # print(filename)
        head, tail = os.path.split(filename)
        # load your image
        image_to_be_matched = face_recognition.load_image_file(filename)

        # encoded the loaded image into a feature vector
        try:
            image_to_be_matched_encoded = face_recognition.face_encodings(
                image_to_be_matched)[0]
        except:
            continue

        result = face_recognition.compare_faces(
            encoded_images,
            image_to_be_matched_encoded,
            tolerance=0.58)
        # check if it was a match
        if result[0] == True:
            # pprint.pprint(result)
            print("Matched: %s" % (filename))
            shutil.copy(filename, matches_dir + "/" + tail)

