Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800400;
	b=H1OHPcNGkxOSXzVcN5YEVNVgWdY1XKWC3E2Xzhuf4xDeQZNs5P4bX4FoESov+TeRVgN6
	 ZuGjiWM5a0KodrLhkpESt02uxT0jm2q/Ym5fvnWGMpmt31b/bZ9BQXcKVfgdiXTqGTjtm
	 kyL/N7LzmbrGB6Vc9aADkuR1dQUltwYhyOIA4oSEu2mRxwiyMKfDXy7FE5ZxC9DCyThe8
	 mKdJ77BKOARcWVZ50sXpdfEuR4XN2Eqp2sDShkqjsuqit1IaW4/dz7xvGLJSYdQIWU5D6
	 YM6sRwIdis/MhDeIME8jJzP6lL7VA5Hj+ZM+CWKHGehIZgHuh7SNEhHmf6Ctgk1DHmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
	b=Q3VziAvssl+l5b+IgBet5Wl+ON4xLtEhtY0pyKzulG3VZdo8tK3RgSDQRk94A58B1rEl
	 6W5+nqqAYlrNyYEnyCkXsdS+z6zVTxyrjtU9/UagL+P1GT15pHygxjr8AscADyIonWhkl
	 kovGuvZhbs6Lw4OfRn0FFvSktuH+S7LcMSYTvFFEBb5wm2dkAc5WehjcE6Lfi77HJay36
	 EttsxVVU0GJXhNiTidGNkk2LZPGVbcemCHCorMdQavddn9viqZ7Aco+mfIG92vcqJtqGW
	 j5tT+W7FOstemLEqtKpOiXUzYZVqAZJzR5TpWWnGJ6/UXkFbzpWkuJq821Aka5GLtjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kjlUpv8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A031606A328
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 13:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A031606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kjlUpv8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso649838f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800399; x=1794405199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=0kjlUpv8nZYvaqbvvxDP/V8kLtS2mrN6EvVTjCZqGoPU4x3o7oRI/iiKhOAINjIgrS
         YBSLhqLw0sIF7Qd1F6JQW+YK5U7ZElObD3TO+cuJgxoDHFxBLv9oKRmVoP40zCTrpSK0
         psuKrUta5SO8vZNZRBE3s/2iIYxQjly18IvikJf23KOeM+jLCbbkQaUqIPoihyrFcVOg
         V7KfX+7fsciARlV7KwrPKQw8v8s7znhwvk4Ba+u5FKdcVRuXXLrkkEfV/ze2mgZFyUwG
         G4IN8ilFl+7Gin/Iuhu5XEFXr/IKwM4ET0Pwz1Wtfaq9RGcMOhjW8FQBnmFLOgKF6na8
         uKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800399; x=1794405199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=a6YhjutoRWwSfZy9c3cQaJHBFnt+AEPj4gBu0hTExAwzid6le7ELBV/YApLO5uYcw+
         GI1YuwAx36YtT4H7NXMl4fdbLign/TZdEG8zMYpS2Y77ryq+os7oXJ5iiiRfaW5yQCKR
         R/aoHnD4u12K8T26lu5GMRM+pLBi4nXRdAGc557uz9/efpKlZR98tc7svUeW6KI5VbqJ
         qg2iFKg0qmeRs+QIzkQeVVj4nkgnw3LFKkKmivbgNAHZtN3lQUDRL8IPUysztMJMi8IP
         WNKFtxXxy+e1lEeV1IcOncHR/mb+xBgP8PtgLbBscEyNO/jvvQlOby7qUu1s7Hq+doXH
         yYfw==
X-Forwarded-Encrypted: i=1; AKwUvBx4crbIvXf9ZtWNfMmhPPvxgap+zzns3gnjwqPxQJWTwtoJDw6pNwZ1gjJFUC68bh9icUcSvCxXNQPOsQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yiAXCeEu49oKzCYO2Wumuw1FOpH0UCJb/ZdfiuR5VnycerRSS
	OZ1ItIVI2FTawRMI7vfc7LjMFNCZaiL1ZdrjXKNukxdQapfDimKM7tv8
X-Gm-Gg: AYBFou3tZbNE3mXnuYcrHVsELKgAbx9EtBAvIHsw/qcl8HB6AkZPutkqTKSb/nt2uNs
	8wV/678yxV2ryczhnd4KiPzbFsMrIbJunGKh6RoAby05Zy+dBD2MbPYqwm+lYw051arKEHvtCX+
	AKaXPv9ZYNIOKKnxS0F6zT6467p4p5Xb+Bv+JMs3eWq/1szxVIT4tLa0SxlqJO9QsxFn9aCpvnT
	rXagnsrV0QipZqFWdywawr9/1JOy4nlRFvLZwyLXXGsjGi8PIPgSSTQ6patr2RPPmwnW6sCu7Ci
	U/ivFaCpAXSGcgd+ORalh8nDi+MX1KaZKL6+b4Qve6gZDeRAcO0n6jWGywFWNcAyMl2EXFqRGWz
	39wxBANTvEmjCTrTY9TC5Nx78CgnhZJqI78VtTQH10dCN36QhP0vy0WTF4fHOikArtAbH74Pv5+
	4Mo8zFtDgIIaR/hkCb9yc+C2LYlzghJ8Ezx77BE89XlWGe3ofyEMx9yDFhMExJSp3+JSQovMHVt
	v3CTvyKS1tdG0C/b3n7ANZo93A/5jjR+/hJ94A9Ifahx9PFpl70Dk1dTRlcgQIsXRvr++Fb/MmQ
	7tPO+VKTiLs7zjpt2OdbLIC+fBG0keOZDDp0KrgveLRRIAhJWBZFbwQro7lCR+h4ETt80TY2x7/
	diKS7RReAdVqc2wUJmAaqHWoe
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id ffacd0b85a97d-48e6e5008b4mr34049088f8f.26.1793800398437;
        Wed, 04 Nov 2026 05:53:18 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm4160971f8f.15.2026.11.04.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:53:17 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
Date: Wed,  4 Nov 2026 14:53:00 +0100
Message-ID: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
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

sun50i-dmic calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  sun50i-dmic.c:(.text+0x142bce): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_SUN50I_DMIC
unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SUN50I_DMIC=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 9fc2c8ed923d ("ASoC: sunxi: Add Allwinner H6 Digital MIC driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 sound/soc/sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 205f422d9ded..c8a626396e9a 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -58,6 +58,7 @@ config SND_SUN4I_SPDIF
 
 config SND_SUN50I_DMIC
 	tristate "Allwinner H6 DMIC Support"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M to add support for the DMIC audio block in the Allwinner
-- 
2.43.0

