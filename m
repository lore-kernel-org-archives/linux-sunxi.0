Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D831FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:45 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y4so9043006edo.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htfDeYfzO9faOo04zE1zbbujaGC8tJVc0LLIWYl/0E0=;
        b=tWY5RRrl1f9P7YtLpyoXwinY0arcCPoS91VIZamWggOmJA3famcby5+OZgSd6D+3Kd
         eCD1W8dLgS+FdEzVc+bFFH/FHIRuGvvJD4r5wyOs9K3SqnlcXv2Pyztgd4ay1djF+lM+
         a8t+bz5kIbyuWGHoN4lV0N1gIwWkDD5MJJKQvznugy0sbFLCTV1ZL6gVO+8oOav3hUya
         khEHKs6qBFkXPUX+JbMR5N7HurufkoAZ9eGkLnCr88gbiFg1n3dRqmAlnsPFAD8f20Uw
         /KWfOLBYYz6YW1zCZ2igu5mQ5/plPLyE2zQRCvIhjOFZXsYHGYEV4R7EwsQjMFRUaukp
         k9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htfDeYfzO9faOo04zE1zbbujaGC8tJVc0LLIWYl/0E0=;
        b=DvzMqMVUB6AJlvKs+YyzkVe4KlrmcF+/dWonksYrw69ylfi2sXrpPbafnlptxhazPp
         uECuQY89ZFGx3kUWXg/W8nttTk+O4CaKhXNmMBxnzKakEpFX27dty6ccjgZh9GDp73+V
         43mFAI76DmkEwJsjekdFpNW8QhVHgoNwndVJovXTMNOUDTVZI9oOM/vpXL3Irme5Bkwy
         gJ2LudH4YNsQ/vs0By/QR9y7WBuuy7pCgN7hNVQ0MnFax+Pyxp/yc82aTW5schTjdYdN
         37WLXRptLXbxmj7aqrHdyoEmDvvvWrIC1MLECt5xmM+UyZIvJTqrzs5oCO+MFtcmoSZL
         ROcg==
X-Gm-Message-State: AO0yUKWzaGOv6WY7Q0hZYJphm/eze3ZI+MUjKoA1nU3xCjtNFcbL9RB/
	a42ZcFC5FgSSA0N9W4z5LwTlXA==
X-Google-Smtp-Source: AK7set8sFYEVlwjj96yBoYEcUC6q6umvvTijNA5/w5cBj5OSXSMnBWa3ubt3+oomwUIh2AE5fhzWng==
X-Received: by 2002:a17:906:d28c:b0:8e5:88ca:ebac with SMTP id ay12-20020a170906d28c00b008e588caebacmr31563524ejb.40.1678626823445;
        Sun, 12 Mar 2023 06:13:43 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:43 -0700 (PDT)
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
Subject: [PATCH 10/28] media: platform: sti: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:00 +0100
Message-Id: <20230312131318.351173-10-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1169:34: error: ‘c8sectpfe_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index c38b62d4f1ae..67d4db0abd8a 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -1175,7 +1175,7 @@ MODULE_DEVICE_TABLE(of, c8sectpfe_match);
 static struct platform_driver c8sectpfe_driver = {
 	.driver = {
 		.name = "c8sectpfe",
-		.of_match_table = of_match_ptr(c8sectpfe_match),
+		.of_match_table = c8sectpfe_match,
 	},
 	.probe	= c8sectpfe_probe,
 	.remove	= c8sectpfe_remove,
-- 
2.34.1

