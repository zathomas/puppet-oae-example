import 'manifests/*'
import 'nodes'

stage { 'init': before => Stage['first'] }
stage { 'first': before => Stage['main'] }
stage { 'last': require => Stage['main'] }

Exec { path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin' }

class {
      'centos': stage => init;
      'users': stage => init;
      'preview_processor': stage => first;
      'preview_processor::openoffice': stage => main;
      'preview_processor::gems':   stage => last;
}
