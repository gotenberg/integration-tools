# Integration Tools

> [!WARNING]
> This repository is archived. [Gotenberg 9](https://github.com/gotenberg/gotenberg/releases/tag/v9.0.0) asserts its integration tests with [litho](https://github.com/gotenberg/litho), its own PDF engine, and no longer needs this image. Gotenberg 8's test suite is the last to use it.

> [!NOTE]  
> This image provides integration testing tools for Gotenberg.

## Build from Source

To compile the project from source, run:

```bash
make build
```

If you need to update the VeraPDF version, first edit the version number in the `.env` file, then execute:

```bash
make download-verapdf build
```