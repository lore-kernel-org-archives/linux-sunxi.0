Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744833;
	b=LWu6wVOE8PhaffPJ2X/2kAJLKFB7YvHMcVEnsd7bran/PxYD1gUPudqUV4TaVma8zOpv
	 WXuPwp62byK9UPoHjh8Jbc0tgTNfzMRb7uajizKvu2mIiTnQfVcVFZpmBj9JU5RdQDvLl
	 Bpf5FFo2KYNHUd7kuHsBR62u6G+9xvBIfcB9aH6RxIeVlnN/IxDnQps4qB5UNVuMT1tpp
	 zp7mcmyAAfxXu0wRrLQobd5bDuN1s9UHd8x1VrF1CtSVLKeRRXYWWKBKTg2JXJrpAaicu
	 IuNCy/M16r8NfoA0AAV6sBf02R7j4oyqVx4X/CaswXqCZMNz7EUVI3vnjSqNO2lci0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
	b=vhP4pxZw+uGUwXXeCsZzAEILdJGaow4YOYiaCmoPgLvE5DKxXLpZsicaPLa/kWzwtJLP
	 Idj9xxlLv3hDyUCrLqLDEmDMnj3eJon8eHTq/znd56DRWlTCmEms0yOO9uPMUcQ9ROOH3
	 vtvsetMP6erd6LNJNKjFtVzfJND9hQPVXuhPYE4nPRjNI6WfgUQ1eDhu1a7tOl2LRt4sU
	 aLoVo9PHoAXMYBtCzF6zxoMBBDfyIDiXq6myf86jW285vMMxqU8jrPXhAxCrK0Se0BznX
	 i4q+7XNb7XXzkTRCzcjja9jEEbH3ZKKs74WqzMEY8m8H0/vl9Ht4qzJ5/yRjR161yJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahDbzzRh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5543606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 02:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5543606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahDbzzRh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so68898345e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744831; x=1796349631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=ahDbzzRhyo3zwbfwAL1VYQ9XVnNZJk4yoa0P7DFMXWibCFm+j2L+5TtXCcQiRSgJ1H
         qsM8MoLfxbMAPbyvIWvTT4SAz9zOUXGu4HeOq9OSd0Ces3Le5uHuqfvvL11M3qYUGmdV
         CJGtuwZpRgOka0Xuatod6xyX3SqwSIm45u4qzGTpj//iYlD5sDlNT1A9FgXEkcaOSNcT
         u1eMwNzlIsWb5mMNsAs91jvwtZNUu1mE4F2m9UbPm7oOHdN8UJScsf9ayMErj1EVYo0v
         b19krF+cLgePKisHP5WFFmu9XmKd+koz4wDAe738PBgaAZSi7lPWxzUVyIabIpU7DuOp
         sNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744831; x=1796349631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=cG0u7cdUHrV+Aclj9Rw7SFRG5JEz/Le+bNZJKNXQzAhCDC7mcEb4WcFvuTv+TcHEkx
         hCr3Ood7NZ7tzHJ5RjuILbyaxuCUWdChnFeBaAThVq7zO4CJTZW1xNPn0S3WIt6Xb8XK
         3NRcC95/PkQsQgqIVChmseITYzPILAWYkDjevwv8cx2wKu5/7bO+UlD8AhguW8e/2Tv0
         RKqwt6Q6/4fLw2pNTstiRLqE1N4XAjO5ycWgD8yAGHCWyNyEhpqFQ94X9uuj9t4jwWCP
         h5oUdpSRsg7+kGvdL88k0MJec+Nt61W1sODO7eZqdis3m0//l25LciqL4+AG+0lK2XlX
         1LqA==
X-Forwarded-Encrypted: i=1; AL+hErFRnrZtrzPh9wENYmx7doQXvG7KkMugVqQOzmSd6C0yMMfFvP5eTN3kOb41OZbHCw4ne2VjKIb9knuHkQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Pr6QuxxzyTJUMNfCSlHrqVA4P1hzAwLnzmBkgNMfV+HuIQNC5
	JlO34mH1myDlASkXBpQHpiqH/bBBLovSLTP7Je3ZjQVRoE5ZblBYelef
