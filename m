Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F161FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g10so9626174eda.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjvZGlI9gqxKHJb6Zb5Fkc5S1/fsh/NgaCfi/T9v11Y=;
        b=lKlYxxhYCKn0JxPwkYKx3vASmrkH+srcYSRHily2tzLUxFl3QklS8Q4NAB9udLBZho
         dDGPZTBINPga+76lbL33R0Ue0ftkVUUQLxJzi4w9KwBDni2xOXZwaZzbSux02prlPDHP
         vJ7nGGelocPKxiZAPsodErx2JPF3u6mnEqcDFc2Wm/P0mWtV1EylhbCj0fTAm6z6v6t4
         CdJ8Mm8qbbJwTOuhYW9bDTdnFKTImZMFdRSyvSmbjiOQG5UwzZqJrRtqjTlrTWLJdknY
         zHGpr1crUtQGblfLv3akSTMscNClIduQLP5C6mBhyVCwurXuWWNgdYQ93BE30x0tKpwz
         Z2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjvZGlI9gqxKHJb6Zb5Fkc5S1/fsh/NgaCfi/T9v11Y=;
        b=CEhPFw8zr4WqhTt08kc7r9zy4sXZEj/ANlB4ufqxIvu6WkqqvIp7xoKiKdSEpe1Nkk
         cYSjdPyPOPUF+1gwisypC9w/6+AFrNEsakRPpCJ9l/SN8sp2kYiRduCdmsXK8alxfLt4
         fGyGK+cRKci9LWr8UYoQDeyGshDmF4RUWPx1mL/WzoU62apENf5z0xaCPc2TR9Uc4Rro
         oNrc9RfzgrxaoupZBb9yGgtLstmhZH6SvukxJrblyCYeN3xXo/HDEAJWW5jJY/Sr5SI4
         9G4neEZqWr4BZOWYQr5Cd65yNLS1vwJRhEjMaGjmqdc5mdeJ1B3tsiC42yRv+vbZKnHW
         IdHA==
X-Gm-Message-State: AO0yUKVhuqKuPeV1erEpVBA268vmf3+5in5Eazz6ZU34BwRXJHltuQNg
	rxtd9uj9/tvy52NzvoNnrovWKA==
X-Google-Smtp-Source: AK7set+EVWjyvBDbBmHCcExD0NtojGt3goUEamDttcbYP3oPo0KNy0WQIuIA/C83vuguDS3t+796Xw==
X-Received: by 2002:a17:907:98e6:b0:929:43b5:8e69 with SMTP id ke6-20020a17090798e600b0092943b58e69mr166365ejc.40.1678626805682;
        Sun, 12 Mar 2023 06:13:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:25 -0700 (PDT)
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
Subject: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:51 +0100
Message-Id: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

  drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/cec/i2c/ch7322.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
index 34fad7123704..3c6e6496a001 100644
--- a/drivers/media/cec/i2c/ch7322.c
+++ b/drivers/media/cec/i2c/ch7322.c
@@ -589,7 +589,7 @@ MODULE_DEVICE_TABLE(of, ch7322_of_match);
 static struct i2c_driver ch7322_i2c_driver = {
 	.driver = {
 		.name = "ch7322",
-		.of_match_table = of_match_ptr(ch7322_of_match),
+		.of_match_table = ch7322_of_match,
 	},
 	.probe_new	= ch7322_probe,
 	.remove		= ch7322_remove,
-- 
2.34.1

