import Topics        from './components/topics';
import ShowTopic     from './components/topics/show';
import Users         from './components/users';
import ShowUser      from './components/users/show';
import Dictionary    from './components/dictionaries';
import Teams         from './components/teams';
import Notifications from './components/notifications';
import Settings      from './components/settings';
import EditProfile   from './components/settings/edit_profile';
import PageNotFound  from './components/not_found';

const routes = {
  routes: [
    { path: "/",              component: Topics },
    { path: "/_=_",           redirect: "/" },
    { path: "/topics/:id",    component: ShowTopic },
    { path: "/users",         component: Users },
    { path: "/users/:id",     component: ShowUser },
    { path: "/dictionary",    component: Dictionary },
    { path: "/teams",         component: Teams },
    { path: "/notifications", component: Notifications },
    { path: "/settings",      component: Settings },
    { path: "/settings/profile", component: EditProfile },
    { path: "*",              component: PageNotFound }
  ]
};

export default routes;