Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A253D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v14so16096961wra.5
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rwq1xrraD4RZAx2kCX1gT4beeMnmuxO1mM9UwNM/j94=;
        b=QNECaX952+TTlSLlpOVs/6XitpxYvWRdZb+grPlyuTrwlpraID/DEO7pF7pRWsRnhg
         hjsEeZ5QkVN79568dtxIQ2IXGLbC5nR7sF+MgWAVMh5hkBWMw0P53fMMGZkmjvLcFNNa
         dhUutUl0wGwONV7Kom3uv28INHcBCYzOkQGuNSDENRNw1sxJZQ0/eMfiA/Qgxb87L4I8
         /Ptke0D3H96sRWpppziAeYZU/tnFck/UsfeMN/LXYqm2I78lehUvPTyO3hQ8x4y7ScUk
         uchno9kgBiWN8XY4/R7yf92muZ6rRsjh0pZSVJsyikq3CxlSVWLF/qU3eR8EP1K+XGbx
         gjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rwq1xrraD4RZAx2kCX1gT4beeMnmuxO1mM9UwNM/j94=;
        b=nyjtsy2paq25XErpC2t+TErpVFB4O7SaFEYyiDQE5CUtfPsblkcQAS7iiQKwookPi9
         HME/OL9XcUB/We0hxrZkjZ32j51nh/77+ouK59fNsb8RmRi41Zi9og1YIkNHqhHLAr5+
         CPWitSSpoNWZZPavQ2/sY9QqKWLH4Se+4T1PjyMU2d3FBJ0yjgOS1L7Y3+btX157tbcC
         aYeJZUF7IAsH8KDA5QZb+PrWcY3plJoR4L/Mm6l74xOGsP/QPc5eHOYvPipyFKzozj3n
         G8QTeEGzcS/lG3WpNqrP23uSg6sCLCtiKSn0zcfeIInsIe0QSuB65iLC2k9NfvdbncIf
         wERQ==
X-Gm-Message-State: AJIora+vgfXgYF997h+8joTAG83gmnrws4hDnSqV8SrKmMM5fumSfBje
	wOiDJ0oDoOBwH++ZgKs38ks=
X-Google-Smtp-Source: AGRyM1tP2UDTugiqATrashu5vRyEcZXwb3725FZvBb5Omwk2LFohTTxHAY3xss+vpJU1LZ+f8ik2aw==
X-Received: by 2002:adf:ef42:0:b0:21b:8e58:f24b with SMTP id c2-20020adfef42000000b0021b8e58f24bmr7537796wrp.257.1655755585865;
        Mon, 20 Jun 2022 13:06:25 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id u3-20020adfeb43000000b0021a34023ca3sm13936104wrn.62.2022.06.20.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Cc: agross@kernel.org,
	bjorn.andersson@linaro.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@codeaurora.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	b.zolnierkie@samsung.com,
	myungjoo.ham@samsung.com,
	michael@walle.cc,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tglx@linutronix.de,
	maz@kernel.org,
	lee.jones@linaro.org,
	mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	rjones@gateworks.com,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang7@gmail.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [PATCH 07/49] sound: soc: codecs: wcd9335: Convert irq chip to config regs
Date: Mon, 20 Jun 2022 21:06:02 +0100
Message-Id: <20220620200644.1961936-8-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the driver to config registers. This will allow the old
type register code in regmap-irq to be removed.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 617a36a89dfe..727d4436142a 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5020,16 +5020,22 @@ static const struct regmap_irq wcd9335_codec_irqs[] = {
 	},
 };
 
+static const unsigned int wcd9335_config_regs[] = {
+	WCD9335_INTR_LEVEL0,
+};
+
 static const struct regmap_irq_chip wcd9335_regmap_irq1_chip = {
 	.name = "wcd9335_pin1_irq",
 	.status_base = WCD9335_INTR_PIN1_STATUS0,
 	.mask_base = WCD9335_INTR_PIN1_MASK0,
 	.ack_base = WCD9335_INTR_PIN1_CLEAR0,
-	.type_base = WCD9335_INTR_LEVEL0,
-	.num_type_reg = 4,
 	.num_regs = 4,
 	.irqs = wcd9335_codec_irqs,
 	.num_irqs = ARRAY_SIZE(wcd9335_codec_irqs),
+	.config_base = wcd9335_config_regs,
+	.num_config_bases = ARRAY_SIZE(wcd9335_config_regs),
+	.num_config_regs = 4,
+	.set_type_config = regmap_irq_set_type_config_simple,
 };
 
 static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
-- 
2.35.1

