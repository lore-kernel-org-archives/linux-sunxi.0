Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790376;
	b=1NBT+WyvZ+pd+DWmc9Q+OuNQNCjrH7Lmw/RQ/87QzAkm2odClWw4/Pt/kpfselodXxl/
	 c18tlMNI/cMbIDz0u+3C3EFSJZv3yA4l8+FdQdLoWbxxRy8zK/7DdgwO+4ug/qOB4MQjq
	 DyDYI8DtzF5fICye+w5a6VkbFdC+8qM1n2ZoeYYV7y6YLFh6qoinXCxoBmOTHpvaXRCdM
	 GVCvQg3dwX9ES4GwZsgyvt8S+S2wwn0TV6RkS5+mXXQisHbennh1x/8y88oAnequdoaWE
	 Kqw1kfm4PC5fJYt/m03FIkczLzq++IXG0Mibs8VcZNumdQ1rN/yw+6gSfSs3mJV3umA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
	b=sVt68Kaxyx12GWNWTKJGx28sqrjIqtSFJuj8jYsvPdSpMNaCc2hhM5Mp+vYBm3pWl+to
	 7GjKg4FwX47k7vpvQaAAhnMu54Gpb6FCxDlnFMVvFjBCGhsh+fmoia0JNk6UNtfS9CZCM
	 co4QFWHyDutpWj7ldphTCQCs4//4QBPFmwA5fadzl/VMjSUoWp5X5u8ClXUSkgf/y5NaG
	 1TnEFHgnlayMFDpQC8o8QU892lthvCesTmIupBsQJ7sGAldBB7lMfTIS3X6oTC5Ij7SNy
	 qUnRDYMIP4XJV84+6dxNPS5PNldcbo8MxIwqN/RdyN9Z/7iBWSQzUFuf3U2kcAANg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezG4f8D8;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A071606A33D
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 21:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A071606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezG4f8D8
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-845788309b4so646653a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790375; x=1793395175; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=ezG4f8D8uPbDK0dWpved0RiUmnYTgpPWGjq3BOBDRqNwop0Ue6o7Pr9ajG2SxiLg8N
         seq1IUD5Bj+1PsqnF3ez4SmqyImeCCmYkYCoXs+11xYNwr4/PueUpeWHqNyocO+BnMT+
         2XPA8KoBdgw1RfPy/yYYIF05y+YDQAO+TnCeVilwOcdvLoF0c4n6FY96lk/pDxpyFJMv
         /Uwa/Ew/tcMDse1aMRUSj9ujP5LiNjRkNihr6zf2SaNogP4BtgKWq4gqHVfPh+9MvNur
         FdG7Z9sqpSeVwPrwzf5EJ/XhAcVUuOGZ05aLGbynSLg5/Er1TGjhPvubdaMLupPWBbno
         cnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790375; x=1793395175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=SvfxoryFDd4lu0xn5xRD4HFv8QmkGDnwqVagXF8aV88Kb4TL8e5YKu1YWq4WobAFkA
         fDm53J1wokvywth7WEyeZr/ObhijCPV2+rXSxkc3cPzd40BYVjIDI8A8Ut3Cwk1uRJrV
         IGlD0ArXhhgIMFNSGlu9iigN30F0+w+g0St6MNou++hOCw758Sn9rGitFAILhvLrG5tJ
         H2YH+u7GgK23Bf0WAyLv6bEFaa6goM2REw7NAojkp1yh0ckztkfxLeAprekVYgfShJ4l
         lKOxcqaGefCJ+WuSS8GjXuzWuvfotIh0tgx7pZNvyQiXIFBjcnZFjP55MWGKw7ZAjw3+
         /oew==
X-Forwarded-Encrypted: i=1; AKwUvByK9EvAve/hoFBMoBh7skwkJVbgftTpEC6P4DqEBJNo4DsU27eBEfe7GIdGzGuFYKD3gNRkQplYdLu6ag==@lists.linux.dev
X-Gm-Message-State: AFq9FYK6Ajvk6gR5jTRizqe5JNpxjRJCtLjrVSXgBXjDk5yZptdxnCn9
	l3cUG1RT5KBuUyHBVhZFrTmlcgCKRrOXLYZoqD/ZoGoAyOaucARHCxXL
X-Gm-Gg: AYBFou3WbALKchbvF8G7oZzBi+f/HWPoXMLW7A07Z4Rt6Qg7/kjCjZ8x67HG4oBEcV1
	2atDSC8IKu+z82pqrbCKBvyBfDockb82nlfVJzTxOr3m2/Ao8CXRlw4FUJnaQ/RfbL5hixQeLSP
	Hs9SFTm63UP9IrfsJA6EE+wvDiSsT2/P/d61j5c0uoqi9vj/dYrFUgGGtHu4zakuxP3rqwMm9rG
	Wh8dCWJyYm+ahAMClSnlo6eOxHVIK2Bh3bMZvc3oiNwgQxFySi3mUwiZK9gA0OY9LfWrgiSrfif
	gOkt6HCKM+96gsKpVTUKorqxK36nzj8aNI2rnZjxBxSlyb/r+gcpJpCoHkGcywHLlX6TQJRiRiW
	7FC6jdxoKov+DMo49sBw/6ySEznTpl1M42CwCAWjbYLKnSJIY/vFV+a22tJRFvDVBuWD8LU0MzH
	BO2eNE9SwRImXWrWbBNfC5JW9NiC10qi6UVhHIRM0JyqBSkhabaOv3PemCmHls0R19Qb925BmcT
	m9u5u1tDN/8CZufhY2fnf3iu5M86yyFfcWTuX2CG6aUQPG82o4vh8CQ6bCX0SPufkStSa1W6pMS
	sjGeYOP2L5jm43WDT43WFRWC0v7jmXsmOFUXYLq2oFur05CtVDUvz1HRic7BJMhMVJ8fB4o3HU8
	VTHPext+c6qzJbHtKqA2H5fy+wjqPbYA92plMPU3RkmE7ILxwlyjNifTy4pFDvRggPqDyRb4kDa
	ncjA==
X-Received: by 2002:a05:6830:906:b0:7fa:5c49:523e with SMTP id 46e09a7af769-850fecc32fcmr525089a34.23.1792790375055;
        Fri, 23 Oct 2026 14:19:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:29 -0600
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h616: identify the UART
 integration
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-3-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Use the H616 UART compatible for all six controllers so the driver can
select their fixed 256-byte FIFO configuration and register layout.
Retain the generic DesignWare compatible as a fallback for older kernels.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

