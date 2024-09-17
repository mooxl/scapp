import { cache } from "@/utils/api";
import { useLoaderData } from "@remix-run/react";

export const clientLoader = async () => {
  const test = await cache.user.test.ensureData();
  return { test };
};

const Page = () => {
  const data = useLoaderData<typeof clientLoader>();
  return <h1>{data.test}</h1>;
};

export default Page;
