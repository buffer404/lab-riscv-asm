#include <stdio.h>

#define N 5
#define M 4

void process(int n, int m, int matrix [M][N], int *result)
{
    int tmp_min = matrix[0][0];
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (tmp_min <= matrix[i][j]){
                tmp_min = matrix[i][j];
            }
        }
    }
    *result = tmp_min;
}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &result);

    printf("%d", result);

    return 0;
}