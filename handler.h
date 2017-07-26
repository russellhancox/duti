struct roles {
  const char *r_role;
  LSRolesMask r_mask;
};

extern int nroles;

#define UTID_TYPE_URL_HANDLER 2
#define UTID_TYPE_UTI_HANDLER 3

int set_uti_handler(CFStringRef, CFStringRef, LSRolesMask);
int set_url_handler(CFStringRef, CFStringRef);
int fsethandler(char *);
int psethandler(char *);
int dirsethandler(char *);

int uti_handler_show(char *uti, int showall);
int url_handler_show(char *url_scheme);
int utid_handler_set(char *, char *, char *);
int utid_default_app_for_extension(char *);
int utid_default_app_for_type(char *);
int utid_urls_for_url(char *);
int utid_is_conformant_uti(CFStringRef);
int utid_utis(char *);
int utid_utis_for_extension(char *);
