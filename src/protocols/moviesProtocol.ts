export type MovieEntity = {
  id: number;
  name: string;
  genre: number;
  created_at: string | Date;
  platforms: number[];
};

export type MoviePlatformEntity = {
  id: number;
  movie_id: number;
  platform_id: number;
};

export type Movie = Omit<MovieEntity, "id" | "created_at">;
