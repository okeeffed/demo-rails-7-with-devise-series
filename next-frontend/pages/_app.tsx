import "../styles/globals.css";
import type { AppProps } from "next/app";
import { useEffect } from "react";
import { useRouter } from "next/router";
import axios from "../lib/axios";

function MyApp({ Component, pageProps }: AppProps) {
  const router = useRouter();

  useEffect(() => {
    axios.get("http://localhost:3000/session");
  }, [router.asPath]);

  return <Component {...pageProps} />;
}

export default MyApp;
