<?php

namespace HuberwayCMS\Blog\Providers;

use HuberwayCMS\Api\Facades\ApiHelper;
use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Blog\Models\Category;
use HuberwayCMS\Blog\Models\Post;
use HuberwayCMS\Blog\Models\Tag;
use HuberwayCMS\Blog\Repositories\Eloquent\CategoryRepository;
use HuberwayCMS\Blog\Repositories\Eloquent\PostRepository;
use HuberwayCMS\Blog\Repositories\Eloquent\TagRepository;
use HuberwayCMS\Blog\Repositories\Interfaces\CategoryInterface;
use HuberwayCMS\Blog\Repositories\Interfaces\PostInterface;
use HuberwayCMS\Blog\Repositories\Interfaces\TagInterface;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use HuberwayCMS\Setting\PanelSections\SettingOthersPanelSection;
use HuberwayCMS\Shortcode\View\View;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Theme\Events\ThemeRoutingBeforeEvent;
use HuberwayCMS\Theme\Facades\SiteMapManager;

/**
 * @since 02/07/2016 09:50 AM
 */
class BlogServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(PostInterface::class, function () {
            return new PostRepository(new Post());
        });

        $this->app->bind(CategoryInterface::class, function () {
            return new CategoryRepository(new Category());
        });

        $this->app->bind(TagInterface::class, function () {
            return new TagRepository(new Tag());
        });
    }

    public function boot(): void
    {
        SlugHelper::registerModule(Post::class, 'Blog Posts');
        SlugHelper::registerModule(Category::class, 'Blog Categories');
        SlugHelper::registerModule(Tag::class, 'Blog Tags');

        SlugHelper::setPrefix(Tag::class, 'tag', true);
        SlugHelper::setPrefix(Post::class, null, true);
        SlugHelper::setPrefix(Category::class, null, true);

        $this
            ->setNamespace('plugins/blog')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadMigrations()
            ->publishAssets();

        if (ApiHelper::enabled()) {
            $this->loadRoutes(['api']);
        }

        $this->app->register(EventServiceProvider::class);

        $this->app['events']->listen(ThemeRoutingBeforeEvent::class, function () {
            SiteMapManager::registerKey([
                'blog-categories',
                'blog-tags',
                'blog-posts-((?:19|20|21|22)\d{2})-(0?[1-9]|1[012])',
            ]);
        });

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-blog',
                    'priority' => 3,
                    'name' => 'plugins/blog::base.menu_name',
                    'icon' => 'ti ti-article',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-blog-post',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-blog',
                    'name' => 'plugins/blog::posts.menu_name',
                    'route' => 'posts.index',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-blog-categories',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-blog',
                    'name' => 'plugins/blog::categories.menu_name',
                    'route' => 'categories.index',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-blog-tags',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-blog',
                    'name' => 'plugins/blog::tags.menu_name',
                    'route' => 'tags.index',
                ]);
        });

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('blog')
                    ->setTitle(trans('plugins/blog::base.settings.title'))
                    ->withIcon('ti ti-file-settings')
                    ->withDescription(trans('plugins/blog::base.settings.description'))
                    ->withPriority(120)
                    ->withRoute('blog.settings')
            );
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            if (
                defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME') &&
                $this->app['config']->get('plugins.blog.general.use_language_v2')
            ) {
                LanguageAdvancedManager::registerModule(Post::class, [
                    'name',
                    'description',
                    'content',
                ]);

                LanguageAdvancedManager::registerModule(Category::class, [
                    'name',
                    'description',
                ]);

                LanguageAdvancedManager::registerModule(Tag::class, [
                    'name',
                    'description',
                ]);
            } else {
                Language::registerModule([Post::class, Category::class, Tag::class]);
            }
        }

        $this->app->booted(function () {
            SeoHelper::registerModule([Post::class, Category::class, Tag::class]);

            $configKey = 'packages.revision.general.supported';
            config()->set($configKey, array_merge(config($configKey, []), [Post::class]));

            $this->app->register(HookServiceProvider::class);
        });

        if (function_exists('shortcode')) {
            view()->composer([
                'plugins/blog::themes.post',
                'plugins/blog::themes.category',
                'plugins/blog::themes.tag',
            ], function (View $view) {
                $view->withShortcodes();
            });
        }
    }
}
