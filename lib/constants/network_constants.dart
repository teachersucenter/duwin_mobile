import 'package:aad_oauth/model/config.dart';

const String DUWIN_LOGIN = 'https://api.teachersucenter.com/api/duwin/login';
Config OAUTH_CONFIG = Config(
  tenant: '3f4367cb-4bb1-42b2-b736-16999c3c8c3a',
  clientId: '08d70121-f0ef-49cd-9ae7-20c7232faba1',
  scope: 'openid profile offline_access User.Read',
  redirectUri: 'https://login.microsoftonline.com/common/oauth2/nativeclient',
);
