<sv-login-form>
    <form class="form-signin" onsubmit={ login }>
        <h1>Stats Viewer</h1>
        <img class="mb-4" src="../common/logo.png" alt="Stats Engine logo"
                                                   width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>

        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email"
               id="inputEmail"
               class="form-control"
               placeholder="Email address"
               onkeyup={ editUsername } required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password"
               id="inputPassword"
               class="form-control"
               placeholder="Password"
               onkeyup={ editPassword } required>

        <button class="btn btn-lg btn-primary btn-block" type="submit">
            Sign in
        </button>
    </form>

    <script>
        login (e) {
            e.preventDefault();
            var username = document.getElementById('inputEmail').value;
            var password = document.getElementById('inputPassword').value;
            new WebService().login(username, password, loginCallback);
        }

        /**
         * Stores the session data and redirects to results view
         * @param {Object} data - The fetched data
         */
        function loginCallback (data) {
            sessionStorage.setItem('session', JSON.stringify(data));
            window.location = '/index.html'; // Will decide which view to load
        }
    </script>
</sv-login-form>
