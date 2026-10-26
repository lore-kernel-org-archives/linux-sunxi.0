Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035961;
	b=bdVAswn/lr8T2VJN0MuZ55E8XRfPQdY+X5ImAqIjLaek/glOg6Kf2TFNzja4geG9VfG7
	 fZmUcH+agB7U9LSeo/ATO2nz5oOQ9YJxmyIfQhSa1KUs6C1C51gIha1GjxK41Dl8EjPfB
	 rA7EV6NSra8hTukgbhvrAoMFI6l6/9euXLHdv7jveYzfbu8xCMBPyAAGs9qk2mwsSolHK
	 97emrPyxt7nkYeQh7tXMaG+MPbA0GUwkjo3T9lo4PEOcBwKXA2Zak7XhZ9N00UJjbyc+c
	 4H+IIC3TWmryDKeP3CnAFQ8iF2VEo4Fs3vTxUWLst25svw/EvahJG3tOA4J2q+coXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jCuGb2VpjXDloCdVrhBCpNcmpPo64J7RAQyh/JM6yO8=;
	b=xO/yrUELUKHNT/bXW41lF1iyOJGmIvEVQFlofIjk3BS3nrtzHWx+Pf81Y1MejRsepyDQ
	 Ll+OzVCK5CXcG7mo6KnpJTPg4dVJh2J57I/xUgwvwnYsQ9Z+ZuEEXKlYvTAs/70CrnkjE
	 dbKei2fPIH16kiMvbOoSeghqDzdmB4PUy84uGQnWTrRcKcfbUnxl+YbNeqQJjyBU+8Hmk
	 WdI1PHfkN7GRmr/Xsfk9IZzHlKhD74Ohk/OBSFH5ojRZfXIrGzYrxgzC+C+RmyvPACsne
	 FgeRAPSbA3BAm1J+LrCtqcXu5ZRqVIZYrGBdmRqt6OJKs7bp/c8zzn/VeQ/1t7ZQTFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="WO01/TNk";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C87606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 17:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WO01/TNk
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so20671435e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793035960; x=1793640760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCuGb2VpjXDloCdVrhBCpNcmpPo64J7RAQyh/JM6yO8=;
        b=WO01/TNkAhU1qbbv2tz9AhKDGJPhShPANZrQeGTNiwQAQ3Pnbx7klqMESpYwWQbaKq
         lK8P83n4qU/6fqCdgLmUmzt5u1GsjACGV8D19WAhv6au+CbNd6tL8ZJmfISorGhkpoyj
         FQhH/bAJ4z/0giAykZAHEC2jhXJ0cv8WSAkT+f5lji2S7xueHvdGL/BuMn/NygZ70A3+
         i9pmNj7Hujj3seeUsOyCILkg0B+fZsYrHSu5H0Frz7eRo8+6HSatGnjVqa9r1YtoLV87
         SDRBpmYVVIKrq+KIVkIt1wdhg0DN9kMyK7VVmqyTt6GpJ9O1ktq/hQnNawB5QplDwdij
         OqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793035960; x=1793640760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCuGb2VpjXDloCdVrhBCpNcmpPo64J7RAQyh/JM6yO8=;
        b=0G4fgjo5ofzrYGx5JQuaNPauVxviuW3B5ow2gSnPsXcPl3w4bmEwQ0/VHRn1hIqUhn
         bdXYuP6qK2BivSFor1ISJoBdhUw16MyFcNCY6QY61CDbGrjFLbSpFj/T3t57Gw3LYNbL
         PtlAlaqf5ipLivoTEYkP00lcyLXJCdS6NfxhRLXj9mFRywegs9rCSz9l6ZyB5psVNpoT
         He+bKNAh9/FXhqj03g0pLF16+xftPbHGf4sT2pGhTfOcm+wbl0MMIPXTcXm6eaAPucVp
         myFANUidb/ZjyIA/tbWZQiFLw9tSCzQ6pIrNGsQ6iXpMsmaKDMOj7XvtTJr0ZiGb/xOP
         uSnA==
