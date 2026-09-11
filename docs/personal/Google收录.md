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
2. 添加资源，选择「网址前缀 / URL prefix」，填写完整网址 `https://jinghaojin.jinjinghao992324.chatgpt.site/`。这个子域名无需使用 DNS 验证。
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

## 遇到 “Sorry, you have been blocked”

这表示请求被托管平台的安全服务拦截。更改页面关键词、robots.txt 或公开权限无法直接解除平台拦截。需要根据拦截页底部的 Ray ID、发生时间、网址和使用的网络，由平台支持方检查规则。不要把访问令牌当作给 Google 的抓取入口。

本项目的检查曾出现：带普通浏览器标识的未登录请求返回正常页面，而其他请求返回 403。这个结果只能说明访问因请求环境而异，不能证明 Googlebot 的真实访问结果，也不能确定手机被拦截的具体原因。以 Search Console 的「测试实际网址」为准。

如果平台无法解决面向目标读者的访问问题，可将现有静态网站迁移到其他托管服务。确定新地址后，统一更新 `_config.yml` 的 `url`、canonical、站点地图、个人资料中的外部链接，并在新地址下重新验证 Search Console。托管迁移本身不保证 Google 收录或所有地区的连通性。

## 官方资料

- Google：请求重新抓取 https://developers.google.com/search/docs/crawling-indexing/ask-google-to-recrawl
- Google：验证网站所有权 https://support.google.com/webmasters/answer/9008080
- Google：个人资料结构化数据 https://developers.google.com/search/docs/appearance/structured-data/profile-page
- Cloudflare：403 错误 https://developers.cloudflare.com/support/troubleshooting/http-status-codes/4xx-client-error/error-403/
