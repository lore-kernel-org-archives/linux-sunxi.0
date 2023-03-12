Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852891FC8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:14:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cy23so38399361edb.12
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38C9btURbQsaMIipOhvsQvm6Dy7PKwPGkg3PY63qI38=;
        b=m5nxwWZS+IjOxjDSLMlcc9Mw3quPwPmLZGwjL0YQEcQdFJH9ABjF8RScjIrJ48oGzx
         CeSVDrWPupHnu88aXT4OXI198T4AmpikK45pZee6+1kcKldpWFVdMkX4Nmd0xTQHIAzb
         7UEG5bGZNzRsmjDPRi566bc37BTemvDPj1tWmhMPE6WPiS736MVrhoVtGhBqME9a/TfC
         XTQwjVIg0rNNsyY4DyCt4dBK+LB3XCp0pHTrn6Vef4pIhpJLOgBhUU4OybxOcH+eYCP0
         IdU5OYQpRstCWiFkNv63Xd/bZkppmZfSaIJr5HJjB3GT7zlg/7ren+XF+nqi5vq/6hUB
         Y2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38C9btURbQsaMIipOhvsQvm6Dy7PKwPGkg3PY63qI38=;
        b=eKCBEFTur2yW3kiCtihP+wWSPJ19sxyzegGH8f423llWqs0i4mdt3CF0SvQrFzp5tT
         E0xsdGLQCHGG/+FLHWIs/RzZ38ZKjhcD6n3+YjWIoLqNedOeEVr3i5pX47vjcJlUJCbF
         d92yhCLvP853O3xWyt2tSc/Hh4hwNNB0MsVjkTVoBRtKyInwjDmlyYHh/EYICeRPhKbx
         cQbY9j/zqcYdDbysUsBAw3EL+MBKkoaRVdGB/kwL+UkZjFlOww9Okzflvj73EmMO7vpm
         VZRN+1DQggyQi0CRQpLqNQQDilfwhXu/ndGQu/bSUtxfl3wtOyOhYCs/Tm8i0Z0TPOeA
         Gfmw==
X-Gm-Message-State: AO0yUKXm36BJQ7mRNE7f3r6Siz3WqIg2+tJG3J+bnBHRIwwovW7QuPxQ
	WBvHHY1JpPBsJh/1UlKQ04gLfA==
X-Google-Smtp-Source: AK7set8Zl0KNYXv2AhHSd8Fn3iuvU9rRSVGaJA6ydZDA517h1/4H4uOnDfoNavy1zJht7v4B+j49+g==
X-Received: by 2002:a05:6402:2037:b0:4c0:821a:40da with SMTP id ay23-20020a056402203700b004c0821a40damr31253519edb.34.1678626849069;
        Sun, 12 Mar 2023 06:14:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:08 -0700 (PDT)
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
Subject: [PATCH 23/28] media: i2c: ov2640: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:13 +0100
Message-Id: <20230312131318.351173-23-krzysztof.kozlowski@linaro.org>
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

  drivers/media/i2c/ov2640.c:1290:34: error: ‘ov2640_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/ov2640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 39d56838a4ef..a92c091356c5 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1296,7 +1296,7 @@ MODULE_DEVICE_TABLE(of, ov2640_of_match);
 static struct i2c_driver ov2640_i2c_driver = {
 	.driver = {
 		.name = "ov2640",
-		.of_match_table = of_match_ptr(ov2640_of_match),
+		.of_match_table = ov2640_of_match,
 	},
 	.probe_new = ov2640_probe,
 	.remove   = ov2640_remove,
-- 
2.34.1

