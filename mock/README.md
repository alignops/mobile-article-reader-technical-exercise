# Offline mock data

`articles.json` is a trimmed copy of the live endpoint
(`https://jsonplaceholder.typicode.com/posts`), same shape. Use it if you have
no internet access.

Serve it locally from this `mock/` folder:

```bash
python3 -m http.server 8000
```

Then point each app at the local URL **instead of** the jsonplaceholder URL:

- **iOS simulator:** `http://localhost:8000/articles.json`
- **Android emulator:** `http://10.0.2.2:8000/articles.json`
  (the emulator reaches your machine via `10.0.2.2`, not `localhost`)

> Note: plain `http://` (not `https`) needs an ATS exception on iOS and a
> cleartext-traffic allowance on Android. The live `https` endpoint avoids that,
> so prefer it if you have a connection.
