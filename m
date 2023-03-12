Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BAE1FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:14:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r15so11316869edq.11
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=;
        b=KhyYeWigZGhPF510CvX5h9jE+fAqEKL2Rqs6qyLcdHXMTpfyTrH/yYmW5MTvJeK8nU
         9Y29KFzVe5cxs4J/rOcqaKWnpIbAymZchxZ/wGXUYskLlKXCUtjl0OgM6d1MpMYDwe2B
         5JML0Xz4YjWR3BX2c/3QL3NfzaX094la29OY3e5oakPa2FxDE0KgDp7gO70LZ03aGu6/
         hWXBFSgOOKx8rWZ3Aubf1UN1YZWNDAQIP5CIknOtco2JAOy74u8Thdocrurl29RGgT5l
         qLqTSjhtjfsb+ut1Estkk2Nyx1WDu0Ny1wu+fQDaiUFcO5y10EPZSGOTf7jHfa86mqiH
         i6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=;
        b=o0E5nry3nzs4HnenXCt19eOx8OY01F0xRMCn5EKKEoWnOEVa63RjI/lSFBIL9RyDUx
         zHxQkLXSBq2V1MsDOKcGAuAmkkwN/wGJUC7elII6S7L4mgdcWa7k2pb+DO0dxPF0ScSL
         ZfvXJXpurNu+XllVsSD3Jv1tC5U3XemnUmGcWzz4xtdUf0WH1pxfRxq7V7jDY9HTq98d
         QzMkRIbsf4pXLL2Cq2YSPKKgUnKZrgpr9k6p/Iy2VX1yu94oDMj2FEMdFhvC7a4PEe+Z
         Azo/ZPTr/X+Ip6HCOT97OHA6HpZSnvxLfxUemq0qS9XrbK6MITJdDBm62HDQ6U/3tJIQ
         Tx2g==
X-Gm-Message-State: AO0yUKXD0QGf3D1TXQYJDukeKvBdrwKc2NS0TdrJHJWNGwmoQtAtJoaJ
	+eEHJjsb7pQAOawUxEU2o2EpNQ==
X-Google-Smtp-Source: AK7set/LSFpK4yaynBThKlKSPfP1bsBiZFb33g2FppGxi4UYvcynFTqjlnDykMn5irNp8KK0K+3W1Q==
X-Received: by 2002:a05:6402:1105:b0:4b6:821e:1859 with SMTP id u5-20020a056402110500b004b6821e1859mr8115383edv.7.1678626847028;
        Sun, 12 Mar 2023 06:14:07 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:06 -0700 (PDT)
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
Subject: [PATCH 22/28] media: i2c: mt9m111: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:12 +0100
Message-Id: <20230312131318.351173-22-krzysztof.kozlowski@linaro.org>
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

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/media/i2c/mt9m111.c:1370:34: error: ‘mt9m111_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/mt9m111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index f5fe272d1205..20ed87d872c8 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1382,7 +1382,7 @@ MODULE_DEVICE_TABLE(i2c, mt9m111_id);
 static struct i2c_driver mt9m111_i2c_driver = {
 	.driver = {
 		.name = "mt9m111",
-		.of_match_table = of_match_ptr(mt9m111_of_match),
+		.of_match_table = mt9m111_of_match,
 	},
 	.probe_new	= mt9m111_probe,
 	.remove		= mt9m111_remove,
-- 
2.34.1

