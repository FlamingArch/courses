import React from "react";

// function FRInput() {
//   return (
//     <div>
//       <input type="text" name="" id="" />
//     </div>
//   );
// }

const FRInput = React.forwardRef((props, ref) => {
  return (
    <div>
      <input type="text" ref={ref} />
    </div>
  );
});

export default FRInput;
