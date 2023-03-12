Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3EB1FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:33 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x3so38432114edb.10
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwcHrV5a02s5JB75+HpDxEu4ezBqVrMI6kJUFyMDg/I=;
        b=bV/PAEtQn1KGw/Zi6jTCgqYa5nRbO5IPf2+hM5MLwAk5Uk0e9xROyciD1SeTbKeIvo
         MlkLJZ7Bn9rWTiPWyy1rXLIb0NPN7l/0SUcmQ1gPA0Px803dGmfYFSsMi0zSxvCDYIEp
         xAfx/2AAA1BZBrfbtUqRJvxUVRAewGUUTagEKg9AHpIaQNB2T1bQ98IqMD5mo2GoWKwK
         +FQom24Ip58JAYs2KpB60hA0ik3xFPiniQmemJhG9dzrzLF06IvbDUiE2YiA/R8WS7FC
         c4jhRSJ9/XJbJhFhHSbrl0/vOmemeevZCwfrLAtLWu/L6nb0K50kiGKmyGQmjBDX2sbg
         iSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwcHrV5a02s5JB75+HpDxEu4ezBqVrMI6kJUFyMDg/I=;
        b=SOvXdr3F8IwfKJO120rEawmmz6znYNSsZhF5VCLjc2Nt4sT6I6VMUA5Mz+V51ViGU2
         XyZlTunPo66DnqpdRXg0tioDacjlj4dCkTNFMwImyUvxAIKTRVOR3duSn23yzIK7E2FJ
         M9YqHXmWCu5vE4k06mqktzLXVp9BwSg/tJuMigkX6pldCTk1mees/UeLCbXwUfrnP0y3
         /RAXK42DeMGV/nhcC1LxFoMbVQg9qhFZFpucQ51oSkSlxI45evu4fr4oD5Z7ZRILaGgz
         RlBeAne9H/JVA501JYiURmf9eFSB8RIX7mKG9UxKpRuqrPRPvU7cs11SwW06OTlDLlY7
         qOsA==
X-Gm-Message-State: AO0yUKVEQ8LzAewfF5OitVC9yWSYjUtTPETzEAf+VSdWgnGBow8AWZzr
	OaHCcyJREbmO0yhwkNZFAxd4Gg==
X-Google-Smtp-Source: AK7set9S2U41oyugwgVu8YTpoQzzlycJss1HXlDHk5bJDxiw4kxZXbt8ZreuYC74Gl5l/Mtsa+88Og==
X-Received: by 2002:a05:6402:1005:b0:4f9:f45e:c8b3 with SMTP id c5-20020a056402100500b004f9f45ec8b3mr5024696edu.27.1678626811779;
        Sun, 12 Mar 2023 06:13:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:31 -0700 (PDT)
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
Subject: [PATCH 04/28] media: rc: gpio-ir-recv: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:54 +0100
Message-Id: <20230312131318.351173-4-krzysztof.kozlowski@linaro.org>
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

  drivers/media/rc/gpio-ir-recv.c:197:34: error: ‘gpio_ir_recv_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/rc/gpio-ir-recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 8dbe780dae4e..ae1199cc73fd 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -205,7 +205,7 @@ static struct platform_driver gpio_ir_recv_driver = {
 	.remove = gpio_ir_recv_remove,
 	.driver = {
 		.name   = KBUILD_MODNAME,
-		.of_match_table = of_match_ptr(gpio_ir_recv_of_match),
+		.of_match_table = gpio_ir_recv_of_match,
 #ifdef CONFIG_PM
 		.pm	= &gpio_ir_recv_pm_ops,
 #endif
-- 
2.34.1

