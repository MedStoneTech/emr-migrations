import React from "react";
import ReactDOM from "react-dom/client";
import { Auth0Provider } from "@auth0/auth0-react";
import App from "./App";
import "./index.css";
import { auth0Config } from "./configs/auth0-config";
import { MantineProvider } from "@mantine/core";
import "@mantine/core/styles.css";
import { theme } from "./configs/theme";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <MantineProvider theme={theme}>
      <Auth0Provider
        domain={auth0Config.domain}
        clientId={auth0Config.clientId}
        authorizationParams={auth0Config.authorizationParams}
        useRefreshTokens
        cacheLocation="localstorage"
      >
        <App />
      </Auth0Provider>
    </MantineProvider>
  </React.StrictMode>
);
