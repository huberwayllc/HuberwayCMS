<?php

namespace HuberwayCMS\Blog\Database\Traits;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Blog\Models\Category;
use HuberwayCMS\Blog\Models\Post;
use HuberwayCMS\Blog\Models\Tag;
use HuberwayCMS\Slug\Facades\SlugHelper;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

trait HasBlogSeeder
{
    protected function createBlogCategories(array $categories, bool $truncate = true): void
    {
        if ($truncate) {
            Category::query()->truncate();
        }

        $faker = $this->fake();

        foreach ($categories as $index => $item) {
            $item['description'] ??= $faker->text();
            $item['is_featured'] ??= ! isset($item['parent_id']) && $index != 0;
            $item['author_id'] ??= 1;
            $item['parent_id'] ??= 0;

            $category = $this->createBlogCategory(Arr::except($item, 'children'));

            if (Arr::has($item, 'children')) {
                foreach (Arr::get($item, 'children', []) as $child) {
                    $child['parent_id'] = $category->getKey();

                    $this->createBlogCategory($child);
                }
            }
        }
    }

    protected function createBlogTags(array $tags, bool $truncate = true): void
    {
        if ($truncate) {
            Tag::query()->truncate();
        }

        foreach ($tags as $item) {
            /**
             * @var Tag $tag
             */
            $tag = Tag::query()->create($item);

            SlugHelper::createSlug($tag);
        }
    }

    protected function createBlogPosts(array $posts, bool $truncate = true): void
    {
        if ($truncate) {
            Post::query()->truncate();
            DB::table('post_categories')->truncate();
            DB::table('post_tags')->truncate();
        }

        $faker = $this->fake();

        $categoryIds = Category::query()->pluck('id');
        $tagIds = Tag::query()->pluck('id');
        $userIds = User::query()->pluck('id');

        foreach ($posts as $item) {
            $item['views'] ??= $faker->numberBetween(100, 2500);
            $item['description'] ??= $faker->realText();
            $item['is_featured'] ??= $faker->boolean();
            $item['content'] ??= $this->removeBaseUrlFromString((string) $item['content']);
            $item['author_id'] ??= $userIds->random();
            $item['author_type'] ??= User::class;

            /**
             * @var Post $post
             */
            $post = Post::query()->create($item);

            $post->categories()->sync(array_unique([
                $categoryIds->random(),
                $categoryIds->random(),
            ]));

            $post->tags()->sync(array_unique([
                $tagIds->random(),
                $tagIds->random(),
                $tagIds->random(),
            ]));

            SlugHelper::createSlug($post);
        }
    }

    protected function getCategoryId(string $name): int|string
    {
        return Category::query()->where('name', $name)->value('id');
    }

    protected function createBlogCategory(array $item): Category
    {
        /**
         * @var Category $category
         */
        $category = Category::query()->create($item);

        SlugHelper::createSlug($category);

        return $category;
    }
}
