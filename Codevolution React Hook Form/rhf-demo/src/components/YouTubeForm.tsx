import {
  FieldErrors,
  // FieldValue,
  // get,
  useFieldArray,
  useForm,
} from "react-hook-form";
import { DevTool } from "@hookform/devtools";
// import { useEffect } from "react";

let renderCount = 0;

type FormValues = {
  username: string;
  email: string;
  channel: string;
  social: {
    twitter: string;
    facebook: string;
  };
  phoneNumbers: string[];
  phNumbers: { number: string }[];
  age: number;
  dob: Date;
};

export const YouTubeForm = () => {
  // const form = useForm<FormValues>();
  // const form = useForm({
  //   defaultValues: {
  //     username: "SampleUser",
  //     email: "sample@email.com",
  //     channel: "PewDiePie",
  //   },
  // });
  // const form = useForm({
  //   defaultValues: async () => {
  //     const url = "https://jsonplaceholder.typicode.com/users/1";
  //     const response = await fetch(url);
  //     const data = await response.json();
  //     return {
  //       username: "SampleUser",
  //       email: data.email,
  //       channel: "",
  //     };
  //   },
  // });
  const form = useForm<FormValues>({
    defaultValues: {
      username: "Batman",
      email: "",
      channel: "",
      social: {
        twitter: "",
        facebook: "",
      },
      phoneNumbers: ["", ""],
      phNumbers: [{ number: "" }],
      age: 0,
      dob: new Date(),
    },
  });

  const {
    register,
    control,
    handleSubmit,
    formState,
    watch,
    // getValues,
    setValue,
  } = form;

  const {
    errors,
    touchedFields,
    dirtyFields,
    isDirty,
    isValid,
    isSubmitting,
    isSubmitted,
    isSubmitSuccessful,
    submitCount,
  } = formState;

  // isSubmitting: False initially, is set to true when forms begin to be submitted, then false again when form submission has completed.
  // isSubmitted: False initially, is set to true when form submission completes, and stays true until the form is reset.
  // isSubmitSuccessful: False initially, It is set to true when form submission completes without errors (like validation error), and false otherwise
  // submitCount: 0 initially, is incremented by 1 every time form is successfully submitted.
  // console.log({ isSubmitting, isSubmitted, isSubmitSuccessful, submitCount });

  const { fields, append, remove } = useFieldArray({
    name: "phNumbers",
    control,
  });

  const onSubmit = (data: FormValues) => {
    console.log("Form Submitted: ", data);
  };

  const onError = (errors: FieldErrors<FormValues>) => {
    console.log("Field Errors: ", errors);
  };

  // touched: Checks if user has interacted with the field (focused then unfocused)
  // dirty: Checks if user has modified the input or not. It is compared with original value, so restoring old value restores dirty state to false.
  // console.log({ touchedFields, dirtyFields, isDirty });

  // getValues(): Get values by calling a function.
  // const handleGetValues = () => console.log(getValues());
  // const handleGetValues = () => console.log(getValues("social"));

  // setValue(): Set Values programmatically
  // const handleSetValues = () => setValue("username", "");
  // const handleSetValues = () =>
  //   setValue("username", "", {
  //     shouldValidate: true,
  //     shouldTouch: true,
  //     shouldDirty: true,
  //   });

  // watch(): Watch form values for change reactively
  // const watchUserame = watch();
  // const watchUserame = watch("username");
  // const watchUserame = watch(["username", "email"]);
  // useEffect(() => {
  //   const subscription = watch((value) => {
  //     console.log(value);
  //   });
  //   return () => subscription.unsubscribe();
  // }, [watch]);

  // const { name, ref, onChange, onBlur } = register("username");
  // noValidate: Prevent Browser Validation

  renderCount++;
  return (
    <div>
      <h1>YouTube Form ({renderCount / 2})</h1>
      {/* <h2>Watched Value: {JSON.stringify(watchUserame)}</h2> */}
      <form onSubmit={handleSubmit(onSubmit, onError)} noValidate>
        <div className="form-control">
          <label htmlFor="username">Username</label>
          <input
            type="text"
            id="username"
            // name={name}
            // onChange={onChange}
            // onBlur={onBlur}
            // ref={ref}
            {...register("username", {
              required: "Username is Required",
            })}
          />
          <p className="error">{errors.username?.message}</p>
        </div>

        <div className="form-control">
          <label htmlFor="email">Email</label>
          <input
            type="email"
            id="email"
            {...register("email", {
              pattern: {
                value: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g,
                message: "Invalid Email Format",
              },
              validate: {
                notAdmin: (fieldValue) => {
                  return (
                    fieldValue !== "admin@example.com" ||
                    "Enter a differents email address"
                  );
                },
                notBlackListed: (fieldValue) => {
                  return (
                    !fieldValue.endsWith("baddomain.com") ||
                    "This domain is not supported"
                  );
                },
              },
            })}
          />
          <p className="error">{errors.email?.message}</p>
        </div>

        <div className="form-control">
          <label htmlFor="channel">Channel</label>
          <input
            type="text"
            id="channel"
            {...register("channel", {
              required: {
                value: true,
                message: "Channel is Required",
              },
            })}
          />
          <p className="error">{errors.channel?.message}</p>
        </div>

        <div className="form-control">
          <label htmlFor="twitter">Twitter</label>
          <input
            type="text"
            id="twitter"
            {...register("social.twitter", {
              // disabled: true, // NOTE: Sets value to undefined and disables validation, even if required is set true.
              // disabled: watch("channel") === "",
              required: true,
            })}
          />
        </div>

        <div className="form-control">
          <label htmlFor="facebook">Facebook</label>
          <input type="text" id="facebook" {...register("social.facebook")} />
        </div>

        <div className="form-control">
          <label htmlFor="primary-phone">Primary Phone Number</label>
          <input
            type="text"
            id="primary-phone"
            {...register("phoneNumbers.0")}
          />
        </div>

        <div className="form-control">
          <label htmlFor="secondary-phone">Secondary Phone Number</label>
          <input
            type="text"
            id="secondary-phone"
            {...register("phoneNumbers.1")}
          />
        </div>

        <div>
          <label htmlFor="">List of phone numbers</label>
          <div>
            {fields.map((field, index) => {
              return (
                <div className="form-control" key={field.id}>
                  <input
                    type="text"
                    {...register(`phNumbers.${index}.number`)}
                  />
                  {index > 0 && ( // Checking to make sure first element is not being removed
                    <button type="button" onClick={() => remove(index)}>
                      Remove
                    </button>
                  )}
                </div>
              );
              // Use field.id instead of index
            })}
            <button type="button" onClick={() => append({ number: "" })}>
              Add Phone Number
            </button>
          </div>
        </div>

        <div className="form-control">
          <label htmlFor="age">Age</label>
          <input
            type="number"
            id="age"
            {...register("age", {
              valueAsNumber: true,
              required: {
                value: true,
                message: "Age is Required",
              },
            })}
          />
          <p className="error">{errors.channel?.message}</p>
        </div>

        <div className="form-control">
          <label htmlFor="dob">Date of Birth</label>
          <input
            type="date"
            id="dob"
            {...register("dob", {
              valueAsDate: true,
              required: {
                value: true,
                message: "Date of Birth is Required",
              },
            })}
          />
          <p className="error">{errors.channel?.message}</p>
        </div>

        <button disabled={!isDirty || !isValid || isSubmitting}>Submit</button>
        {/* <button type="button" onClick={handleGetValues}>
          Get Values
        </button> */}
        {/* <button type="button" onClick={handleSetValues}>
          Set Value
        </button> */}
      </form>
      <DevTool control={control} />
    </div>
  );
};
