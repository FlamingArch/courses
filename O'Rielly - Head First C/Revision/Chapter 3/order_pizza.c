#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    char *delivery = "";
    int thick = 0;
    int count = 0;
    char ch;
    while ((ch = getopt(argc, argv, "d:t")))
        switch (ch)
        {
        case 'd':
            delivery = optarg;
            break;
        case 't':
            thick = 1;
            break;
        default:
            fprintf(stderr, "Unknown Option: '%s'\n", optarg);
            return 1;
            break;
        }

    argc -= optind;
    argv += optind;

    if (thick)
        puts("Thick Crust");
    if (delivery[0])
        printf("To be delivered: %s.\n", delivery);

    puts("Ingredients:");
    for (count = 0; count < argc; count++)
        puts(argv[count]);

    return 0;
}
