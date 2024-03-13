# Microsoft Learn Achievements Fetcher

> Getting Microsoft Learn achievements as JSON.

This robot fetches the Microsoft Learn achievements from the user profile and
returns them as a JSON file.

## Requirements

- Python 3.12 or higher
- Poetry

## Setup

1. Clone the repository:

    ```sh
    git clone https://github.com/xuandogg/msl-achievements.git
    cd msl-achievements
    ```

2. Activate the virtual environment and install the dependencies with Poetry:

    ```sh
    poetry env use python
    poetry shell
    poetry install
    ```

3. Install the node dependencies for the Browser Library:

    ```sh
    rfbrowser init
    ```

## Usage

Run the robot with the following command:

```sh
robot -d reports -v USER:<user_name> ./tasks/get_achievements.robot
```

Replace `<user_name>` with the Microsoft Learn username as shown in the URL
when visiting the profile page. For example, if the URL is
`https://learn.microsoft.com/en-us/users/xuandogg/`, then the username is
`xuandogg`.

Other available variables are:

- `HEADLESS`: Set to `False` to show the browser window.
- `TYPE`: Set to one of `trophies`, `modules`, `course` or `other` to
    filter the achievements by type.

The JSON file will be saved in the `reports` directory (or the directory
specified in the `-d` option).

## License

This project is licensed under the GNU General Public License v3.0. See the
[LICENSE](LICENSE) file for details.

## Contributing

Contributions are what make the open source community such an amazing place to
learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the project.
2. Create your feature branch.
3. Make and commit your changes.
4. Push to the branch.
5. Open a pull request.