<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="zh-CN">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title>
                    <xsl:value-of select="rss/channel/title"/>
                    <xsl:text> - RSS</xsl:text>
                </title>
                <style>
                    :root {
                        --page-bg: #f3f4f6;
                        --card-bg: #ffffff;
                        --text: #1f2430;
                        --muted: #6b7280;
                        --primary: oklch(0.70 0.14 250);
                        --line: rgba(0, 0, 0, 0.08);
                    }
                    @media (prefers-color-scheme: dark) {
                        :root {
                            --page-bg: #16171d;
                            --card-bg: #1f212a;
                            --text: #e5e7eb;
                            --muted: #9ca3af;
                            --line: rgba(255, 255, 255, 0.1);
                        }
                    }
                    * { box-sizing: border-box; }
                    body {
                        margin: 0;
                        padding: 2rem 1rem 4rem;
                        background: var(--page-bg);
                        color: var(--text);
                        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "PingFang SC", "Microsoft YaHei", sans-serif;
                        line-height: 1.6;
                    }
                    .page { max-width: 46rem; margin: 0 auto; }
                    .hero {
                        background: var(--card-bg);
                        border-radius: 0.75rem;
                        padding: 1.75rem;
                        margin-bottom: 1.5rem;
                        display: flex;
                        gap: 1.25rem;
                        align-items: center;
                    }
                    .hero img { width: 3.5rem; height: 3.5rem; border-radius: 0.75rem; flex-shrink: 0; }
                    .hero h1 { margin: 0 0 0.25rem; font-size: 1.6rem; }
                    .hero p { margin: 0 0 0.5rem; color: var(--muted); font-size: 0.95rem; }
                    .hero a { color: var(--primary); font-size: 0.9rem; text-decoration: none; }
                    .hero a:hover { text-decoration: underline; }
                    .item {
                        background: var(--card-bg);
                        border-radius: 0.75rem;
                        padding: 1.25rem 1.5rem;
                        margin-bottom: 0.875rem;
                    }
                    .item h2 { margin: 0 0 0.5rem; font-size: 1.15rem; }
                    .item h2 a { color: var(--text); text-decoration: none; }
                    .item h2 a:hover { color: var(--primary); }
                    .meta {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 0.5rem 0.875rem;
                        align-items: center;
                        font-size: 0.8rem;
                        color: var(--muted);
                        margin-bottom: 0.6rem;
                    }
                    .tag {
                        border: 1px solid var(--line);
                        border-radius: 999px;
                        padding: 0.05rem 0.6rem;
                        font-size: 0.75rem;
                    }
                    .summary { margin: 0; font-size: 0.925rem; color: var(--muted); }
                    footer { text-align: center; color: var(--muted); font-size: 0.8rem; margin-top: 2rem; }
                </style>
            </head>
            <body>
                <div class="page">
                    <header class="hero">
                        <xsl:if test="rss/channel/image/url">
                            <img src="{rss/channel/image/url}" alt=""/>
                        </xsl:if>
                        <div>
                            <h1><xsl:value-of select="rss/channel/title"/></h1>
                            <p><xsl:value-of select="rss/channel/description"/></p>
                            <a href="{rss/channel/link}"><xsl:value-of select="rss/channel/link"/></a>
                        </div>
                    </header>

                    <xsl:for-each select="rss/channel/item">
                        <article class="item">
                            <h2>
                                <a href="{link}">
                                    <xsl:value-of select="title"/>
                                </a>
                            </h2>
                            <div class="meta">
                                <span>
                                    <xsl:value-of select="substring(substring-after(pubDate, ', '), 1, 11)"/>
                                </span>
                                <xsl:if test="author">
                                    <span><xsl:value-of select="author"/></span>
                                </xsl:if>
                                <xsl:for-each select="category">
                                    <span class="tag"><xsl:value-of select="."/></span>
                                </xsl:for-each>
                            </div>
                            <p class="summary"><xsl:value-of select="description"/></p>
                        </article>
                    </xsl:for-each>

                    <footer>
                        <xsl:value-of select="rss/channel/copyright"/>
                    </footer>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