X-Gm-Gg: AZFdTZeaxFnCSjTrsTcjNx/LYpKJ6y1FBZZ+TceSlJGhip9fD6aELYaMJ030NVXMgYB
	6fdrZoT7cLX22AZMXhQ2k1Kg3i7tFi3hN0c9NNQwnLntd1xT5Ry/Hn5uXKodpX6T48DpFZuMhK0
	G97pAA3Koyph6VNCoSYZaLz5UYIlmqGLOOvK5RNMNEduNjeD8ePqsS8HXznSXAJdcdmlJtMZMpM
	PnCyLSvWO9mHgZXspBMA2Ic8/eaVi9BndnYq6pA5S0hGKox0i3pbVhBhLVVCVcExeXOiArXPIge
	y4qGnrqMoTc/gVHOEK1Rea1xUf8XJczvA5wPWk7KH87Y6YJUgT3PGLdW+2MBzEJdmZ9iP1bR801
	dtVBUEdhr6NyTU8RuScDEr/lCum7OwIIuMBbCiku2f6I8tMuzniXtmTw6f2sQq8vjFDgOrLBXi8
	2lCjKPPqWzD1vGmToYzaov8M8mh4KnSZbwI1lXrCZBSTWeXoNOHwBEHuRfoDw6j7JNEBiLsnUNt
	mcxJDY2irVMdzGb2Ua6KV6/2SJHRxaYOnTZrDdaFCC0SIm58bcFQ4LMIS9mUMAbEr8O9H3QnTHN
	+ZMglLTTBCvvt7pDLZkCwckg46wSu7AUaFNVwrQ/xlex/7V3OK/qo4YzSr18JPE1kvCp+/XVijQ
	/VUhzmOwJm5mWEby4DMwByVAp5X7W7EKwJCtNRQo3ChRu4A==
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr468130625e9.16.1795744831000;
        Thu, 26 Nov 2026 18:00:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm44994364f8f.2.2026.11.26.18.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:00:30 -0800 (PST)
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
Subject: [PATCH v2] ASoC: sun8i-codec-analog: Add the headphone inversion switches
Date: Fri, 27 Nov 2026 03:00:29 +0100
Message-ID: <20261127020029.1618525-1-romain.tisserand@gmail.com>
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
are "Left HPOUT Negative To Right HPOUT Mute" and "Right HPOUT Negative
To Left HPOUT Mute" in the A23 and A33 user manuals and the V3s
datasheet (0 = mute, the reset value). The driver defines them, but
nothing can set them.

The PocketGo S30 (A33) has a mono speaker amplifier bridged across HPL
and HPR. With the same signal on both outputs it gets very little;
setting bit 1 makes it clearly louder, which is what the board needs.

Expose each bit as its own switch, "Headphone L to R Inversion Playback
Switch" and "Headphone R to L Inversion Playback Switch". Both default
to off (the reset value), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Changes in v2:
- Two independent switches instead of one enum that kept both bits from
  being set together (Mark Brown). With both bits set the S30 speaker
  goes silent (results below), which does no harm, so there is no reason
  to forbid it in the driver.
- Commit message: describe the bits by their manual names and what the
  S30 needs, without a signal model I cannot back up.
- Link to v1: https://lore.kernel.org/r/20261103133935.2892210-1-romain.tisserand@gmail.com

Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, and =y in the A33 kernel
  below, no warnings. On a PocketGo S30 (A33, mono speaker amplifier bridged
  across HPL and HPR) on 7.3.1, stereo path (AIF1 DA0 "Stereo", headphone
  source DAC), 440 Hz tone on both channels, listening to the speaker:
  both switches off (PAEN_HP_CTRL 0xf4): quiet; "L to R" on (0xf6):
  clearly louder; both on (0xf7): silent apart from a few clicks. (The
  test kernel had longer control names, which ALSA truncated; this
  version only shortens them.)
  Before this version, the same bits written by hand while playing, with
  a second tone on the left channel only:

    bits 1:0     both channels    left channel only
    00           normal           normal
    10           louder           silent
    01           loud             loud
    11           silent           silent

- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..e24fd7bd0613 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -323,6 +323,13 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	/* inverted left to the right output, and the reverse */
+	SOC_SINGLE("Headphone L to R Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE, 1, 0),
+	SOC_SINGLE("Headphone R to L Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE, 1, 0),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: 9f961caa18fc4678067232f8f021a23cb1588de4
-- 
2.43.0

