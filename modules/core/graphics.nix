_:

{
  hardware.graphics.enable = true;

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };

  # Uncomment if you install the proprietary NVIDIA driver.
  # services.xserver.videoDrivers = [ "nvidia" ];
}
