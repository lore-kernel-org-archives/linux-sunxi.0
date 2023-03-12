Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5851FC8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g10so9629306eda.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGcITVAy31UtuDH6LhnS9qeMquB4EE88f+CeXXPHp2U=;
        b=IGwMfRxSQH94lhO7ruCuqsRs1ghGWJPtzeLBso4IOoVonwH/Wk7MA8ZDzMdXPXS9J2
         ib0mD6oPs5YYF2O/8kdhDCgs703SbrzaFKCpFD/WL+t1KVqEJ1it7YJIiAJjC5M01esC
         jcU/DXpkRp0c6gkguud2G1YRLTwdtTF6MyQFenctLsdNunaGSXbVEFEetgQg2eDgbt1w
         Ph3ycQQrUHRZo/Hktfma5zrklPCOvni8mFHLYTlsXYqlTGot9IF9No4FYe50D3AZGKHK
         2BARURtswtRfXN9aR8LCljCS/kcKIWD8WHbBaCYeHu/M4q7RkgVJPvoT3PsvMR+pGmGv
         rbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGcITVAy31UtuDH6LhnS9qeMquB4EE88f+CeXXPHp2U=;
        b=sviLKytwptf2+OVHoXJInYfylE0PlA1mbDIz0zAMg6nyovD4LS5ImmMt/5erZrwzbs
         /jnfwcfhM3kRYsM92d3we5MQkord4jiWnuelUEb4wQthttBonU7tvGABqx4t1u2a9jQp
         KWqbcBOm8TS/TS6QoxSPgpAAbWlT0S1Z7CBSJxs+SiL4jlEZbiyRQrE1mjo7LEwTXS1L
         /qnOF2xoPha9xbK7sBhp0YbtzCj9vDyXJsAqpuiBEXeeqssJOFkBWIUVfsuwA3GpsGTj
         8fNXiE9OPOv1iXDkKZGmjddv+hQziveWNkI10TARYoNGuTkdshBvXzMbox8a44EXnsxQ
         feZQ==
X-Gm-Message-State: AO0yUKUftKxZ/kuPLhW0b+tlFc0OF8UxDy5Yw46K/xqkHb8EPP89jJxZ
	Xly/8H6pxmn6457JWV7bA7AeWw==
X-Google-Smtp-Source: AK7set/xivJKH0hcau66sU8fJqKK2GNHVix/5Dk94HStfVumSSriO/XOviLFoDjpZUHmFVs9JDdUDg==
X-Received: by 2002:a17:907:6d08:b0:887:dea8:b029 with SMTP id sa8-20020a1709076d0800b00887dea8b029mr36591244ejc.1.1678626835335;
        Sun, 12 Mar 2023 06:13:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:55 -0700 (PDT)
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
Subject: [PATCH 16/28] media: platform: sun6i-csi: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:06 +0100
Message-Id: <20230312131318.351173-16-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:401:34: error: ‘sun6i_csi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index e3e6650181c8..187a2419da96 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -429,7 +429,7 @@ static struct platform_driver sun6i_csi_platform_driver = {
 	.remove	= sun6i_csi_remove,
 	.driver	= {
 		.name		= SUN6I_CSI_NAME,
-		.of_match_table	= of_match_ptr(sun6i_csi_of_match),
+		.of_match_table	= sun6i_csi_of_match,
 		.pm		= &sun6i_csi_pm_ops,
 	},
 };
-- 
2.34.1

