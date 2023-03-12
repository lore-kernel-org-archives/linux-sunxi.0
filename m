Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E341FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:59 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so38496302edb.9
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6y38vRZkdBS5R5uwqFpYAPV0SwqgL3Ad/RHz3KFEYg=;
        b=F6qp4Yb8Iigoi2EWlwMSg+KfJE/41jbOR7JfTYJrgttrWACfS6ajuqUiwOO66uyPgb
         TSDyuz5lva0OBRpoxvmaQOkSg779UZzBuqAbseB/rjiaktLeYs86i+UZ1RiiDfuwEogl
         ImOHBGF6zWH4XHlclIsr4PBBWT2fVxOqEv7QgTlPMCwKZCTyvZvengCbdn/HQjYm1St7
         TR1Fuiv3f3MVlOlqtTOYQ3sVaeIbG4GFsP8RvY29ZWUI9AsuszMAJwOB3kqiSewpQkFQ
         GTId4N5+TKXJcB3/DyP8UI5FAsEArWEZwyv6MV+vzx+xd9JOXHrYMPxQGsi4uVXbREux
         JaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6y38vRZkdBS5R5uwqFpYAPV0SwqgL3Ad/RHz3KFEYg=;
        b=WZXkkcIKQcK0+nPS4bj1spzt1lxBL6YUceBWmFJgyk6q6Aa/8WvmeIWPM96/nWINE2
         wliT14kTiv1/iIGQq2BvYHjyG3VwY/j1pYDsIRyAzQiY2gYU+XK96KTwWcZCmQnNcxQa
         TKoFcLmGhWYmtCJprpTzpfC6Pjifvnty1KGtTQVXHwzp8amPOQKc7VXbAecCY/IjyTMK
         SY8jEdCuc6PFNCnUWNrEgkGXBhQI8bSWGFx+yO/LOCgaJwi6nY3SA71MXaC5nw/NY462
         mVKTK/RYotFWE/4rw+C/7JOj2ORMfj+XEYMIAyLHhSd4U7MFw9zJQgUNHLX80NbPL6Ea
         +U5w==
X-Gm-Message-State: AO0yUKXDeX859lJH7SOH4xw4GOie2Re83UCPuok2t69DlxCepgRC0u9U
	/ghO1RG3zAmMad674cH+d6665w==
X-Google-Smtp-Source: AK7set/WMW6RgALtAuft2GXt0JFDI5Y2R0SGD1j3uPRf3y93eii3868Nj2pM7xYCjr1WDifLt9I7Xg==
X-Received: by 2002:a17:907:8a12:b0:88d:9cf8:2dbb with SMTP id sc18-20020a1709078a1200b0088d9cf82dbbmr37183584ejc.12.1678626839411;
        Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 18/28] media: platform: sun8i-a83t-mipi-csi2: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:08 +0100
Message-Id: <20230312131318.351173-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:818:34: error: ‘sun8i_a83t_mipi_csi2_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index cd2e92ae2293..1f0cc7b1ba47 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -826,7 +826,7 @@ static struct platform_driver sun8i_a83t_mipi_csi2_platform_driver = {
 	.remove	= sun8i_a83t_mipi_csi2_remove,
 	.driver	= {
 		.name		= SUN8I_A83T_MIPI_CSI2_NAME,
-		.of_match_table	= of_match_ptr(sun8i_a83t_mipi_csi2_of_match),
+		.of_match_table	= sun8i_a83t_mipi_csi2_of_match,
 		.pm		= &sun8i_a83t_mipi_csi2_pm_ops,
 	},
 };
-- 
2.34.1

