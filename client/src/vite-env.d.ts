/// <reference types="vite/client" />

interface ImportMeta {
  readonly env: {
    readonly VITE_AUTH0_DOMAIN: string;
    readonly VITE_AUTH0_CLIENT_ID: string;
    readonly VITE_AUTH0_AUDIENCE?: string;
    readonly [key: string]: string | undefined;
  };
}
