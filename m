Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736FA7F
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 14:57:38 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id p5so7734558ljc.13
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=I8h6IKACxQlXXVq1OeWv2JZIqExd2BXra4rChfH99Xk=;
        b=QQcsfunSn1opiSC+tGIBb/82hXMfbk8jt/xhW4pgbxegftG1gG0ErLsBhw79+MXAab
         smwr36fp7WOYftAeRvzqTtLTMoRTkY1RlwVkBKd4o2vxpLJWOe6ozb5P9ntM2HKwLiQO
         GYLCCugpsnnPcWVXPpZ9hqYklyBCpuNGAEn6I068BtEtVIlQuXOuE92+cCtaZLsgd2Q9
         vHqz6HIPJ0iVXR3aVsjFVzhDoXPDESwUnytu1VtqmKOzdeqj8to/HMfWG8SwYEFRc3kC
         minkouqdBBusqivhJeR7GzMNItSHRSlnYUXzV+I953LQkCUVrD0dPPH/AyeIL8cKSHJn
         Q5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I8h6IKACxQlXXVq1OeWv2JZIqExd2BXra4rChfH99Xk=;
        b=T8vkR1+qx/p7pdoJlOIHB6Xer7eoBnLB8k3q/BUY4Kq5Yh7q33/lWZUos1ciiq75kJ
         7lb06pQnJbbyWUcpt+l81WD4axN1N52Ms0bPkZudxSIwHOsbHzvf0kKK/ACu5F5oCzDW
         HoRqna1OMjTuV5mYm8WMNs7+0yaXiFxHLCso3o0yct6E5WkBJfb75wz1jWa5Ikl5nmX6
         Wi2FXxBh1nlGYvCX9gYHk3nq1CuC4HB2amZgf1AHe2iA7ZCkdGLnwJvvzzhJk2qizX62
         m4WOd6I/TxD2q6fMursL8lA2BhVs99JRLEBy7HmtF+9DccJDNvqBxw7I/vw6/Wtbgqe3
         Wcmg==
X-Gm-Message-State: ACgBeo2lawdNrKaH4bboSArCE51ra2YAy1lDQbrZszx6GI+l16aK/PyL
	GiCqpKU8M4sZLDmKbxSWPz8=
X-Google-Smtp-Source: AA6agR6KZCWm2WPTqfmyxsXJXyYXPDtajUhuPpJYX5iMpEbTFfpkYbV2J5gKHD8BN9cp+Wh+DQVtCA==
X-Received: by 2002:a2e:a9a9:0:b0:261:bf5a:8ff3 with SMTP id x41-20020a2ea9a9000000b00261bf5a8ff3mr6654761ljq.252.1662908256454;
        Sun, 11 Sep 2022 07:57:36 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
        by smtp.gmail.com with ESMTPSA id p39-20020a05651213a700b0048a9e18ae67sm636891lfa.84.2022.09.11.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:57:35 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI component
Date: Sun, 11 Sep 2022 17:57:12 +0300
Message-Id: <20220911145713.55199-2-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911145713.55199-1-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At present, succesfull probing of H3 Codec results in an error

    debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already present!

This is caused by a directory name conflict between codec
components. Fix it by setting debugfs_prefix for the CPU DAI
component.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 01b461c64d68..4d118f271e8c 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1253,6 +1253,7 @@ static const struct snd_soc_component_driver sun8i_a23_codec_codec = {
 
 static const struct snd_soc_component_driver sun4i_codec_component = {
 	.name = "sun4i-codec",
+	.debugfs_prefix = "dai",
 };
 
 #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
-- 
2.37.3