X-Forwarded-Encrypted: i=1; AKwUvByBWXQNrwOllksFDf6AYsaPYuV5IiRzpOSpPtnnmt66Vd/M+eIEFP9Bt0UfWNAZCykY3IMU7vYzTVBPXw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJRuZfp5phhej9cDWjgl4+47WrkOyQ96mJ0yCHPGL9T6wnhofIr
	C8NbfhhiuNS55nrYlsWUKNlYhpDd2O1Ak3IQap3gvrF1i250cTMiX+8A
X-Gm-Gg: AYBFou04KdpIWk5eKDwZsItCuPk8J4MVuoCNfCEgMw3+3LxaLCdI65H95kc/nKYMh5u
	hgMvL2GIIFhbFWEHkEALcGGMG3NRsDLhvBZ/QYXnzzQkObJzYzP8iXV87eEA0ZSbyYZwQU8IMeG
	BoBfJtNWQRmD88kkCtr/du4WF3YSipT+w0mcVUr2RwYQ81y2VoC5IJew8q6PgYjtOUXyA/NS/8E
	hzAcJas9HvvyKutc1lJLj7VSlf85DzqIubowtc/8ZtFTEjg+OTAT8NRZXrD1FENHb2JEtdyRSTj
	J4+BOXVOQaJKEMTn2n8omW485GMhlQ49Aou0kAb9/7pVrZrAgG+r5aj0V62Zn7c65TcaYSVkKZa
	KcPHEGUfiPmIyzul4nORB0I/lOUIaH4veHprCzPWMmzj2H3FcQanu93DzNRAc/MQTKpCgmOwefl
	GyzNuwEPUfg8zBKK5hVLVYi+73ef/V67f6gZHOjCgae7vyR0zVMNBQtksWKh0WhFP5xQYXp3PFg
	boWH7Zw3oAP71pUVAM1nDk/P2nW9wPoXgAEe0S0bXd9eLC7vJR3D/y90Isc8fbZ2vL3MNPavL73
	3VNbbhOfrsE2OxDy7GvJVj316sQLZRAjKIiS3JofQRnP4Kp0Y7hvv52Yx9MfU+Bzi/7s8qsQHjW
	MQRDrI1fphDEIIY/8QdXCRVU0ikGHYrcg/anXRXG3LS4d30zm0Hzo7LgmC2JGd+0SKIIa66BedP
	mfEkNxd91xEQ4C2csmPDnFtBWj+M4b1odbynHplHCFebQDLVZiwFzqZXLhSFwuVg==
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr139633405e9.8.1793035959473;
        Mon, 26 Oct 2026 10:32:39 -0700 (PDT)
Received: from jernej-laptop (77-38-7-31.dynamic.telemach.net. [77.38.7.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm261433605e9.4.2026.10.26.10.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:32:38 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: trini@konsulko.com,
	ilias.apalodimas@linaro.org,
	u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] sunxi: dram: only probe DRAM inside the addressable range
Date: Mon, 26 Oct 2026 18:32:35 +0100
Message-ID: <20261026173235.95831-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The non-power-of-2 size check probes the memory cell at 3/4 of the
detected size. On SoCs whose DRAM window is smaller than the detected
size, like H6 with 4 GiB chips and a 3 GiB window, that address lies
outside the window and the access hangs the SPL. Such boards cannot be
odd-sized anyway, since the usable size is capped to the window later,
so only run the check when the probed address is addressable.

Fixes: c47b63673736 ("sunxi: dram: detect non-power-of-2 sized DRAM chips")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_dw_helpers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunxi/dram_dw_helpers.c
index d2af2d57fded..ae13dd154536 100644
--- a/arch/arm/mach-sunxi/dram_dw_helpers.c
+++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
@@ -155,7 +155,8 @@ unsigned long mctl_calc_size(const struct dram_config *config)
 	 * or 3GB. They are detected as the larger power-of-2 (2GB and 4GB),
 	 * so test the last quarter for being able to store values.
 	 */
-	if (!mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
+	if (size / 4 * 3 < CONFIG_SUNXI_DRAM_MAX_SIZE &&
+	    !mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
 		if (mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3 - 64)) {
 			size = (size / 4) * 3;
 			debug("capping memory at %ld MB\n", size >> 20);
-- 
2.56.0

