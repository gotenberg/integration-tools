# PDF Tools

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