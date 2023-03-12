Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11641FC9
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:13:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id k10so38404682edk.13
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=YAxPlJhF1+DE9jUIWYyITWyk7/AONuibeqeBOgc+dWF5fRBbLmZqbk1IYqYlHABI85
         gz1wXPUZjU5FC3mPpXfAfbwnto9A2C8UR5j79ptmQvXc8NIm93NUj7vnZscY32eF5vOQ
         MNqXBlnv4ABmODy3pYii1yEyd13GeBgb4NroSTWOAXhnpEoT/yi4gqdHK3skNRal/Ae+
         3cMpgvlN2t9T17SYFpZKlQ7VLMYX986I32TaxVNtQfKWUgod+jAHKsvNHdpkbRKt4aYk
         B2uanB4ZtOcer65Igqf0RJ3h8hJb/2Xmwgp0Xi2cgPElJofc8L4SdOxvKNLQznQt+/k0
         yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=R0ZQxj0Sa3vqRgsPis6QuTWZtf7DV4jGjiCtrLLJzoifk5QDWqe+6dhmauAaUUicbB
         JPjAK49Wb29NLON16qLoMFDh6GGUPXnltazUjQGdFJlAZTZx8ftQCdlmbnGlOSHJIdWF
         dIno0pqxgMkoVyDPrzpJQKDIRFhRcCHAbrYZVk+y8S7q+UEqwhKTNNvMmhkinpWJoxD/
         xed80yRtEaziwtU8wXyrOptNHF9xRq9lBiZmlYyTbmOkxL8tMK/KW593e5lmiYApK2cc
         bm0z+Zc5e10BQBHwhEI7lMt0hwo0CjsaIFvW90dq/QrY6Wvb92V9nYELQNGjc7dQ6uaY
         rjfA==
X-Gm-Message-State: AO0yUKWgKSqtP3Vx0GKNPsHIUrRXylL6ThTDpZ7m8uhYDlt8GukGugEE
	Q9amaBkspmNET0S1dg37gZcK/A==
X-Google-Smtp-Source: AK7set+1VMb4vP5AkQiutwwyqAr2RuSDyquikjNxXi+uMI4iRdw2RCO1AJJ8nzH1kwmE3q0OOnHeOw==
X-Received: by 2002:aa7:dbc8:0:b0:4f9:deb4:b97f with SMTP id v8-20020aa7dbc8000000b004f9deb4b97fmr5865130edt.13.1678626829419;
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
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
Subject: [PATCH 13/28] media: platform: marvell: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:03 +0100
Message-Id: <20230312131318.351173-13-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/marvell/mmp-driver.c:364:34: error: ‘mmpcam_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/marvell/mmp-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index ef22bf8f276c..b7747c7bae45 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -372,7 +372,7 @@ static struct platform_driver mmpcam_driver = {
 	.remove		= mmpcam_platform_remove,
 	.driver = {
 		.name	= "mmp-camera",
-		.of_match_table = of_match_ptr(mmpcam_of_match),
+		.of_match_table = mmpcam_of_match,
 		.pm = &mmpcam_pm_ops,
 	}
 };
-- 
2.34.1

