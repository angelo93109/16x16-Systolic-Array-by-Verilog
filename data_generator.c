#include<stdio.h>

int main() {
    // modify the following four lines to fit the parameters of each layer
    const int channel = 4;
    const int input_size = 16;
    const int kernel_size = 2;
    const int filter_num = 16;

    // ------------------------------------------------------------generate input memory file------------------------------------------------------------
    FILE* input_mem = fopen("input.mem", "w");

    int input_map[16][(input_size - kernel_size + 1) * (input_size - kernel_size + 1) + 15];
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < (input_size - kernel_size + 1) * (input_size - kernel_size + 1) + 15; j++) {
            input_map[i][j] = 0;
        }
    }

    //set input data
    int input_data[input_size][input_size][channel];
    for (int i = 0; i < input_size; i++) {
        for (int j = 0; j < input_size; j++) {
            for (int k = 0; k < channel; k++) {
                input_data[i][j][k] = 1;
            }
        }
    }

    //arrange input data to the order that systolic array needs
    for (int c = 0; c < channel; c++) {
        for (int i = 0; i < input_size - kernel_size + 1; i++) {
            for (int j = 0; j < input_size - kernel_size + 1; j++) {
                for (int k = 0; k < kernel_size; k++) {
                    for (int l = 0; l < kernel_size; l++) {
                        input_map[k * kernel_size + l + c * kernel_size * kernel_size][(i * (input_size - kernel_size + 1) + j) + (k * kernel_size + l) + (c * kernel_size * kernel_size)]
                            = input_data[i + k][j + l][c];
                    }
                }
            }
        }
    }

    for (int j = 0; j < (input_size - kernel_size + 1) * (input_size - kernel_size + 1) + 15; j++) {
        for (int i = 0; i < 16; i++) {
            fprintf(input_mem, "%02x\n", input_map[i][j]);
        }
    }
    fclose(input_mem);


    // ------------------------------------------------------------generate weight memory file------------------------------------------------------------
    FILE* weight_mem = fopen("weight.mem", "w");
    int weight_data[kernel_size * kernel_size * channel][filter_num];
    // set weight data
    for (int i = 0; i < kernel_size * kernel_size * channel; i++) {
        for (int j = 0; j < filter_num; j++) {
            weight_data[i][j] = 1;
        }
    }

    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {
            if (i < kernel_size * kernel_size * channel && j < filter_num) {
                fprintf(weight_mem, "%02x\n", weight_data[i][j]);
            }
            else {
                fprintf(weight_mem, "%02x\n", 0);
            }
        }
    }
    fclose(weight_mem);
}
