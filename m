Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299662;
	b=A4TQ4sBZdeJmf1SzI2aF03XJUfFhJlb+wpnbfLoPq9Mni2/c3Vmr5HkJ2QCDrAUwEPv/
	 vGqbHYk9IxcST54wYGEFWC9ElQhbcBlWmyNrBMc1xcD8/hFdfXD6WG1/ZBTXybfyOoRbM
	 IzCNCice1mOe0t8kdd6zPds32RWmROlK2HczyGTu50ASatbMzYHXspU9s99Qw+hW86U3Q
	 md+etQ22xsx9ZpW9AoJMoA33/vuxoQXKJCPkKSzGbraqIYFaX9oJsQohm7HaCzoLDiOyg
	 RNnSVEvTHQihtVc2E78BzzgpKr+St4Y5F4yulGkX/b/4Fp7qxJa3rbp5MSWdWkUHuuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
	b=5taLIuQwPTD29gl2gh7/322uKTNQ8LnmbNQ3f0bi6YXAVAhdNZuH+dy08BldmNw4ARIo
	 LyjwnIYo+JS6EycfNjq2f6ZrFk3Ne6AfUk0AgpsVGWpOfu1PZJF4hjSazoH59Mwe/XWlb
	 YaLT1HPXqUWo2siapPuHx4uvMlarPf9t7h3DcyTWGtjXFYW6TAkGxI7OgSoOaqyGBiqyf
	 D8fvIvS4OvDEi5om7z0crggabDdQHrmzxEsn5Q9qOAZeovrJkTeqc48rEyXeXu5TtiZj5
	 3dhC83msMp00IOlJRLCiKtbvCQQ8Ak+qHNDjPaNfhw9CIRBta0AUdviUuUEKnSgIPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIDoiTRe;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A560A3823
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506A560A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIDoiTRe
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-823b938464fso1709754a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299661; x=1793904461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=lIDoiTReFJ15zo0z1rdsmtwWYpgFPNXBKicpbJ9A2Xm5ZeK4Totvm4MFPaaEronfuH
         1zVvlrk/EfbMiaVCdHoO5AH+TcuprFEICESj3JM2fc3ggLJEBGCmBz7cB/weOMknriu9
         jK35THiIf9MgI0zG7Wf+Q4woZgd9a4yjouDHCRyW1rq8SvbP1tZ0VRWRHj1mWo0z4pOR
         g+LGON4ILDQoezcZaDIZWosCOEMLYS4MQqhtLanJ9/xWlBez5Naqis0+AUIHUh80J4Du
         MwZz3Uqmn7H/bsHrCIIau+CzW1Da9RZLkFJdh0FHag1Pq6gDqpFwcbeV4MQXk2IRnhPu
         faDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299661; x=1793904461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=KmulKpvb/ap7l7JAagMRH5ARwzuVjwgyB8IBRVWuV/oE+7/j4rumZg4662els80h3w
         RvTxfxWxrtzjFISMY1L9B7RkedDNssLOl6hXSAnJ8TtFkY4HVkt7aGrO+bYLZQ+khKkB
         vDKf5/ZLFjnT5l88qygFfLHt0ZTZCRTWCruJd5Gx9Lfl93m38LGYzn42yzNNU2+saLhu
         z/p/LO3zozwW8QKwZu+E5GVelCMumHd+MaN8hr2TVVWnRh8OAIW4KB0hZJ5fuayJeUET
         WNvYzS2aUevVZ49onAzrG+hhaUatY1qR8b2mZPDq19yXiqKlkJ3ggOVXUxAkh4zOaf2r
         P78g==
X-Forwarded-Encrypted: i=1; AKwUvBz03HMVYqZCRGSe5/7Xr+BY3KuXj/f2zy84zVB8M89+i2iPtJItHtMq303yBci7ijf+HCbOr3DPyvkOAw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJq7guXZqZ2DE3jXP+cyqGQMlu+rXuQUqFbt6bg9Wt0t2v+IisU
	3o/tE35q18R83Gn7eCecxIn7WDT7RQUyH07asHNrLnHpEJC8X38nHQ30
X-Gm-Gg: AYBFou2WFl/eqVlnlFpsI/cvQjzN2TIiy5eIS5NJlFkP9YEu6OgbYa9sJpwZEbTgqHL
	Sy/KnY0GBeiIj6dx1gqXRe0hT87NIVpRVzNpA1NNEklNuvGbhCSKSqOkXl4cG2Tg+3l0phA+8Ww
	ipVKAZOGzx2987ss1M2iC0ZWRNzHt0/QLUWM2qcI0dAtUPGX2aJEIVpw4u5hYb/+sga1VvEZwO3
	bpR762ssZKfCsgDGkwcdwdc3W++Ky02Qgmnb7Zp+AQdhmjvkD7oGalxdoEqNaOQBme28YnlSV6j
	nkFSnyQekb0lCrSIeNbOIDa5zPNtmTmYurWyxk/gCqw7PbbPsvARJfHnUi51UiqPF3kprBInNvM
	Jw4ftihxvgsjjShim2shkrBhjK617rl0mY142PL9fSLGAlBl4m43UvmlucMhekbfGQ0omi2xJw2
	pEqv3FjdD/7UbZVJSyykY08a5SMmh6dUZoiGdTTDEWMtNnh3wyuGGugv5TxPr2jEHJIRf6Ii3a1
	6YI60jGttZsNcc6rMyuFH/VlmktYqan5t1REJtSCqEVCG1VnpE1DKBiJ4nDB1C7KhOtXiecjyzY
	+VL2rfaOk3/Cqn6aquZ7k57fqgg39OuMnVoVI69v8BTX2hC+zxaw7QunpELA+7XPTGGXQlZXmUa
	mB+F3Yg0m7yXoYi9d6lx7YT0pzIWmkvKkEX40Us/eoB5pVslK0XeMm2U6C/86bax75bRz3noNGA
	R0o6vgGF3wmHgHILS6/0AkJ7vTyvoYLVrjV15ueTzUr437wGQCxug=
X-Received: by 2002:a05:6830:438b:b0:822:a76e:95c9 with SMTP id 46e09a7af769-85d364642f9mr40665a34.14.1793299661366;
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:29 -0600
Subject: [PATCH v5 8/8] arm64: dts: allwinner: a523: describe the UART
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-8-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC and the
Allwinner receive-trigger mapping. Each controller supplies its own depth,
so the same compatible covers the different FIFO capacities.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

