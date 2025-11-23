# ublueniri

Fedora bootc image created from Universal Blue's template.
https://github.com/ublue-os/image-template

Once you have the repository on your local drive, proceed to the next step.

## Switch to the Image

From your bootc system, run the following command substituting in your Github username and image name where noted.
```bash
sudo bootc switch ghcr.io/<username>/<image_name>
```
This should queue your image for the next reboot, which you can do immediately after the command finishes. You have officially set up your custom image! See the following section for an explanation of the important parts of the template for customization.

