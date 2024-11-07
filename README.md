# Devcontainer Feature: Doppler CLI on Alpine

This is a [Dev Container Feature](https://containers.dev/implementors/features/) that adds the [Doppler CLI](https://docs.doppler.com/docs/cli-overview) to an Alpine Linux-based dev container.

## Usage

To use this feature, add the following to your `devcontainer.json` file:

```json
{
  "features": {
    "ghcr.io/topoutgroup/doppler-cli:1.0.0": {}
  }
}
```

This will install the Doppler CLI in your dev container, making it available for use in your development workflows.

## Testing

This feature includes a test suite that can be run using the `devcontainer features test` command. To run the tests, follow these steps:

1. Clone the repository containing this feature.
2. Update the `tests/_global/scenarios.json` file to include the `doppler-cli` feature:

```json
{
  "doppler": {
    "image": "mcr.microsoft.com/devcontainers/base:alpine",
    "features": {
      "doppler": {
        "completion": "true"
      }
    }
  }
}
```

3. Run the test suite using the following command:

```
devcontainer features test --global-scenarios-only .
```

This will create a dev container based on the scenario defined in `scenarios.json`, install the Doppler CLI feature, and run the test suite to ensure the feature is working as expected.

## Contributing

If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request. Contributions are always welcome!

## License

This project is licensed under the [MIT License](LICENSE).