import mysql.connector
from mysql.connector import connection
import sys
import cv2
import numpy as np
import os

def createFolder(directory):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError:
        print ('Error: Creating directory. ' +  directory)

def unFlatten(vector,rows, cols):
    img = []
    cutter = 0
    while(cutter+cols<=rows*cols):
        try:
            img.append(vector[cutter:cutter+cols])
        except:
            img = vector[cutter:cutter+cols]
        cutter+=cols
    img = np.array(img)
    return img

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
eyes_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_eye.xml')
for row in records:
      count = 1
      face = ['{}'.format(row[2])]
      img = cv2.imread('{}'.format(face))
      if img is None:
          print("Tidak dapat membaca berkas citra")
          exit()
      gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
      his = cv2.equalizeHist(gray)
      faces = face_cascade.detectMultiScale(his, scaleFactor= 1.3, minNeighbors= 2)

      print("<div class='alert alert-success'>Jumlah wajah terdeteksi: {}</div>".format(len(faces)))
      for (x, y, w, h) in faces:
          img = cv2.rectangle(his, (x,y), (x+w, y+h), (255, 0, 0), 1)
          roi_gray = gray[y:y + h, x:x + w]
          roi_color = img[y:y + h, x:x + w]
          roi_his   = his[y:y + h, x:x + w]
          crop_face = his[y:y + h, x:x + w]
          fileName = row[2]
          s1 = '{}.png'.format(row[2])
          folder = createFolder('asset/_upload/training/nomask/{}'.format(row[2]))
          driname = 'asset/_upload/training/nomask/{}'.format(row[2])
          cv2.imwrite(os.path.join(driname,s1), crop_face)

          eyes = eyes_cascade.detectMultiScale(roi_gray)
          #print(count)
          for (ex, ey, ew, eh) in eyes:
              crop_eye = roi_his[ey: ey + eh, ex: ex + ew]
              cv2.rectangle(roi_color, (ex, ey), (ex + ew, ey + eh), (0, 255, 0), 2)
              s2 = '{}-{}.png'.format(row[2], count)
              count = count + 1
              cv2.imwrite(os.path.join(driname,s2), crop_eye)

              sql = ("UPDATE tb_image SET TRAINING_IMAGE = (%s), TRAINING_DIR = (%s) WHERE ID_KARYAWAN= (%s)")
              cursor.execute(sql,(s1,driname,id))
              cnx.commit()
              #print(cursor.rowcount, "record(s) affected")
