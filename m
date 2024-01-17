Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1BC224E7
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jan 2024 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705509513; cv=none; b=auYxeM+Ph4ogC8SNius+08ONS8fTMNp3M/lVAGEHfbbwEw2MKw/jiR0Zmtk6x6HkalJJ1aPQwmep4tP8Cb1glbSD3y5KYyPCKwnpcfRTTcFggZdA3PgiyrviON3735OWMJkhzJzJZ6YRB5MqKzEbrd6n+ncJy+6OdyiNt8kh4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705509513; c=relaxed/simple;
	bh=CI8FxesCPgJRF5lo1ZJG3vw3sONTq+Pz84lrWr5vVxw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=cvqKkD5NoLx0wJGNjykqu/nh5W+yLPIX1JSZCfOS14M2RroBMFk4yejCnmH289eXCjOypuAjVElLhtgKseMkHbnjSOZWTGIYRpKQq1w96R1ozobM1s4zdpbyxagcpPPUMoI2FEShfXq+nP4bAEuBcveQJX03Cn9AkGIbagA/1PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUCsz1/F; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUCsz1/F"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-783195e57c7so731338485a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Jan 2024 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705509510; x=1706114310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRSAypqqIP1jQMTrlYCO4pCGABYvy6tncIcDPJFqsRI=;
        b=aUCsz1/FvbXV0ekqitEo4ZhBZwegfnsx5exrvbEz51LGdoFUL1iSUDPLITKvp1ygV3
         1O30u/xFUTm3Q5qMZzy9i+Z68xn7DpFk681d+GzgQw8YABROk7CCNDWIPUKKwxGgVgjp
         qe2Ixj/jZlPtaHOOcAqrx4uQI06g75tTDt4h0BIqbHxDGizodQVn2OECUu0jLesDd5TP
         PH6NBTkYHzqbLTq8NTy4IqFWcxBNSKaQ5SqPQNmwXFD0DrCfpRAd35I71/FXmpxWkRZ/
         AgJ4MhGxrfamVzVvgFtl4GGdpGiTvkp0a9NY2p4GVgi/99bg7lYxORDhbF2LenEzc2ys
         GTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509510; x=1706114310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRSAypqqIP1jQMTrlYCO4pCGABYvy6tncIcDPJFqsRI=;
        b=Bfe3QEEfeNx6vSKp0LFs7L8F9Z8nkEvLo3zmgPz08PxWAV59XW9xlj0zJD5wEZHxMs
         VJyOsMnz2FajSHOfl+769TKG5Ye6h1G5MvCAVvfBge0F3B+4nXpNIBHjiDGQIpnlmB4m
         hVz5ilZU/eHxbYQU2/2T/8zffRL5V/B+rXx+qCMLZcIopiosMIHhHkew88hiileG46YC
         Jb8dwmbzYgyeL4YkLcJzekCVSnejVhNkQdUwrwTuokF8H2Dm7yxqSXiQLn8rACzJ7WGa
         n1Esfnyucz7+rp0WmYfOkLkSeGJ0sVcHn/5rAQvx3YUz7Eeb0JE0fMeJTdZwtwnzWljR
         sYpQ==
X-Gm-Message-State: AOJu0YzxLmOM4K76k07dMpRK8K9Hn1RjwhQsdkqgNA5d+t4Ob0AvuojC
	QjDm+8ot4pSvrNHYkr5+S5I=
X-Google-Smtp-Source: AGHT+IGLqFm/gr1s2B4ba7dsGDsf9um5bzuADhUWGl9JQa3AyWkXAal12KAeW00hfqfWuGgt2rs9EA==
X-Received: by 2002:a37:c40d:0:b0:783:53f2:8288 with SMTP id d13-20020a37c40d000000b0078353f28288mr7619866qki.151.1705509510418;
        Wed, 17 Jan 2024 08:38:30 -0800 (PST)
Received: from localhost.localdomain (bras-vprn-ckvlon1747w-lp130-29-70-29-79-15.dsl.bell.ca. [70.29.79.15])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a038900b00783237b3330sm4623850qkm.31.2024.01.17.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:38:30 -0800 (PST)
From: Nick Alilovic <nickalilovic@gmail.com>
To: u-boot@lists.denx.de
Cc: andre.przywara@arm.com,
	jagan@amarulasolutions.com,
	linux-sunxi@lists.linux.dev,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH 2/2] configs: Transpeed 8K618-T: Add Transpeed 8K618-T board support
Date: Wed, 17 Jan 2024 11:37:56 -0500
Message-Id: <20240117163756.63875-2-nickalilovic@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117163756.63875-1-nickalilovic@gmail.com>
References: <20240117163756.63875-1-nickalilovic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a Chinese TV box based on Allwinner H618 SoC.

The DRAM parameters were derived from the values found in a firmware update.

This patch will add transpeed-8k618-t_defconfig to the configs directory.

Signed-off-by: Nick Alilovic <nickalilovic@gmail.com>
---
 configs/transpeed-8k618-t_defconfig | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 configs/transpeed-8k618-t_defconfig

diff --git a/configs/transpeed-8k618-t_defconfig b/configs/transpeed-8k618-t_defconfig
new file mode 100644
index 0000000000..7090577199
--- /dev/null
+++ b/configs/transpeed-8k618-t_defconfig
@@ -0,0 +1,25 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-transpeed-8k618-t"
+CONFIG_SPL=y
+CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
+CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
+CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1f12
+CONFIG_DRAM_SUN50I_H616_TPR0=0xc0001002
+CONFIG_DRAM_SUN50I_H616_TPR10=0x2f1107
+CONFIG_DRAM_SUN50I_H616_TPR11=0xddddcccc
+CONFIG_DRAM_SUN50I_H616_TPR12=0xeddc7665
+CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
+CONFIG_DRAM_CLK=648
+CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_AXP313_POWER=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_AXP_DCDC3_VOLT=1360
-- 
2.34.1

