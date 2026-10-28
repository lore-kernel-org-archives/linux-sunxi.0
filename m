Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164005;
	b=RCh8IMvN5buo/ILc5vpKTcNZL6BRZCC2O4fbiynhTjFpkMMXWCSxR3QL4lDz5pXJkB8+
	 S9byq8dg7HSEiwDyjAO1Yw49AkPpzRB09YnU2IdUIGdr80tTY3kvUXpnNcyFPmHzKqio2
	 Ji4uBa80GfjiS1IGAYB0i9gwTvN4wgKg724YKnzbs4Hg5qc4OuQnJjQoOhz9zOl8USVXB
	 F+rap9M9hpiCQMTrv4ISFMXowV2oKqtfN8AHloxLo+BhRYRlSZCZxQYAtOBnF7gzJZB2t
	 ExO4pjJBXxSe64nxQZ9bJIS3LFVxAW/UO5uUEV31h+EqSvyigV3Hv1cZVdxh4WpidXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164005;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=bUXd6wCGkdy3sUL1jP3fBL2bNrVaPeuZ1kav6MQ03xQ=;
	b=4DaxBC8f0UNBrFbZ2tMRoqRLRmf1rr+tQj3DRMIIlsTF8bPKdb8C9uR0PS6rVwjpnsO3
	 /Ti1e56w7cdHLjqHrU/heC3d6jlr5iiCmufud7QLMnzNdtFCfCUlqoQojXHgb1M+WbrLf
	 7mwQrngC93Hsi4tjaGpHH+fsJymibAzpuvpkOUwW/ydOCF6jn8XUDoAcnyjwHQakpFGVp
	 v1TeMvHz++ZScH8CYF6DYVsav3MDvghEq8AI0Pg+/LJ3fsbriwsYKGCb5iFi6iR7xidcl
	 soyDN240TsW1QoRw0rK8/CSfQNR4jW+uu9WzODdt78W54t19Ckho4JvwYfnI3K8OpnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nOzYcQ4q;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D8606A31D
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 05:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nOzYcQ4q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bU
	Xd6wCGkdy3sUL1jP3fBL2bNrVaPeuZ1kav6MQ03xQ=; b=nOzYcQ4qMVtVeZi2Pt
	cReMe+ncj9l3Cnb8pfwXcxRBscn3+ASfglv3RjT9Y4wDGCp80brrZn44/1DTuEdn
	VPxlee0+VnZ0DFi1S3L3RLUaX8mVRav2mfcgDWGdsP8OozxxHdVtMh2PfuP4UZKN
	Sc05LEkm2MJ9x/MoM5J9xCdq8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnt9XTguFq0hNpDQ--.19760S2;
	Wed, 28 Oct 2026 13:06:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Ban Tao <fengzheng923@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Joao Schim <joao@schimsalabim.eu>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: resume device for control access
Date: Wed, 28 Oct 2026 13:06:26 +0800
Message-Id: <20261028050626.133421-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnt9XTguFq0hNpDQ--.19760S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF43ur13Kr1DWF4DGF18AFb_yoWrGF45pF
	1fJF43tFs5Jw4F93ZFyr48Xr13CrZ3KF4kA3yIy3y7Cr1xGw1IgF9Fv34rCFZ0krZ0kFsr
	Ar1jv34Sg3Zaka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8AwsUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xToI2rhgtTr5QAA3j

The capture volume controls use regmap directly while runtime PM may
have suspended the DMIC and disabled its clocks. Since the regmap has no
cache, reading or writing a control while suspended accesses unpowered
hardware.

Use control callbacks which resume the device around the regmap access
and release the runtime PM reference afterwards.

Fixes: 9a8cadddd930 ("ASoC: sunxi: DMIC: Add controls for adjusting the mic gains")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 59 +++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 5c784b1f6846..a5f70db856b9 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -286,22 +286,55 @@ MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, 1);
 
-static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
+static int sun50i_dmic_get_volsw(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret;
 
-        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
-                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
-        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
-                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
-        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
-                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
-        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
-                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0)
+		return ret;
 
+	ret = snd_soc_get_volsw(kcontrol, ucontrol);
+	pm_runtime_put(component->dev);
 
+	return ret;
+}
+
+static int sun50i_dmic_put_volsw(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	pm_runtime_put(component->dev);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
+			   SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
+			   SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
+			   SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
+			   SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
 };
 
 static const struct snd_soc_component_driver sun50i_dmic_component = {
-- 
2.34.1

