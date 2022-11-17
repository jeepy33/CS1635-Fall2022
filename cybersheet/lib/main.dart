import 'package:cybersheet/presenter/presenter.dart';
import 'package:cybersheet/model/model.dart';
import 'package:flutter/material.dart';

import 'router.dart' as LocalRouter;
import 'constants.dart';

Presenter presenter = new Presenter();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text('Home'),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushNamed(context, newCharRoute,
                  arguments: 'arguments/chose NEW');
            },
            child: const Text('New Edgerunner'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushNamed(context, newCharRoute,
                  arguments: 'arguments/chose EDIT');
            },
            child: const Text('Edit Edgerunner'),
          )
        ],
      )),
    );
  }
}

class newChar extends StatelessWidget {
  final String data;

  newChar(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('New: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, templatesRoute,
                    arguments: 'arguments/chose Templates');
                presenter.model.character.setTemplate(Template.STREETRAT);
              },
              child: const Text('Street Rat'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, templatesRoute,
                    arguments: 'arguments/chose Templates');
                presenter.model.character.setTemplate(Template.EDGERUNNER);
              },
              child: const Text('Edgerunner'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, templatesRoute,
                    arguments: 'arguments/chose Templates');
                presenter.model.character.setTemplate(Template.COMPLETE);
              },
              child: const Text('Complete Package'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class TemplatesPage extends StatelessWidget {
  final String data;

  TemplatesPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Templates: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, rolePage,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Roles'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class LifePath extends StatelessWidget {
  final String data;

  LifePath(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Templates: $data'),
            Text('Role: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, confirmationRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('confirm'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class RolePart extends StatelessWidget {
  final String data;
  RolePart(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Role: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, LifePath2Page,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Life Path 1'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class LifePath2 extends StatelessWidget {
  final String data;

  LifePath2(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('LifePath2: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, LifePath3Page,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Life Path 2'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class LifePath3 extends StatelessWidget {
  final String data;

  LifePath3(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('LifePath3: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, friendsRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Friends'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class Friends extends StatelessWidget {
  final String data;

  Friends(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Friends: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, enemiesRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Enemies'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class Enemies extends StatelessWidget {
  final String data;

  Enemies(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Enemies: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, lifeGoalsRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Life Goals'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class LifeGoals extends StatelessWidget {
  final String data;

  LifeGoals(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('LifeGoals: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}

class editChar extends StatelessWidget {
  final String data;

  editChar(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Edit: $data'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back...'),
            )
          ],
        ),
      ),
    );
  }
}
