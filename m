Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A472
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Nov 2021 20:08:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u1so32992828wru.13
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Nov 2021 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vv3++EAvq4bz+YuG3ou53n/DT6vcjuuoVxgm/bXL6Vw=;
        b=ETdHq22ic93KuqD21fistzxz9DwapDxVE5IFlchvdlZLMZVkDkdQdtI0XfWM0TkRMo
         7owXz/jTpVlQoqmO+nXOnmpKpkYm0l5uFLvT8Qobk+ks9yiZAscigvn/wu+20NFYsXsz
         p+Zwq5DBi561IUJfq0Me8tBsFvjsxuiNVzw3DwofnZysI0e0XvegFAETn/Bad0dhhC0p
         NrhzFo4UBQFQMxWbL0eDEAfrPHNfgX5VBDQmbs2NZ/avjNMU/5vcBiudHr+7SivjuCct
         GcURA9tHOs9rXQi/w7PtVzwMCSMuUCDG2AlLExJ/TKtfJqjCgkofIaG2xyBX69GAK2h0
         nV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vv3++EAvq4bz+YuG3ou53n/DT6vcjuuoVxgm/bXL6Vw=;
        b=DwjW4wtcA3rhI81umD1csR3Dy1JkuN9atQJmLFcoJNoPQR+bxblelu3yqMv8uNYN+h
         eEjl/Owv1GFW7vQ9j+nWr3H8rrVYRoof12YawCeG0UVeTVSDZv2mvQuTmZVFdzWdhgCn
         cttvNJi1Jojq/oOr197EX93jMzMwTFiZKQkUvvFE58IH/m81CcG35IrOQzQuTeR56/tC
         SED1jZrz56iqyaFYu2DU2DpnqeHeVr/yz+v/J+34kRqq8SybLvlXKUYDOkcYIC1eglWX
         czEAh3V0SKQ/Bsk6591wAzLQOSzt9V3j5vwCotaV8KI/Stauza/QHxho0swTsEeMJUIx
         i0Kw==
X-Gm-Message-State: AOAM532s3ePKcLFWkm4CKrQqIiKU4U3VbPYSDhjcyMUiOWI0ucOaVqek
	b6VAk5F4XEkEbG8Wx2ILuM8=
X-Google-Smtp-Source: ABdhPJzJcHuXy3LPbIo21wm3J2OBVA00Rxd1RPMy7rqvNd62ZvgeaLU5H2MB62p4KuUsBnAXDoedPg==
X-Received: by 2002:adf:f947:: with SMTP id q7mr2120309wrr.260.1637006917995;
        Mon, 15 Nov 2021 12:08:37 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h13sm15645389wrx.82.2021.11.15.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 12:08:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
Date: Mon, 15 Nov 2021 21:08:33 +0100
Message-Id: <20211115200833.452559-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPDIF core is capable of sending custom status.

Implement IEC958 control handling.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 99 +++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index a10949bf0ca1..f7438e3ece65 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <sound/asoundef.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -385,11 +386,109 @@ static int sun4i_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	return ret;
 }
 
+static int sun4i_spdif_info(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int sun4i_spdif_get_status_mask(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	u8 *status = ucontrol->value.iec958.status;
+
+	status[0] = 0xff;
+	status[1] = 0xff;
+	status[2] = 0xff;
+	status[3] = 0xff;
+	status[4] = 0xff;
+	status[5] = 0x03;
+
+	return 0;
+}
+
+static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
+	u8 *status = ucontrol->value.iec958.status;
+	unsigned int reg;
+
+	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
+
+	status[0] = reg & 0xff;
+	status[1] = (reg >> 8) & 0xff;
+	status[2] = (reg >> 16) & 0xff;
+	status[3] = (reg >> 24) & 0xff;
+
+	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
+
+	status[4] = reg & 0xff;
+	status[5] = (reg >> 8) & 0x3;
+
+	return 0;
+}
+
+static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
+	u8 *status = ucontrol->value.iec958.status;
+	unsigned int reg;
+
+	reg = (u32)status[3] << 24;
+	reg |= (u32)status[2] << 16;
+	reg |= (u32)status[1] << 8;
+	reg |= (u32)status[0];
+
+	regmap_write(host->regmap, SUN4I_SPDIF_TXCHSTA0, reg);
+
+	reg = (u32)(status[5] & 3) << 8;
+	reg |= (u32)status[4];
+
+	regmap_write(host->regmap, SUN4I_SPDIF_TXCHSTA1, reg);
+
+	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+	if (status[0] & IEC958_AES0_NONAUDIO)
+		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+
+	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+			   SUN4I_SPDIF_TXCFG_CHSTMODE |
+			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+
+	return 0;
+}
+
+static struct snd_kcontrol_new sun4i_spdif_controls[] = {
+	{
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, MASK),
+		.info = sun4i_spdif_info,
+		.get = sun4i_spdif_get_status_mask
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.info = sun4i_spdif_info,
+		.get = sun4i_spdif_get_status,
+		.put = sun4i_spdif_set_status
+	}
+};
+
 static int sun4i_spdif_soc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(dai);
 
 	snd_soc_dai_init_dma_data(dai, &host->dma_params_tx, NULL);
+	snd_soc_add_dai_controls(dai, sun4i_spdif_controls,
+				 ARRAY_SIZE(sun4i_spdif_controls));
+
 	return 0;
 }
 
-- 
2.33.1

