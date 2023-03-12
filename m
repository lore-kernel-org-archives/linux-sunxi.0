Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3A1FC8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:14:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r15so11318020edq.11
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz58BecKJebSQJXrlMMgq2KIDHoDh3NjA0FUivRICtA=;
        b=W1k9mfbGVEpQdjChyYJDNiJ9VR3PjfpZ73Gq0BDfuM4iMuvTnkBm2I6srbznEPwaJP
         THlB69G1mME7ojXh1+UnqUHgcM8NL3ZZ2wZAuhHFPilxMAer5hLfyLrT4pIdLtcQPfeV
         aXcgs+tx5X26yKopWPTDySMt5uxnpFkncJirZZQ3J8ya+8XQBT1WQwS+7uUljarXpIf8
         QlxnyaM/KalsZOSCpQHfqVfSJqyUGSLwkvQr84rm96y4zG1J7ohxebgv43j44n8p6esQ
         bTG+gP/Vnvv6vBEFNgPDZCQbrGPBjuTxP7W5ds8ev/FiQGo9mQ74eR+q80XVqAmL64o5
         jNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz58BecKJebSQJXrlMMgq2KIDHoDh3NjA0FUivRICtA=;
        b=NFmNKvZNqC6YH4NHDWnRFz7MyOtEwMz881SPAn3lhU/botDmQH0g/lbC9pKlfiPCc9
         trvzKbismXCRhC4YCkXxs3uoYkukelk2nePScQe8Fn+i6lFevI4BiIVuZchG4MPQuXyd
         siUU/di5aUGnrDiZ+j/nwVb1JM1IknfJGwxNP+KIMFPy0Wr7gnYT3XBnZJD6ojtt30zv
         x2QZ6ThQY7N0jXwaiHX7ZMBp7yqwA7fdItTousZZBsSz3YC19h52Z3cpwiFLH8fEemU9
         zZK6rcMUP9SSoxf7LBVhw4WFC3LK1g+mcHrg8uWX8MeLn6KFRWcmGqwQ341dX5VB9Qva
         E0fA==
X-Gm-Message-State: AO0yUKVzZ/AieVgbKyv/66w0tzwn8C3C9GI9esSGAZEF3gUmxGA2LmOO
	OE8QILW0xeKZp/Gy+bo7/ep0/g==
X-Google-Smtp-Source: AK7set+m0iyDhLybbQra1Mh0tgoInoxAaZlg1joIRnjfCJVkuIWQPofjhK4P4YWPgVu74VDSkXKUDg==
X-Received: by 2002:a17:907:2d0d:b0:903:9733:5ef with SMTP id gs13-20020a1709072d0d00b00903973305efmr38046533ejc.21.1678626856739;
        Sun, 12 Mar 2023 06:14:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:16 -0700 (PDT)
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
Subject: [PATCH 27/28] media: i2c: max9286: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:17 +0100
Message-Id: <20230312131318.351173-27-krzysztof.kozlowski@linaro.org>
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

  drivers/media/i2c/max9286.c:1707:34: error: ‘max9286_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 701038d6d19b..ed932ff9ec74 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1713,7 +1713,7 @@ MODULE_DEVICE_TABLE(of, max9286_dt_ids);
 static struct i2c_driver max9286_i2c_driver = {
 	.driver	= {
 		.name		= "max9286",
-		.of_match_table	= of_match_ptr(max9286_dt_ids),
+		.of_match_table	= max9286_dt_ids,
 	},
 	.probe_new	= max9286_probe,
 	.remove		= max9286_remove,
-- 
2.34.1

