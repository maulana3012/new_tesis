import os
import cv2
import numpy as np
import sys
import mysql.connector
from mysql.connector import connection

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

w=200
h=200

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
for row in records:
    count = 1
    face=['{}'.format(row[2])]
    def main():
        for v in face:
            in_matrix = None
            imgcnt = 0
            print('Read from: ' + v + ' Directory ')
            for f in os.listdir(os.path.join('asset/_upload/data/', v)):
                imgcnt += 1
                print(f)
                # Read the image in as a gray level image.
                img = cv2.imread(os.path.join('asset/_upload/data/', v, f), cv2.IMREAD_GRAYSCALE)
                img_resized = cv2.resize(img, (w, h))

                # let's resize them to w * h
                vec = img_resized.reshape(w * h)

                # stack them up to form the matrix
                try:
                    in_matrix = np.vstack((in_matrix, vec))
                except:
                    in_matrix = vec

                # PCA
            if in_matrix is not None:
                mean, eigenvectors = cv2.PCACompute(in_matrix, np.mean(in_matrix, axis=0).reshape(1, -1))

            img = unFlatten(mean.transpose(), w, h)  # Reconstruct mean to represent an image
            cv2.imwrite('asset/_upload/trained/pca_face_' + v + '.png', img)

        cv2.waitKey(0)
        cv2.destroyAllWindows()


    ###################################################################################################
    if __name__ == "__main__":
        main()
