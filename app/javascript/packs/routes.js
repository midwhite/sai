import Topics        from './components/topics';
import Topic         from './components/topics/show';
import Dictionary    from './components/dictionaries';
import Teams         from './components/teams';
import Notifications from './components/notifications';
import Settings      from './components/settings';
import PageNotFound  from './components/not_found';

const routes = {
  routes: [
    { path: "/",              component: Topics },
    { path: "/_=_",           redirect: "/" },
    { path: "/topics/:id",    component: Topic },
    { path: "/dictionary",    component: Dictionary },
    { path: "/teams",         component: Teams },
    { path: "/notifications", component: Notifications },
    { path: "/settings",      component: Settings },
    { path: "*",              component: PageNotFound }
  ]
};

export default routes;