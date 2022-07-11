import React from "react";

export const Input = (props) => {
  return (
    <div>
      <input type="{props.type}" placeholder="{props.placeholder}" />
    </div>
  );
};
