# 让 Google 搜到学术主页

公开访问、Google 收录和搜索排名是不同的步骤。网站允许公开访问，并不保证 Google 已经发现或收录；提交申请也不能保证排名或收录时间。

## 网站已有的配置

- 英文首页标题包含 Jinghao Jin、Fudan University 和 JinghaoJin。
- 首页摘要包含中英文姓名、复旦大学身份和研究方向。
- 中英文页面有独立网址、规范网址（canonical）以及互相对应的 hreflang；英文为默认版本。
- 首页提供 ProfilePage / Person 结构化资料，关联 GitHub、INSPIRE 和 ORCID。
- `/robots.txt` 允许抓取并指向 `/sitemap.xml`。站点地图由 Jekyll 自动生成。
- 404 页面不加入站点地图，并带有 noindex。

这些配置帮助搜索引擎理解页面，不保证搜索结果中的展示形式。

## 在自己的 Google 账号下验证网站

1. 打开 https://search.google.com/search-console ，登录你的 Google 账号。
2. 添加资源，选择「网址前缀 / URL prefix」，填写完整网址 `https://changemaker3.github.io/`。GitHub Pages 无法使用 DNS 验证，请使用「HTML 标记」验证方式。
3. 在其他验证方式中选「HTML 标记 / HTML tag」，复制 Google 提供的整段 `<meta name="google-site-verification" content="…">`。
4. 将 `content` 内的真实值填入 `_config.yml` 的 `google_site_verification`，同时将 `enable_google_verification` 设为 `true`。也可以把整段标签发给本项目的助手代为添加。无需提供 Google 密码或登录验证码。
5. 构建并发布网站更新。只修改本地文件不会让 Google 看到标签。
6. 返回 Search Console 点击「验证」。验证成功后保留标签，Google 会定期复查。

## 请求抓取

1. 在 Search Console 的「站点地图」中提交 `sitemap.xml`。
2. 在「网址检查」中输入英文首页完整网址，选择「测试实际网址」。
3. 确认可访问且允许索引后，点击「请求编入索引」。对中文首页 `/zh/` 和论文页 `/publications/` 同样操作。
4. 用「网页索引」报告和「网址检查」跟进状态。Google 表示抓取可能需要几天到几周，请求不保证一定收录。
5. 在你自己的 GitHub、ORCID、INSPIRE 等主页中添加个人网站链接，让读者和搜索引擎有入口可以发现网站。

## 托管平台

网站现在通过 GitHub Pages 发布，地址为 `https://changemaker3.github.io/`，源代码在 `https://github.com/Changemaker3/Changemaker3.github.io`。向 `main` 分支推送后，GitHub Actions 会自动构建并部署。GitHub Pages 由 GitHub 直接提供，普通浏览器和搜索引擎都可以访问，之前托管平台的访问拦截问题不再适用。

## 官方资料

- Google：请求重新抓取 https://developers.google.com/search/docs/crawling-indexing/ask-google-to-recrawl
- Google：验证网站所有权 https://support.google.com/webmasters/answer/9008080
- Google：个人资料结构化数据 https://developers.google.com/search/docs/appearance/structured-data/profile-page
- GitHub Pages 文档 https://docs.github.com/pages
