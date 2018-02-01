defmodule Stream2 do
  use Application
  def decompose() do
     source ="rtmp://media.evercam.io:1935/live/i94B7mV5ZDf6HgXdWxqrEGD4uolWdYvL_ARPEDnGCCgPlJP0GY_HlrklREioDF2cozPLnJxLITtX\
     KY62QCTbgQsHa5-Tfo_SEHeFhZCfhjnIQEtoWhLEa3bEQ720weLiQKtyUnzdYofZcMph8IwHhQ==?camera_id=abcdrumcondra"
     output="rtmp://a.rtmp.youtube.com/live2/rwkw-s4ky-rjws-405c"
     command= "-f lavfi -i anullsrc -i  #{source} -tune zerolatency -vcodec libx264 -pix_fmt + -c:v copy -c:a aac   -strict experimental -f flv #{output}"
     commandlist= String.split("#{command}")

   end

   def stream() do
     source ="rtmp://media.evercam.io:1935/live/i94B7mV5ZDf6HgXdWxqrEGD4uolWdYvL_ARPEDnGCCgPlJP0GY_HlrklREioDF2cozPLnJxLITtXKY62QCTbgQsHa5-Tfo_SEHeFhZCfhjnIQEtoWhLEa3bEQ720weLiQKtyUnzdYofZcMph8IwHhQ==?camera_id=abcdrumcondra"
     output="rtmp://a.rtmp.youtube.com/live2/rwkw-s4ky-rjws-405c"
     command= "-f lavfi -i anullsrc -i  #{source} -tune zerolatency -vcodec libx264 -pix_fmt + -c:v copy -c:a aac   -strict experimental -f flv #{output}"
     commandlist= String.split("#{command}")

     System.cmd("ffmpeg",  List.flatten(commandlist)   )
   end
   def main(args) do
     stream()
   end
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec
    stream()
    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Stream2.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Stream2.Endpoint, []),
      # Start your own worker by calling: Stream2.Worker.start_link(arg1, arg2, arg3)
      # worker(Stream2.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stream2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Stream2.Endpoint.config_change(changed, removed)
    :ok
  end
end
