# Revisions

## Arrays
Collection of same types of elements.

```c
int a[5];
```

### Memory Regions
<table>
  <tr>
    <td style="border:0"> Heap </td>
    <td style="height: 125px; border: 1px solid gray"></td>
  </tr>
  <tr>
    <td style="border:0"> Stack </td>
    <td style="height: 125px; border: 1px solid gray; display: flex; flex-direction: column-reverse; padding: 0px">
      <table style="border-top: 1px solid gainsboro; padding: 1rem; padding-bottom: 0rem;">
        <td style="width:16px; text-align:center; height:20px; border:0px solid gray">a</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">1</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">3</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">5</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">7</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">9</td>
        <td style="width:16px; text-align:center; height:20px; border:0px solid gray">b</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">2</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">4</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">6</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">8</td>
        <td style="width:16px; text-align:center; height:20px; border:1px solid gray">10</td>
      </table>
    </td>
  </tr>
  <tr>
    <td style="border:0"> Code Section </td >
    <td style="height: 125px; border: 1px solid gray"></td>
  </tr>
</table>

```c
#include <stdio.h>

int main()
{
  int a[5] = {1, 3, 5, 7, 9};
  int b[5] = {2, 4, 6, 8, 10};

  for (int i = 0; i < 5; i++)
  {
    printf("%d", a[i]);
  }
  for (int i = 0; i < 5; i++)
  {
    printf("%d", b[i]);
  }
}

```
