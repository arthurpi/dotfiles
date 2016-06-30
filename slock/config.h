static const char *colorname[NUMCOLS] = {
	"black",     /* after initialization */
	"#222222",   /* during input */
	"#CC3333",   /* wrong password */
};

/* treat a cleared input like a wrong password */
static const int failonclear = 1;
