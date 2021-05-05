import cv2
import os
import sys
import mysql.connector
from mysql.connector import connection

def createFolder(directory):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError:
        print ('Error: Creating directory. ' +  directory)

cnx = mysql.connector.connect(
    host="127.0.0.1",
    port=3306,
    user="root",
    password="",
    database= "db_tesis")

id = sys.argv[1]
cursor = cnx.cursor()
query = ("SELECT * FROM tb_image WHERE ID_KARYAWAN='%s'" % id)
cursor.execute(query)
records = cursor.fetchall()
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
for row in records:
    count = 1

path = '{}'.format(row[3])
save_path = 'asset/_upload/training/mask'

if not os.path.isdir(save_path):
    os.mkdir(save_path)

image_files = [f for f in os.listdir(path) if f.endswith('.jpg')]

for file in image_files:
    w = 0

    sample_image = cv2.imread(path + str(file))
    if sample_image is None:
        print("Tidak dapat membaca berkas citra")
        exit()

    gray = cv2.cvtColor(sample_image, cv2.COLOR_BGR2GRAY)
    his = cv2.equalizeHist(gray)
    faces = face_cascade.detectMultiScale(his, scaleFactor=1.3, minNeighbors=2)
    print("<div class='alert alert-success'>Jumlah wajah terdeteksi: {}</div>".format(len(faces)))

    for (x, y, w, h) in faces:
        img = cv2.rectangle(his, (x, y), (x + w, y + h), (255, 0, 0), 1)
        roi_gray = gray[y:y + h, x:x + w]
        roi_color = img[y:y + h, x:x + w]
        roi_his = his[y:y + h, x:x + w]
        crop_face = his[y:y + h, x:x + w]
        fileName = row[2]
        s1 = '{}.png'.format(row[2])
        folder = createFolder('asset/_upload/training/nomask/{}'.format(row[2]))
        driname = 'asset/_upload/training/nomask/{}'.format(row[2])
        cv2.imwrite(os.path.join(driname, s1), crop_face)

            #sql = ("UPDATE tb_image SET TRAINING_IMAGE = (%s), TRAINING_DIR = (%s) WHERE ID_KARYAWAN= (%s)")
            #cursor.execute(sql, (s1, driname, id))
            #cnx.commit()
            # print(cursor.rowcount, "record(s) affected")



    #height = sample_image.shape[0]
    #width = sample_image.shape[1]

    #window_width = 500
    #window_height = 500

    #writer = file.split('.')[0]

    #if not os.path.isdir(save_path + '/' + writer + '/'):
        #os.mkdir(save_path + '/' + writer + '/')

    #for i in range(0, height, window_height):
        #for j in range(0, width, window_width):
            #crop_image = sample_image[i:i+window_height, j:j+window_width]
            #cv2.imwrite(save_path + '/' + writer + '/' + str(w) + '.png', crop_image)
            #w = w + 1

#for root, dirs, files in os.walk(save_path):
    #path = root.split(os.sep)
    #print((len(path) - 1) * '---', os.path.basename(root))
    #for file in files:
        #print(len(path) * '---', file)