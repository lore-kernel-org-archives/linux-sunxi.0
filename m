Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78244331A6E
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791722880; cv=none; b=lVDNgapfhdllTW6xFBKQey6Ot+HTT6S0sVTlbUqLRNewoFF9fOLGzmRtxripyhCstFtuif0gXkCmN0KU5YBKaY67LmrLL0apZ3QpoUB/Fd0tQ0bCwS0YgLGTmqGTA4gblCa4pr2aEQMlkMuaZ5U7zl2GhbaldjO6LWTBPMhSqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791722880; c=relaxed/simple;
	bh=65FsIsY2eglM8xMKgNTFAfDsHtD95MspamnEelN3fM4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=StiXxncxJagkm7LbyxEpCwgWiKxHj9v+vDy/4qY4S7RJDmSoU4MiObCuZayiyEtpQrH7WB76u+Ja890VleVjulQikvgHrRGEsfR9EeZdXTl+Yqec8eE4A3d2IkkBaBaf7ph4T2BOqpl9trYkTBPzJSJNCdXPwT9uRWPlb6ds0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVZ/PCOT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVZ/PCOT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so621781a91.0
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791722878; x=1792327678; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=HVZ/PCOTrK8VGOVTU/6G6qw8frfJNKIDgT9j8JF/NX7AlIS9cBGDoOKnukoI//Bv+U
         89+/+LqLf+Ihn9WIwaI71shF3sKYSce8H53jGD/zf6XL4UCOptD3mzErI1IN0WYhbzDa
         zik4S+8atAt5TNQQqm6VGNyI/L9GOSmnKEz9clYsOj+jQQEiOLRp3ePhGwGT2RBggnlA
         2nblMUJnqWdHvC3MIWP+cYb+hSzI6dy8xNwvSAhlF59BS1g/ApNVUFHyIRwnCKMvcMqs
         H4MuqCRQpChjIPmKS6caGfVABHpT4vge3JMNT/XuTCTX+bUHjY97/h6HjGMhHMouE7eJ
         rpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791722878; x=1792327678;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=kF8Tl1HZ+hbl+IXeFiP73qHthT8DQ3z7rktFUECuLrpkh4i5LVQ+7NyYX22fSdPHSU
         MQwXA4pJuqD9C9I5bcSUX5WJ3hNPzIvdWbgAN98Kzx9Owtya5Koj1t9m8mqAGYEbTgQg
         SZp875yMIbBdJ/H7zdkkUXuxqo93UpywIGEVD5NFJtysQRm/O/KijhH3nCM8PhVwVcRs
         VwbSchdI0EjMN+nSB8ZIwYx02WGMohT8xgfLRMeKuTAzZWYYD6IsezrCVhsS+P2yhbY/
         t5AM5lF0xlpZqvdr4xNzga12R1OdeQKli+LBwkASVO6mMWdOx0FmZTlylDmR2CtRctNJ
         ZZcw==
X-Forwarded-Encrypted: i=1; AKwUvBxGF/2eoZ5M+Rv+FrCH9lUxY2la7sHgzzB9CCFx9unPjulsuf9A9OGuN4p60ipacp0BnUo7MJmORG0dLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJq+ceolcTavSbHyy4fv8pVsL+nkC9WJz11w+ny5m0ded25L91F
	F3MPro76MpkMxEc8s6cb2yDReh74TYz+/fi7xuVgq2v2Qm92s+zTlo3O
X-Gm-Gg: AYBFou1/uBQ8L+vJhE7Tc2vqqfdKRNgmOzVwvgOw/7BudITmiVgEdwBzQXBPBheo4RP
	FMSjy4jOyf/1IBxafM7zyX/AuiJCPiYChYBqHCBZ0V1ui8r7GQ7ZOGaEP2iEp1QiYpQxJgWYqRE
	BZS1OIbSCjKGgItVaCQktJv3oVakDYPlt44iZd7Lk0y4cGKH4JNb00spk0iKpfa+qsAula4vtDD
	KO1AUWjuW0vTV8v+bwDTTBMgMND7c32UKVpyWV5dCJ8n/gmDgzwd3CYHYYrmwPu/WRx7EZQr5kG
	9JpOOXVFjzFntai8k6whISnLesXRnrrz5h0bHcSC838kxOvASXbmPTyvP7Hy3C+NBeuu8pkAusp
	pMXWUyFu+e9VM4q/0KiQtrUqvYD1qKbNwJRlfU+2MvD6mVpTg++zHWzMArxqbFMX+gEVFrxLNHU
	dPAchZ0uyJTKaBMrKfAIIEPyYBbyY0D9R7u/JytLuBezGtwoQIpA3r1PVJvvlUq9aWPQwtnmnRZ
	/1D/LhF//ZtAav4BOgLiN3YoEZczoh2Eriv3TiP5539fmITX8jb90Na6P1nnRk1CMCj4ieVsQ==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr3830705a91.61.1791722877717;
        Sun, 11 Oct 2026 05:47:57 -0700 (PDT)
Received: from [127.0.1.1] ([121.165.170.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm11623603a91.4.2026.10.11.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:47:56 -0700 (PDT)
From: khaliforce <kforce@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 [PATCH] riscv: dts: allwinner: Keep MQ Pro Wi-Fi powered during suspend
Date: Sun, 11 Oct 2026 21:47:02 +0900
Message-ID:
 <179172282222.4040500.483739720170904755.mq-pro-sdio-suspend@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The RTL8723DS driver requests MMC_PM_KEEP_POWER during suspend.
The MQ Pro SDIO host lacks this capability.
The request returns -EINVAL and aborts suspend.

Add keep-power-in-suspend to the board's SDIO controller.

Tested on MangoPi MQ Pro.
RTC-triggered s2idle wake and Wi-Fi reconnection pass.

Signed-off-by: khaliforce <kforce@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
index e2bb6bc16c13..b2c65560d6a8 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -87,6 +87,7 @@ &mmc0 {
 
 &mmc1 {
 	bus-width = <4>;
+	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	non-removable;
 	vmmc-supply = <&reg_vcc_3v3>;
-- 
2.53.0

