Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839841FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id er25so10367539edb.5
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=;
        b=dufU2ZEVvJS9S3PuzmfWSiaKt/e7oKmEif/HcTwiDm1Y71Lj42dFTktHXvA2w4XjAm
         z6CgADU73/O+QVxdKfCgfzGdd8q4LJXRA1NAMkyp64omDj5lG0pyjwGLSEUy3YRLQw1F
         jbhPrxxPiruJ9AwZDeljYbj05SqYwHoEeRai4CpSh/z6WTebeg/5Vrjbf2NIr5CzrKuM
         9qiaMAOz27bLtb+MQWNr6IPfIJ9u+UOg7hONEIKoQXcti8nfWdHn2vaNqLwCT+mhFL13
         lxBRmxlvU7xnCcaMng+7C4zdz2s2yxnEIqvlx2C5sHF3menjlKTG6uQs3n0MQ+fjsU1a
         kNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=;
        b=2GFEazVZL/mUe6lFyi9c9frHrDreClxw7HQm7Wp1Qfm/cCgKVBxrzQ/E8Byz3DxrGe
         8pithuVXTtzdkjlIc62F+D8HsYb1bxtCr9pOB7zaWtnNsyE7e9fXXrF6296gShVk2T/v
         9f+SJDQ9/lWc/cjBTo8chNbj5wS/aztYVM87ZjcwoWXTTnYTB6rT7kB6wpUiwNhx4P3Y
         PPeGv0RuBvb6W214CyB/ZOmfSOb2QXI3LqvYhjzSYta2BZ8vpqaVwWzqMdXO2OrCHxjj
         Qwe9quRPMBGHyP2XzpjBZZEpdbUVzCP4nQnwWvY6+CfWkTkR9WCmi9OA4E+10527v5FQ
         04XA==
X-Gm-Message-State: AO0yUKXE/thL5aJ8YOvCwt/CB0pB7cyLE6XjkqtTB/sZQ2qIeNnCL3Rn
	YLgxh6cx1h1O7QokMeDZAWr8YQ==
X-Google-Smtp-Source: AK7set+ziiDk/Iecc5/4CJWrBGIg9OTBhTAoqLcBDI9ZAK6SPp7SnqnL3CHjfonNxYjxcPQIpQfdww==
X-Received: by 2002:a17:906:f6cc:b0:925:5705:b5b8 with SMTP id jo12-20020a170906f6cc00b009255705b5b8mr2100962ejb.58.1678626807629;
        Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
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
Subject: [PATCH 02/28] media: cec: meson: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:52 +0100
Message-Id: <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
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
matching via PRP0001, even though it might not be relevant here).

  drivers/media/cec/platform/meson/ao-cec.c:711:34: error: ‘meson_ao_cec_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/cec/platform/meson/ao-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 6b440f0635d9..223c092dbb6a 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -719,7 +719,7 @@ static struct platform_driver meson_ao_cec_driver = {
 	.remove  = meson_ao_cec_remove,
 	.driver  = {
 		.name = "meson-ao-cec",
-		.of_match_table = of_match_ptr(meson_ao_cec_of_match),
+		.of_match_table = meson_ao_cec_of_match,
 	},
 };
 
-- 
2.34.1

