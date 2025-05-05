import { useAuth0 } from "@auth0/auth0-react";
import { Flex, LoadingOverlay } from "@mantine/core";
import { Login } from "./modules/auth/components/Login";
import backgroundImg from "./assets/background-welcome.jpg";

function App() {
  const { isAuthenticated, isLoading } = useAuth0();

  if (!isAuthenticated && !isLoading) {
    return (
      <Flex
        mih="100vh"
        justify="center"
        style={{
          backgroundImage: `url(${backgroundImg})`,
          backgroundSize: "cover",
          backgroundPosition: "center",
        }}
      >
        <Login />
      </Flex>
    );
  }

  return (
    <Flex
      pos="relative"
      h="100vh"
      style={{
        backgroundImage: `url(${backgroundImg})`,
        backgroundSize: "cover",
        backgroundPosition: "center",
      }}
    >
      <LoadingOverlay
        visible={isLoading}
        zIndex={1000}
        overlayProps={{ radius: "sm", blur: 2 }}
        loaderProps={{ color: "blue", type: "bars" }}
      />

      {isAuthenticated && (
        <div>
          {/* Your authenticated application content will go here */}
          <h1>Welcome to EMR Migrations</h1>
          <p>You are now logged in!</p>
        </div>
      )}
    </Flex>
  );
}

export default App;
