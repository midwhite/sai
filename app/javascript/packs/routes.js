import Topics     from './components/topics';
import Dictionary from './components/dictionaries';
import Teams      from './components/teams';
import Settings   from './components/settings';

const routes = {
  routes: [
    { path: "/",           component: Topics },
    { path: "/dictionary", component: Dictionary },
    { path: "/teams",      component: Teams },
    { path: "/settings",   component: Settings }
  ]
};

export default routes;