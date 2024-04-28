import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";

const schema = z.object({
  username: z.string().nonempty("Username is required"),
  email: z
    .string()
    .nonempty("Email is required")
    .email("Email format is not valid"),
  channel: z.string().nonempty("Channel is required"),
});

type FormValues = {
  username: string;
  email: string;
  channel: string;
};

export default function ZodYouTubeForm() {
  const form = useForm<FormValues>({
    defaultValues: {
      username: "",
      email: "",
      channel: "",
    },
    resolver: zodResolver(schema),
  });

  const { register, formState, handleSubmit } = form;
  const { errors } = formState;

  const onSubmit = (values: FormValues) => {
    console.log(values);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} noValidate>
      <h1>Zod YouTube Form</h1>

      <div className="form-control">
        <label htmlFor="username">Username</label>
        <input type="text" id="username" {...register("username")} />
        <p className="error">{errors.username?.message}</p>
      </div>

      <div className="form-control">
        <label htmlFor="email">Email</label>
        <input type="email" id="email" {...register("email")} />
        <p className="error">{errors.email?.message}</p>
      </div>

      <div className="form-control">
        <label htmlFor="channel">Channel</label>
        <input type="text" id="channel" {...register("channel")} />
        <p className="error">{errors.channel?.message}</p>
      </div>

      <button>Submit</button>
    </form>
  );
}
