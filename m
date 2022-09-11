Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026957F
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 14:57:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id f9so10151234lfr.3
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=eAQ7pZ3gOqppStIbzWQfQ4sG+iuDRIjLuat0vE00Rkw=;
        b=i/f4nXEJosWajMhzlcgxo2AeRYy8/SU8YuJsy/YUexGUSfmdHSfyaXFHg67uwCzsZb
         CR/VJbhPFE3qG02Dz87HQ9kq3KyWDatY6+wb99maWe+95+TNU45rKgTiCOv+VSP/9V1V
         vguqDDgMyaJ1D8i7P6UXyIX41SjYzJx6HmUoG126H/Q+EzuVmAZ7DYCLqVHx3IapunVh
         v1m5TVQdblRjU6beiAIxjsWfs76gCfl3dAqV45FHzMxtddBYYRobhEMYXGHeotwh+sXv
         1Rq2SavvkmaOgsDp+osvWjbzAHvUIG/Vop9j/gtmGReUBz7NqGju/T7zQxZKpe2oyA2a
         xvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=eAQ7pZ3gOqppStIbzWQfQ4sG+iuDRIjLuat0vE00Rkw=;
        b=rN7VfIfDY7Ugu+KNc6ciDvcCxybBQfpqf2LdXrc5S/Z3mUf5VRINjFIw/o1uQ7oLAG
         ttMzmskNp8SvurpQ8ksDHdBCji0p8dJvruJvaXKwi7Lg4ZJygmMzcZ33D5aAJylEjb/a
         rpR4zbzb3WdErBP09k5C9skXzAqedSz4rATb75qOBqNtslidgrDiX8Q9yrYeSqlu5ewC
         oyDt0fxxrRrYZ12A0k2WNFdqoK6e2Zxgqm//Wpd70mPiP12H8yUX/8U3Y49BhB2cM/La
         4s5RSm+P6WIw1uunbFWK3A3tYuIO3/XnPT5Wf8f/6FPB/GIpjuqNxs0lvLcz9BOim7aL
         qVjw==
X-Gm-Message-State: ACgBeo13vZWz773U6AhdTz2Wfrg01HmH/TyDojJBw7EDkH/knYaCeAjP
	TQi9I56Uayax3js2QVAT478=
X-Google-Smtp-Source: AA6agR4dOV0r3KZlPBj/fj8prupK0Ya8fCrBCJbZOIV671RYwn5zSNIK6JfGj+HSnJYrgcAzn07meQ==
X-Received: by 2002:a05:6512:3090:b0:48b:6e1:1b55 with SMTP id z16-20020a056512309000b0048b06e11b55mr8106591lfd.535.1662908248930;
        Sun, 11 Sep 2022 07:57:28 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
        by smtp.gmail.com with ESMTPSA id k5-20020a2e9205000000b0026181f65600sm675817ljg.136.2022.09.11.07.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:57:28 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in probe
Date: Sun, 11 Sep 2022 17:57:11 +0300
Message-Id: <20220911145713.55199-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
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

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 60712f24ade5..01b461c64d68 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1825,7 +1825,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our card\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
 		goto err_assert_reset;
 	}
 
-- 
2.37.3

