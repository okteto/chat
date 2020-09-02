# Rails on Okteto Demo

## Prerequisites

- Okteto CLI >= 1.8.17. Follow this [guide](/docs/getting-started/installation) to upgrade to the latest version.

## Deploy

Deploy the **Chat App** on Okteto by clicking the following button:

[![Develop on Okteto](https://okteto.com/develop-okteto.svg)](https://cloud.okteto.com/deploy?repository=https://github.com/okteto/chat)

## Develop

Once your app is **Running**, execute the following command to activate your development container:

```command
$ okteto up
```

```
 ✓  Development container activated
 ✓  Files synchronized
    Namespace: pablo
    Name:      web
    Forward:   1234 -> 1234
               5234 -> db:5234

Welcome to your development container. Happy coding!
pablo:web app>
```

From the development container shell, install the gem files and yarn dependencies by executing the following command:

```command
pablo:web app> make install
```

> You only need to run `make install` the first time you activate your development container. Any time in the future you activate your development container again, all your dependencies are persisted in the okteto persistent volume.

Run the app by executing the following command:

```command
pablo:web app> make start
```

Start the app in debug mode by executing the following command:

```command
pablo:web app> make debug
```

