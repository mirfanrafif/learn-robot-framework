# Robot Framework Automation Testing

This project contains Robot Framework test automation examples and setup.

## Setup

1. **Activate Virtual Environment**

   ```bash
   source virtualenv/bin/activate
   ```

2. **Install Additional Libraries** (optional)
   ```bash
   pip install -r requirements.txt
   ```

## Project Structure

```
.
├── tests/                  # Test suites
│   ├── example_test.robot # Basic test examples
│   └── web_example.robot  # Web automation examples
├── resources/             # Reusable keywords and resources
│   └── common_keywords.robot
├── results/              # Test execution results (created automatically)
└── virtualenv/           # Python virtual environment
```

## Running Tests

### Run all tests

```bash
robot tests/
```

### Run specific test file

```bash
robot tests/example_test.robot
```

### Run tests with specific tag

```bash
robot --include basic tests/
```

### Run tests and specify output directory

```bash
robot --outputdir results tests/
```

### Run tests with different log levels

```bash
robot --loglevel DEBUG tests/
```

## Test Reports

After running tests, Robot Framework generates:

- **report.html** - High-level test execution report
- **log.html** - Detailed test execution log
- **output.xml** - Machine-readable test results

## Common Commands

```bash
# Run tests and open report
robot tests/ && xdg-open report.html

# Run specific test case
robot --test "Simple Arithmetic Test" tests/example_test.robot

# List all keywords in a library
robot --libdoc SeleniumLibrary list

# Generate library documentation
python -m robot.libdoc SeleniumLibrary SeleniumLibrary.html
```

## Learning Resources

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Robot Framework Standard Libraries](https://robotframework.org/robotframework/#standard-libraries)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/)

## Tips

1. Use meaningful test case names
2. Add documentation to tests and keywords
3. Use tags for test organization
4. Keep keywords reusable and in resource files
5. Use variables for test data
