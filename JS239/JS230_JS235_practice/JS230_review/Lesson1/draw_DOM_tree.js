// Given the HTML shown below, draw the DOM that the browser will construct when it loads the HTML. Determine which nodes are:

// elements,
// text nodes with nothing but whitespace,
// text nodes containing text,
// or comments.

<html>
  <head>
    <title>Newsletter Signup</title>
  </head>
  <body>
    {/* <!-- A short comment --> */}
    <h1>Newsletter Signup</h1>
    <p class="intro" id="simple">
      To receive our weekly emails, enter your email address below.
      <a href="info.html">Get more info</a>.
    </p>
    <div class="form">
      <form>
        <label>
          Enter your email:
          <input name="email" placeholder="user.name@domain.test"/>
        </label>
        <p class="controls">
          <button id="cancelButton">Cancel</button>
          <button type="submit" id="submitButton">Subscribe</button>
        </p>
      </form>
    </div>
  </body>
</html>

/*
                                      <html E>
                                     /        \
                                   head E     body E --------------
                                /   |   \       | \     \     \     \
                             tWS title E tWS    |  \     \     \     \
                                   |            |   \     \     \     \
                                  text     comment  tWS  h1E   tWS   p E
                                                          |
                                                          |
                                                          text
  stopped becaues it was taking too long to draw the whole thing out
*/