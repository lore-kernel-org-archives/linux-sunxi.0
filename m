Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74F3C3F
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 21:23:04 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u18so22113810lfo.8
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 14:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IcnIgmMTd0DbyquQgMbmNfx9FsBF4BI9rV5mzK+kC9s=;
        b=Qik0HCAE4mWGdPhhl3Z4XxHZp2Fsh0qBqor3gfQ7RHj1oA6dc1TrGetu03nykh1gIs
         w+ofH7Fq69SEMBdJ6Ch4oIylIIktjNbYHlz/yjxBxzoJ4pRA+e6nMmQ4GUXJUYgi7fdO
         ZUY3CacnUYhm1obecq1Z183lWv5T5Jw0YJnsIXaiSMe7zocNkqyvQzKrIM4M7d88m2HQ
         IfJM1vEV597EU42uX81zY0iOXdGc5+/VGJG/4bp5uVAFNB1s5HEJw0Q0DB/s4FOosgez
         t5RMwiGNUr3quyrVSVMEYmfX6VB1rt+KlxCbBwURFi/6i0gclZ8xRNSu6UiGPjteEK2U
         6pPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IcnIgmMTd0DbyquQgMbmNfx9FsBF4BI9rV5mzK+kC9s=;
        b=RJWR9TdYiP61NjbbfXBcB9tJoZ7VPhJIBPEu6wViklSLIegdckToHGzo81MrMn9qu4
         /RNdFSWqiMSd2P5czSkAgUU3oonTo1HDD6T03+HZIXoRUioezo1z/gtoHnd/+Y2v/etF
         d2fjNZNrpNWKYS39d094Lw5PLbvATR6ocWk6/kut/cKqfAavxJVntMBGJxgD2kbGPVUh
         djSMH1YDB2s1hA5RX20O2Yhbo3CBp/+xe9y02EGuytGVOJF+TCCCHDJWIcK5LR6fgO85
         /yWulXpFweo1Oz9z0JY/0WUWwwvJHuOIAAUIQyEUMeFuS8gozlY/5DsGun3ezrrZxuYy
         XZ+A==
X-Gm-Message-State: ACgBeo1tEWAz67/vpqtQujGbfsKFYzaL37dzI/ZrO+9+CWxFatSwZfyS
	ZUvgSNcELztbz82JNY0T+mA=
X-Google-Smtp-Source: AA6agR7lqpwxdnlrp1g555khCJ+9y1Mn78ZuFzcawcY9GJzf7Jw2t+odgShu0RDTZclAju9cgeR/kw==
X-Received: by 2002:a19:e00d:0:b0:492:e5a5:588b with SMTP id x13-20020a19e00d000000b00492e5a5588bmr10452415lfg.243.1663104182075;
        Tue, 13 Sep 2022 14:23:02 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
        by smtp.gmail.com with ESMTPSA id s28-20020a195e1c000000b004979da67114sm1964736lfb.255.2022.09.13.14.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 14:23:01 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Li Chen <lchen@ambarella.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in probe
Date: Wed, 14 Sep 2022 00:22:54 +0300
Message-Id: <20220913212256.151799-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <YyCqC2EypxnoJFk7@sirena.org.uk>
References: <YyCqC2EypxnoJFk7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case when a codec device is probed before codec analog
controls, snd_soc_register_card() returns -EPROBE_DEFER, resulting in
a misleading error message

    sun4i-codec 1c22c00.codec: Failed to register our card

even if the device is probed successfully later. Use dev_err_probe()
to demote the above error to a debug message.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
changes in v2:
- rebase against current tree
- add Jernej's Acked-by

 sound/soc/sunxi/sun4i-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 830beb38bf15..3a7075d03c23 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1804,7 +1804,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)

 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our card\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
 		goto err_assert_reset;
 	}

--
2.37.3
