Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713178;
	b=HLA24PPdB2AFZlsKVyMa/lxTyyKx22GOP3ftROvEcoREcZ7cZuwsnXwP34mlHNM9IZ0x
	 1U50R+CvgLuUPM7NgwEl9tdTdOoTExNk7BcmRvZll1e1LPA/gMcsxvkbIJPbt11GTbz0Y
	 EU0lesiuh6sj33ScdoZ1qQI1DLWvCYIxQE18RjX42DTPLNdYidGGcm6itR3L4nqNOVcaR
	 I1UpKbvWgYaEBISxyihCA67KdYUIYYA8Tgn35EDDoHICH0oJTEG8Wg/VL/CjpbJy123ZH
	 PhrZyn/cWOOIhhS3K/oWyLVPUGiRNi+J/XF3jTkpXmrG1OTA18PJ3JazA3+v/VqUuJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
	b=XhmaONIiE3O11ahnnUE7LT6/wvby8hwhPi7mgilmmNa7XrbGpzezySlHEKcSlT0jC335
	 SSF0KoJ2hZORrUImK9TKPmrdj530lQuRTYMmbhg/2Dm19hcbeTcHrYijW8aSKmzFsgApR
	 rRq2MRyl4FmCcInax9Lv2HEmcryAcwR39LylEetswmx/tRLd9jXeiMLGkHnlrskOmvw3K
	 /1bV+x5KU3pPmMHZWSNBr6W9RHykB2w3FJWQDpwMUgPEqHOTyGbeKxv/QK5CSK5QnQcy7
	 zDYO5akbFF4yXQ/rcSWA+KzcBQun0aW46kFq8pWqUUeOBfvO6axmTlhWuq7Ec0X8GnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbTQ1AWP;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330C606A332
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 13:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4330C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbTQ1AWP
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso37313005e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 05:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713177; x=1794317977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=bbTQ1AWPt56hxQiTJLA7+KxeZidPy0UAldQ4KmzhrAmRsuFNZuhtXWH1JSqs3abe5b
         WqFRhaso7dGRoOuJyNf5pc1jCbVV/mj3p5nTFH/A3fJuybUPlBQWQCe+oBJXVBlXAr2r
         NS+5wdkB8j8N11rHtXD+bvovjeIvUvQLbAHJjXkiDsSp8YUe7YU3PrSLrLiciPPUEmq8
         LI5la9h+P/KXtJCKhiIjN/BHlp239bScMUfl8lI9Is7VWR0YaauqCbJrVeiyR2tBGJjv
         t5fo/rLV3ojHZAYIwHc/ExVyZ7dhzZxv0yYaH5Ch6dE64dIEZ90edFzVJVPGfWSicbsD
         t3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713177; x=1794317977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=RIRpKSEIyJiFgIKs6WXM08vn3ADebFEWNJVhA79B5aJ+p7oyZsCqFgXn/6CRX5Kq9H
         zojp3SqiMK4pvyDOJlPfMFzTrAHXJbHDec3yKl04tOF3kn9zOXnnZfuw4mBYjl1sFR/T
         kThE5cojybJq6MghlVvNpIZHUdNLq54wC8a2CzJMRzFHyA+ezmfOsKMGYkaFAgR0Sz4c
         wFJkxfffUltgdyXP4dSL8i6Jrjn2xrE30DNOIZsC+2FhW83Y4CXsVWrTvFYOAgBmIvvi
         maCDXOalirHTnvhOnzAMv60mpYT6b5KPbNfdi8XrxUcoKra1uT8+jLdygXSL6qn9ML5u
         mrbw==
X-Forwarded-Encrypted: i=1; AKwUvBwwQJ+uFYLgiv3D75pm7W7g7cjmTTNyRQgOXemLUIEe+HLbMxWalZ4bz60h5lfSCYqmwcoCidPd7xjr5w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xjEAJwDde8JMQPmRlpZ5sB9euy/wjvqSwHWVT8LCDkSCviVO/
	xVI/MvHdYSkBK0ecGd63Hw4BRluu3AWPuaA3PdKEKxuuG79D56bShpeC
