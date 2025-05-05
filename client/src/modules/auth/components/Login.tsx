import { useAuth0 } from "@auth0/auth0-react";
import { Button, Stack, Title } from "@mantine/core";

function Login() {
  const { loginWithRedirect, isLoading } = useAuth0();

  const handleLogin = () => {
    loginWithRedirect();
  };

  return (
    <Stack align="center" mt={100}>
      <Title ta="center" order={2} c="gray.9">
        EMR Migrations
      </Title>
      <Button
        onClick={handleLogin}
        loading={isLoading}
        size="sm"
        radius="xl"
        miw={180}
        bg="blue"
      >
        Log In
      </Button>
    </Stack>
  );
}

export { Login };
