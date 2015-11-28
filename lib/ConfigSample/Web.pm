package ConfigSample::Web;
use Mojo::Base 'Mojolicious';
use Path::Class;

# This method will run once at server start
sub startup {
  my $self = shift;

  # config
  $self->_load_config();

  warn "1" x 100;
  warn $self->mode;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
}

sub _load_config {
  my $self = shift;
  my $home = new Path::Class::File(__FILE__);
  my $root = $home->dir->resolve->absolute->parent->parent();

  # 環境によってsuffixを分ける
  my $suffix = $self->mode eq 'production' ? '_prd' : '_dev';
  for my $e ( qw/web db/ ) {
    my $f = $root->stringify . '/etc/' . $e . $suffix . '.conf';
    $self->plugin( 'Config', { 'file' => $f } );
  }
}

1;
