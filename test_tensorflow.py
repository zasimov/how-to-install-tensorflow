import tensorflow as tf

class SquareTest(tf.test.TestCase):

  def testSquare(self):
    with self.test_session():
      x = tf.square([2, 3])
      self.assertAllEqual(x.eval(), [4, 9])

  def testHelloWorld(self):
    # Create TensorFlow object called tensor
    hello_constant = tf.constant('Hello World!')

    with self.test_session() as sess:
      # Run the tf.constant operation in the session
      output = sess.run(hello_constant)
      self.assertEqual(output, b'Hello World!')

if __name__ == '__main__':
  tf.test.main()