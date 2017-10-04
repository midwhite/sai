import Topics       from './components/topics';
import Dictionary   from './components/dictionaries';
import Teams        from './components/teams';
import Settings     from './components/settings';
import PageNotFound from './components/not_found';

const routes = {
  routes: [
    { path: "/",           component: Topics },
    { path: "/_=_",        redirect: "/" },
    { path: "/dictionary", component: Dictionary },
    { path: "/teams",      component: Teams },
    { path: "/settings",   component: Settings },
    { path: "*",           component: PageNotFound }
  ]
};

export default routes;