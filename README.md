# A lightweight PHP Composer image with pcov for CI pipelines.

This image is a minimal rebuild of the Composer Alpine docker image, adding pcov to support coverage analysis
in CI/CD pipelines without adding significant size to the image, nor requiring substantially increased build times
to report coverage.
