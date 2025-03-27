#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>
#include <time.h>
#include <pwd.h>
#include <grp.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char *name;
    struct stat stat;
    char owner[32];
    char group[32];
} FileInfo;

void get_max_widths(FileInfo *files, int count,
                   int *max_links, int *max_owner,
                   int *max_group, int *max_size) {
    *max_links = 0;
    *max_owner = 0;
    *max_group = 0;
    *max_size = 0;

    for (int i = 0; i < count; i++) {
        int len;

        // 硬链接数宽度
        len = snprintf(NULL, 0, "%ld", (long)files[i].stat.st_nlink);
        if (len > *max_links) *max_links = len;

        // 所有者宽度
        len = strlen(files[i].owner);
        if (len > *max_owner) *max_owner = len;

        // 所属组宽度
        len = strlen(files[i].group);
        if (len > *max_group) *max_group = len;

        // 文件大小宽度
        len = snprintf(NULL, 0, "%ld", (long)files[i].stat.st_size);
        if (len > *max_size) *max_size = len;
    }
}

void print_file_info(FileInfo *file,
                    int max_links, int max_owner,
                    int max_group, int max_size) {
    char time_str[80];

    // 文件类型和权限
    printf((S_ISDIR(file->stat.st_mode)) ? "d" : "-");
    printf((file->stat.st_mode & S_IRUSR) ? "r" : "-");
    printf((file->stat.st_mode & S_IWUSR) ? "w" : "-");
    printf((file->stat.st_mode & S_IXUSR) ? "x" : "-");
    printf((file->stat.st_mode & S_IRGRP) ? "r" : "-");
    printf((file->stat.st_mode & S_IWGRP) ? "w" : "-");
    printf((file->stat.st_mode & S_IXGRP) ? "x" : "-");
    printf((file->stat.st_mode & S_IROTH) ? "r" : "-");
    printf((file->stat.st_mode & S_IWOTH) ? "w" : "-");
    printf((file->stat.st_mode & S_IXOTH) ? "x" : "-");
    printf(" ");

    // 硬链接数 (右对齐)
    printf("%*ld ", max_links, (long)file->stat.st_nlink);

    // 所有者 (左对齐)
    printf("%-*s ", max_owner, file->owner);

    // 所属组 (左对齐)
    printf("%-*s ", max_group, file->group);

    // 文件大小 (右对齐)
    printf("%*ld ", max_size, (long)file->stat.st_size);

    // 修改时间
    strftime(time_str, sizeof(time_str), "%b %d %H:%M", localtime(&file->stat.st_mtime));
    printf("%s ", time_str);

    // 文件名
    printf("%s\n", file->name);
}

int compare_files(const void *a, const void *b) {
    const FileInfo *fa = (const FileInfo *)a;
    const FileInfo *fb = (const FileInfo *)b;
    return strcmp(fa->name, fb->name);
}

int main(int argc, char *argv[]) {
    DIR *dir;
    struct dirent *entry;
    const char *path = ".";
    FileInfo *files = NULL;
    int file_count = 0;
    int capacity = 0;

    if (argc > 1) {
        path = argv[1];
    }

    if ((dir = opendir(path)) == NULL) {
        perror("opendir");
        return 1;
    }

    // 第一次遍历：收集所有文件信息
    while ((entry = readdir(dir)) != NULL) {
        if (entry->d_name[0] == '.') {
            continue; // 跳过隐藏文件
        }

        // 动态数组扩容
        if (file_count >= capacity) {
            capacity = capacity == 0 ? 16 : capacity * 2;
            files = realloc(files, capacity * sizeof(FileInfo));
            if (!files) {
                perror("realloc");
                closedir(dir);
                return 1;
            }
        }

        FileInfo *file = &files[file_count];
        file->name = strdup(entry->d_name);
        if (!file->name) {
            perror("strdup");
            closedir(dir);
            return 1;
        }

        char full_path[1024];
        snprintf(full_path, sizeof(full_path), "%s/%s", path, entry->d_name);

        if (stat(full_path, &file->stat) < 0) {
            perror("stat");
            free(file->name);
            continue;
        }

        // 获取所有者名称
        struct passwd *pwd = getpwuid(file->stat.st_uid);
        if (pwd) {
            strncpy(file->owner, pwd->pw_name, sizeof(file->owner));
        } else {
            snprintf(file->owner, sizeof(file->owner), "%d", file->stat.st_uid);
        }

        // 获取所属组名称
        struct group *grp = getgrgid(file->stat.st_gid);
        if (grp) {
            strncpy(file->group, grp->gr_name, sizeof(file->group));
        } else {
            snprintf(file->group, sizeof(file->group), "%d", file->stat.st_gid);
        }

        file_count++;
    }

    closedir(dir);

    // 按文件名排序
    qsort(files, file_count, sizeof(FileInfo), compare_files);

    // 计算各列最大宽度
    int max_links, max_owner, max_group, max_size;
    get_max_widths(files, file_count, &max_links, &max_owner, &max_group, &max_size);

    // 第二次遍历：打印对齐的输出
    for (int i = 0; i < file_count; i++) {
        print_file_info(&files[i], max_links, max_owner, max_group, max_size);
    }

    // 释放内存
    for (int i = 0; i < file_count; i++) {
        free(files[i].name);
    }
    free(files);

    return 0;
}