X-Gm-Gg: AYBFou1R568FvzPxWGNqCr0F85yo3Rg2KLXXS1R7nPsAf28mp/EKdcTCzlYo1L8SeZL
	KBHUHASfzUgEPlopI2adF7+uMRN9CZbGyDU9Hn6WnY6x/JueJUR37dIev70Rn5VbWCoZIRZmOQE
	BDAbEYdkVu1TkKUgbxCzLrrxzkh70LcZkXifBxKdP+hVIHT1bLxrNd839tgn1Rk28k5ZKFtyZXG
	j6sgd/0jVlcOKVsQs1GLlYFbQfgqkRNPJLAoStCYCqcuXCUyU9EHV/4dKqL4qmu3JGbek17dm0D
	Lj28a/GLHJmpIGOgah+daq63BxXyRaVH/xQgwB41RLfp+9XJ0XOsXbNilZ+wKtGae3YnonmJvTO
	09+4TXYoMl+RhW7EVIapjZozWnRt7UmwJ7L9M4Bc1ObWNs4ecvfffFdqrsCzr3eDFWnhBNIvQnr
	QxBYqGN9oM+69XwKLVno38LySjAEsuY2rUU9MrYyRozDEdynQpYaOCw693Ks1gfZxngSfzxeo29
	ebldDy97dXO+HrbMkjsUWfOenieQXJsBuSsi8YVcI2UhEozoct2EXnrlrCqw9A9hvKm3LT5uIJx
	56WgHQNEuxO3Ll+SbWbL9EnyjDX8SFIxkD337d1bk8B7/eMh8ywTpRh97478JGr3KPP513Eain4
	lXNPsvKyZ4jkm6MxBbZQWbiYkY3MujbM8zLiJ/8cbuZOE7g==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr319276755e9.17.1793713176492;
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm24174999f8f.24.2026.11.03.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Tue,  3 Nov 2026 14:39:35 +0100
Message-ID: <20261103133935.2892210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
feed the inverted left output to the right one and the inverted right
output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
mute, the reset value). The driver defines them but nothing can set
them.

They are needed when a mono speaker amplifier is bridged across HPL and
HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
the speaker gets almost nothing. With a mono mix on both DACs and the
inverted left added to the right output, HPL - HPR carries the signal.

Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
that the two outputs are never fed with each other at the same time. It
defaults to "Off" (both muted), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, no warnings. On a PocketGo S30
  (A33, mono speaker amplifier bridged across HPL and HPR), first with
  the bits written by hand while a 600 Hz tone played (same tone on both
  channels, AIF1 DA0 route "Mix Mono"): with PAEN_HP_CTRL = 0xf4 (HPCOM
  driven, no inversion) the speaker is much quieter than with 0xf6
  (bit 1 set) or 0xf5 (bit 0 set, the other output muted).
  Then on 7.3.1 with this patch, same tone through PipeWire: "Headphone
  Inversion Playback Route" = "Left to Right" sets bit 1 (0xf4 -> 0xf6)
  and the speaker is clearly louder than with "Off"; "Right to Left"
  sets bit 0 (0xf5).
- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..7188b498fb08 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -314,6 +314,25 @@ static const struct snd_soc_dapm_route sun8i_codec_mixer_routes[] = {
 
 /* headphone specific controls, widgets, and routes */
 static const DECLARE_TLV_DB_SCALE(sun8i_codec_hp_vol_scale, -6300, 100, 1);
+
+/* For a speaker bridged across HPL and HPR: one direction at a time */
+static const char * const sun8i_codec_hp_inv_enum_text[] = {
+	"Off", "Left to Right", "Right to Left",
+};
+
+static const unsigned int sun8i_codec_hp_inv_enum_values[] = {
+	0,
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE),
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(sun8i_codec_hp_inv_enum,
+				  SUN8I_ADDA_PAEN_HP_CTRL, 0,
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE) |
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+				  sun8i_codec_hp_inv_enum_text,
+				  sun8i_codec_hp_inv_enum_values);
+
 static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 	SOC_SINGLE_TLV("Headphone Playback Volume",
 		       SUN8I_ADDA_HP_VOLC,
@@ -323,6 +342,8 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	SOC_ENUM("Headphone Inversion Playback Route",
+		 sun8i_codec_hp_inv_enum),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: aae83f3931bc3a5497bcc8351b5f954ad7ac895c
-- 
2.43.0

