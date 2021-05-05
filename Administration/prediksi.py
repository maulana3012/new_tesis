import os
import cv2
import numpy as np

# Image Size
w = 200
h = 200


# euclidean distance
def dist(x, y):
    return np.sqrt(np.sum((x - y) ** 2))


inputImageToPredict = 'asset/_upload/data/Muhamad Maulana/601c01c244ec31.72106975.jpg601c01c244ec31.72106975.jpg'


def main():
    img = cv2.imread(inputImageToPredict, cv2.IMREAD_GRAYSCALE)  # get grayscale image
    img_resized = cv2.resize(img, (w, h))

    imgBlurred = cv2.GaussianBlur(img_resized, (5, 5), 0)  # blur

    imgThresh = cv2.adaptiveThreshold(imgBlurred, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11,
                                      2)  # threshold

    cv2.imshow('Test Image', imgThresh)

    npaFlattenedImage = imgThresh.reshape((1, w * h))
    print(npaFlattenedImage.shape)
    mean_to = npaFlattenedImage.mean()

    m = []

    vowels = ['Muhamad Maulana']
    cnt = 0
    for v in vowels:
        print('Read ' + v + ' mean image from directory !')
        f = 'asset/_upload/trained/pca_face_' + v + '.png'
        print(f)

        img2 = cv2.imread(f, cv2.IMREAD_GRAYSCALE)
        img_resized2 = cv2.resize(img2, (w, h))
        imgBlurred2 = cv2.GaussianBlur(img_resized2, (5, 5), 0)
        imgThresh2 = cv2.adaptiveThreshold(imgBlurred2, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)
        npaFlattenedImage2 = imgThresh2.reshape((1, w * h))

        distance = dist(npaFlattenedImage, npaFlattenedImage2)
        # distance vector
        m.append(distance);

    # Distance array
    print('Euclidean Distance Array: ')
    print(m)
    # Min Distance
    print('Min Distance: ')
    print(min(m))
    # Array Position
    print('Array Position: ')
    pos = m.index(min(m))
    print(pos)
    # Vowel Recognized
    print('The Face Recognized Is : ')
    print(vowels[pos])

    cv2.waitKey(0)
    cv2.destroyAllWindows()
if __name__ == "__main__":
    main()