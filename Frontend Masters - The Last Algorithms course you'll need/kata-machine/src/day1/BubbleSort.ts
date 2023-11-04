export default function bubble_sort(arr: number[]): void {
    // // MY SOLUTION
    // for (let i = 0; i < arr.length; i++) {
    //     for (let j = 0; j < arr.length; j++) {
    //         if (arr[j - 1] > arr[j]) {
    //             let temp = arr[j];
    //             arr[j] = arr[j - 1];
    //             arr[j - 1] = temp;
    //         }
    //     }
    // }

    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length - i; j++) {
            if (arr[j - 1] > arr[j]) {
                let temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }
}
