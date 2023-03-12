Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDE1FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:47 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so38494667edb.9
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=;
        b=GG1FZzu4R08U7ZrQJTDqnm9yyObLtqMDWCx3B/cxyKmqz+Inu/lGru3GBlSAmoNZ2d
         WS9SlIFw7l28qxUjUEIBnfHvBpm5c6g1F4pUDGTJklw6dfbWjyAvPQGUtVzR7OyvFiyQ
         dyuSUmpAGQUkWb8ymF+2KyhC2+95GCs3P8qBCovptLLx92YGuEIvrF2/nQKp3RKdKB2q
         4WRWxJI+thxZatMOq8kxvNE8yRXL8FB+dRcXQH7oOSuC9AcNWcYgasCTPck/INBz0sk4
         D5bd8nEqJArLbuAbevCLQSORbLT9ASQ4UO6q9+5gCJHqKdXkvauSNJboZF8dLbTMmvXn
         eDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=;
        b=K9oK7nWXff60MUTbu7vS+Nqc8a/VDdPlPs6M0MYUROojTwqrkMNoYupaQHpYglNzwl
         oKCynbJu6p7PfJmpLZPzrJ5L5EK1u4bSbR41LG50TWKRfqPcqyzm5AZxyir/cxF0bV6A
         DPNLwXzwAnSIysB+KMmQRhQFp81dG/eTAM5TIswAJBnw8Mc0eHtfNvD9zSCe3iMX2aSe
         pIPHmDmc8FB3n98JbKqGSge27cSYL+86hWPKbKlb2HSZIl72/R9S8L2zypF5ucjdZzlp
         4mIgkEzOmCK2I8lJLvllzuYTCLzM/G2bmzCigjSGXKJ5N056tfDicOS+x2KZK28X+sb+
         bd4Q==
X-Gm-Message-State: AO0yUKXnRbbI2eDY+HxZ+K185kmsulDpE3AgfuTW7q8oHuU/bK77IrRS
	68e3QxAto97yF9dK4vykx4X9QQ==
X-Google-Smtp-Source: AK7set+7qUF+bcLWEkAr4Cox0v1rHikG9c/U926xfMgDAeF0Y5GVKCnNz9afn9B0OfITyqkEgAYQeQ==
X-Received: by 2002:a05:6402:1005:b0:4f9:f45e:c8b3 with SMTP id c5-20020a056402100500b004f9f45ec8b3mr5025265edu.27.1678626825396;
        Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
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
Subject: [PATCH 11/28] media: platform: ti: am437x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:01 +0100
Message-Id: <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/ti/am437x/am437x-vpfe.c:2620:34: error: ‘vpfe_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 2dfae9bc0bba..fe89b8e250e7 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2629,7 +2629,7 @@ static struct platform_driver vpfe_driver = {
 	.driver = {
 		.name	= VPFE_MODULE_NAME,
 		.pm	= &vpfe_pm_ops,
-		.of_match_table = of_match_ptr(vpfe_of_match),
+		.of_match_table = vpfe_of_match,
 	},
 };
 
-- 
2.34.1

