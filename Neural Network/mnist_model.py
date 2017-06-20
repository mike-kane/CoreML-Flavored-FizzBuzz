from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, Dropout, Dense, Flatten
from keras.utils import np_utils
import coremltools

# Let's load our data set straight from Keras to save time.
# It's already split into training and testing, too!
(X_train, y_train), (X_test, y_test) = mnist.load_data()

# We're going to resize everything to 28 by 28, so lets set that size
img_width = 28
img_height = 28

#  Now we need to reshape our training and testing data.
#  We'll explicitly set the data type as a 32bit float
# Then we'll divide everything by 255.
X_train = X_train.astype("float32")
X_train /= 255.
X_test = X_test.astype("float32")
X_test /= 255.



# Now we'll finish data preparation by reshaping our image data
X_train = X_train.reshape(X_train.shape[0], img_width, img_height, 1)
X_test = X_test.reshape(X_test.shape[0], img_width, img_height, 1)


# Now we need to reshape our labels for one-hot encoding.
y_train = np_utils.to_categorical(y_train)
y_test = np_utils.to_categorical(y_test)
num_classes = y_test.shape[1]

#  We're done with data manipulation--let's set up our model!
#  First, we'll create our model object.
model = Sequential()
#  Now, we'll add a 2D Convolutional Neural Network.
model.add(Conv2D(8, (5, 5), input_shape=(img_width, img_height, 1), activation="relu"))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Dropout(0.2))
model.add(Flatten())
model.add(Dense(32, activation="relu"))
model.add(Dense(num_classes, activation="softmax"))
# TODO:  Port code to python2 so that it will work with CoreML
# TODO:  Add comments explaining methodology for rest of model
# TODO:  Export model with CoreML library.
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=["accuracy"])
model.summary()
model.fit(X_train, y_train, validation_data=(X_test, y_test))


coreml_model = coremltools.converters.keras.convert(model)
coreml_model.author = "Mike Kane"
coreml_model.short_description = "Handwritten digit recognizer trained on the mnist data set"
coreml_model.save('mnist.mlmodel')
