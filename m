Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742015;
	b=1WQFVAvftxRoFeT0Tf2R/hs5pBUYmeNepFkFgxd1mUI3U5Z4tanJ86G3bfYluOsqflcV
	 zWj1vpXWa3XRK6wK1CLv5s1YOOUU+L+7GBROnOtTOGkuQ2OdkOXasGmn82FYHAoGVSyBU
	 EdYjjtfZ2aylyiwTbPRcLlw62LnxTYf6uI4TqD5IwhOjU4Ifc7wsWc/mW633IXY+BJ7lD
	 mYbfI4pslocidmnoJ02adk4Y3Bqno20gmamZmudtAc7vzxyV9Ct2UZ32zOg17gp8hMekO
	 puSJR1YEogsyZ+D2W4z3ZlCPNfzb49lnWOZR5jOPSSV/uwkOLSAqL1cvNKNC++JPIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
	b=twPAolFiGupNSd3MRx4QAPW1ecdAPomkZ2jx4zCTtIovfJX9fwZr2atFfqyqP96hd458
	 6FueDo11xT7MVLa3dgp2HB4Yvp7/Y9cFXOeYPAxB52RSDUdXUcREi7rRx4Adfpt2YJIug
	 Il2AH7/LW25dG3Uxg1dQkrPL37cQ0dODPb2aj64xhc0FCe2iBat3ydgqkxumtLz2Eh3MR
	 s9/x1Md19LOKHzP5DkuD7dZLI5dw86IqHkZHQ7m4BogEjecThFzfIiix6Kk63HQ3+ChBQ
	 FsC5VAIBTOcGzcgLb9qokw9BK9rluHRbZP8OiN8E+8sYSnMckHg7pImK1q1gSJBHa3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5pyhaD2;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF53606EE83
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF53606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5pyhaD2
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4ed6d69bdfaso47650b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742013; x=1794346813; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=n5pyhaD2VRQ3AhfxZyXF1sAwEL+FzV0BmTFuAbopV2bH/3NLsWXVPmvHmGyeiaddOB
         1YIJN3deiHuu8lPUPwnD9z7/AZHXV3pS06E0N8rE+XeHRVqvWhqnFIIDzoKpWhyXKXlQ
         AA9bo9NwjOVzSYMCXPAhmE6NgxlJOP2pA8GJmXSW7UX8NmN3LwjcGzb5JJ7wZeas52so
         X0ZUfAKzAQEbGPywdAvpzQAIGWtczmkYF6VzKiCtD0//Qtag7WZwxdf0nrKm/Faxf7kd
         m/4/ffrmfEp5Ef1YGqqbmooGDqVLcNsLF06keNAkJkN55P4FXvCwxvSlBFpGnu+Qftg2
         RTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742013; x=1794346813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=pE7ovH63U/9DG/n0ocFqQc4ukUA/5b4+6RQurzpGyjpv2s8ML/ZBjlR7ce7mrJPR9m
         75XqKNIXnig485u5gbodM02Tuh4+zvG9XmgwtbX/nfWr0gdza9bf64eIAmAt4inYX9GF
         HO4T33LvaNUuow7MVdWZaQoEXYeHMgvyFouYUOFgGPpxchfnGugRFB/22wmzg4IPxS8C
         3CBtpfXwvGDLHkrLRejBrVYSUmwwp3BzRdqT7LvbraTin644m4fS+akHS3rabJ7d2e8S
         0c7KpT+PibJc9VLcmgOwu8ZX5D39GR7DY0HysVj3G3LGaeo5c1lb8Kcf5eXdCeBr43+y
         eAjA==
X-Forwarded-Encrypted: i=1; AKwUvBwV6VIrxN9w4QWcOgNR0dt7tUHAOWuo4vzIX4UddBfe5HsXx2RGKND/X5ga6bbWY/FS3E64ozcbbEK0mA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+V7oRsSJvJ7nl9DFJ7CzVKdk2Xi496BfXHmp9p6qxtyigIAGT5
	fCJd6pcoe1P/OC3PEM7Tliws4XkpcGMNbujAsoIPO9b4obQP/1hfLwd5
X-Gm-Gg: AYBFou37bQxqY4Z5XHuE9yP0gAXPx3oDvuA/Lmr3mTcWOGDct8kC7JDrA2L+0ib7CzD
	AoU1ERA71DOSepbcWy6s+hq0XAhVQsARmZxFfkRSFnzXIBaw7fldyX+rS76rm9a7E/5E6ecBc8e
	tmxbVq563B0+7I2q1PCjHB78YtOED60ZqlG/bmpJ8g21MEfJrNa1iS1oEhsoWDS2azetQDX9EFk
	LU0kOK0NHb/tQPQlPWQSFG4ZQoutLPxzdo1LXSyCa9RAbBATASXHjQVPm1EiUJsFUoDq/RpvY7y
	VgakScdTmbwwNmBe3tB7DFEVDNGPaLcP70+7M4KVkhjw3nBWGc4TqU8Yj8aC+2M6gl0AI4YUbT4
	BRTeNKVLDtvxdzkhYZRcK0F6gUkJsFc5ngaXAl4GMQzVGg1g19LBZl5DwiEcarujYvztmuQaEfo
	Acom3pUT3fmpG3cEED2EyOOOTzlRbWqFJdz4I7J3t2T7BCoS8+RKT5VbNV4o7+mku9N++23/fZ3
	YLa0XYvcHuvIq8lr7Mau1MYL6xXw+96MWiiRSjsfNoyw375Z7xLgtYZ7M/TNCm4AbZKq16/W2gn
	qdYMPVyKKasuzzJ3XURXDEdnvGdpxrVke8fodNh1A9v2JyJtROobgxCFDCynW6SAyRYm+Cl9ol7
	8LKqQNbwQnOOreC5WbodRlk0UppNp++R+uMSpo3s6fCAvTjBhDq7ZOixkGOApnR6UHK7DjT/bTC
	CLG3ncC6NNd5EsczS/JFTKS29nyDIgv3k8iH3/J4sQjGDujRHom63q
X-Received: by 2002:a05:6808:6f87:b0:55c:859:adc with SMTP id 5614622812f47-5640def4593mr9802652b6e.55.1793742013486;
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:01 -0700
Subject: [PATCH v7 08/12] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-8-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the H616 UART integration on each of the six controllers. The
specific compatible selects its fixed FIFO depth and integration-specific
register setup. The driver uses that depth to derive the shared DesignWare
receive thresholds.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

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

