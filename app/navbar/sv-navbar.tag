<sv-navbar>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Stats Viewer</a>
        <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
                <a class="nav-link" href="#" onclick={ logout }>Sign out</a>
            </li>
        </ul>
    </nav>

    <script>
        logout () {
            var session = JSON.parse(sessionStorage.getItem('session'));
            new WebService().logout(session.token, logoutCallback);
        }

        /**
         * Disconnects the user and redirects to login page
         */
        function logoutCallback () {
            sessionStorage.removeItem('session');
            window.location = '/index.html'; // Will decide which view to load
        }
    </script>
</sv-navbar>
