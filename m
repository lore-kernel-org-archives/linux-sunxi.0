Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0128E3A
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jan 2024 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705596347; cv=none; b=d7TO+59H0HjNMyLs/NdB2ch6YXlYYx87SMuZiJr78KknX2Y5VgRm9piaX7NWLuf47a4nwleSYJjhaQF+07r5oqBBbLEKsaU4zd6X8X9UYjU0NYTd4YfuymM3afnZT96OzeQ7COZRPpYO8Q60R8fCgCWnwwe2OzYa/WLcjwmBEqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705596347; c=relaxed/simple;
	bh=8vak0+7XsV3zV2KlkiTiS7rin13pbyLPvMoz/fWHFmk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=h9z7QjsD1kB5RPFjn3H1BRk0WkALExTa8ChTBZguYL90O2LJf6JNweBHkdD/H9rmb/Ew+6zaIAnYp2y3CfY2RWiQH4ZXnRtMmSui0xso+w7vDLoe63nnf2aEiWtddnKJMSLB/NWJkvDrm4GcHguSNhi5LStbXAfZms38APnxIa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJ9qnMzD; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJ9qnMzD"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bd6581bca0so3417469b6e.0
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jan 2024 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705596345; x=1706201145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sDom8L9VDnYHqI5K+aoFC/YHjBAnOJZUuDNfeK2VNa4=;
        b=mJ9qnMzDLseWf1dkcz2A9SagWITh92TH/obOF/IgYKCkDVfdPH4sqQwhhO2gc2bnox
         6B5pi+Spgl147MUn3Rh2OvaRh8s22Ig5uuKFIi7ksoFvLou4XzV0B0Bm/eDeh7IPjzhz
         nNNBO1VgkptPxiXqxp8dzUrE6f8u/TmTV4dxT5W2lsRX6O7jQtuMsg2yna9BTqi0CocD
         aul0O5teYRkb3WyDXtAV7eeAchnJr7OacsPKW78HTCclPkRqgxsdOy60SPfqmt+yT4Ww
         7rWQsj5XP3gbQjtqjvyA7eZe99r1ZEhyzZ8m+bLAOMOLIVhCYF9HO8CK9VXW6Tl4aT+8
         EQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596345; x=1706201145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDom8L9VDnYHqI5K+aoFC/YHjBAnOJZUuDNfeK2VNa4=;
        b=SusUmOuTSkF33gk+G8hjrnIhLzGx8wvjYuydAsL4x1OQBgjeUA9kVR0sgWM6VCrvI8
         pSZKBhcZFtJKVHR9a2wg+YbwZRgWNbmkrIXpWVUwXPVzaVCp3yvqIlsmLl6eYdm49djb
         VpssI+wcsqG+cFR7pAuR2idW1ISWEurumMaxwVg2FmqgFdKqwsenA7Ki4d2oRuJr0quN
         nYjKUZwGXAhqxLbOZHmdxF7mPa7ArXNP8acQlmKy8KRCW8xWYnDgFdsp3a3CcNPT/TCk
         qrtZq22bq391xXXM1J4eIo9Z24lU4qpEPdlt0way2WcrAO/dW9ioI21CqX6AHoODscC+
         KyCw==
X-Gm-Message-State: AOJu0Yw7FbN359KveTud+mCmu6b6tSBe5HKm6t0SeB9KvloPZKFRTOY/
	uTkGPoQv47S8qNI2XmJxveCzmIspE25RMjmHqgEvG+ZOz0U/RLf3
X-Google-Smtp-Source: AGHT+IGXU9inyXThAEu9ZpnRDVHEkzKyma31neCiRGv0zOAkseGzHvKeOcuiB5LA1r4Pc/BbYXQmNg==
X-Received: by 2002:a05:6808:14ce:b0:3bd:941d:9c36 with SMTP id f14-20020a05680814ce00b003bd941d9c36mr1505985oiw.70.1705596345143;
        Thu, 18 Jan 2024 08:45:45 -0800 (PST)
Received: from nick-Inspiron-5680.home ([70.29.79.15])
        by smtp.gmail.com with ESMTPSA id vv18-20020a05620a563200b00783574d5017sm3627368qkn.19.2024.01.18.08.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 08:45:44 -0800 (PST)
From: Nick Alilovic <nickalilovic@gmail.com>
To: u-boot@lists.denx.de
Cc: andre.przywara@arm.com,
	jagan@amarulasolutions.com,
	linux-sunxi@lists.linux.dev,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH v2] configs: Transpeed 8K618-T: Add Transpeed 8K618-T board support
Date: Thu, 18 Jan 2024 11:45:08 -0500
Message-Id: <20240118164508.43617-1-nickalilovic@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a Chinese TV box based on Allwinner H618 SoC.

The DRAM parameters were derived from the values found in a firmware update.

Signed-off-by: Nick Alilovic <nickalilovic@gmail.com>
---
This defconfig relies on the synced sun50i-h618-transpeed-8k618-t.dts file.

 configs/transpeed-8k618-t_defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 configs/transpeed-8k618-t_defconfig

diff --git a/configs/transpeed-8k618-t_defconfig b/configs/transpeed-8k618-t_defconfig
new file mode 100644
index 0000000000..020d3974af
--- /dev/null
+++ b/configs/transpeed-8k618-t_defconfig
@@ -0,0 +1,27 @@
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
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_AXP313_POWER=y
+CONFIG_AXP_DCDC3_VOLT=1360
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
-- 
2.34.1

