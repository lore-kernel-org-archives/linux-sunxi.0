Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142352;
	b=Y5k4thNdUUN8Se2zEkLSbpjNg0l0MLM1JNu8PkJ5yUkSOi/SfSuxKncuILanw3C6RwK3
	 bMJ46DXsSui+4ifv2TTqzmYfnpLFfBbJP1WMYyTUsqSjI+Oy/tee53lUyUr+vnJEeSGMG
	 D11zoXgqvhSh1eoUR22jalgfzgG/qkKG0EJfkQ2yCrkWVX37x08k/HWgGJVnSNmttPDDK
	 zJuChfmZoeqP2BEZ7mpFe76/qybE3GWqoIslpZvDscUw6ZxeEpQXio8/ieps/+UEUjrCR
	 8sFSA7HiqXMoMp2eDumyKsHn22c9zmo3yArmEbutmOjeTQb7U6Nh3vWv9Q6yEbvQsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=srJNxnUQ0sej+kYFu0/t0zXjS4rcR75VICAtBk1hL7pb1JA9NBIz7xPSMpfC55+m05oB
	 T4wP5qUQm+HUcbAiEAHIuY7hkI+lUzGglW3jcJkVcXx5z5kmyiYLcs2aFmYuOjbr3VneK
	 dTqXrY8CCpoIQdeteRNLMJdanVZLioNZSr23UAzs3S2mHRPZUzADs0gyq0S+lHQtjZVBD
	 +5GzX0zBRqnobtXQaiOSk1KU5TDPQ6LXECStN5K3mNMHAN5jX47W3CTpQvM6LJQFlUyAW
	 oecD+dserjzBYxuklqKAwRO9NMC3NP+9HJWQKV8g8AtydSem2nFz7M52Uv0kLpvENvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=psMWW+0F;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EAC60A2604
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 23:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91EAC60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=psMWW+0F
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84d5e56f876so282949a34.3
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142351; x=1793747151; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=psMWW+0FhXriC6GGCo3oKV5gQtXCdCRIOPM+RkDRzezt3XJgpnUuEFflFM6mx4ZmO/
         D6KQQYs5LtKhSkplHrSnRjG0Irz1yDkIjwzuyXGkOijNP7btR22kA2blZy3f29DS5+vX
         goW2KwKmEzhl6ckZn/nyYwhpn+fAXpMYymGRxoZ8eSl00tGA3xuBraKZ62P9W4qWQJM9
         J1oa9rGYTbfsTrk++IUt+1wa+ZhCf4wdSOxGgVdk+rOHFKgvlTCmrcMJ1GpnMztX3koM
         4C7sYoLI9ACIGBZ2wEr+ji2Vrjv4XPy7pPDx+cnULvyaWFp59EDAF/f74WyZ90CpO3Tg
         AiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142351; x=1793747151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=2BTv29Kltnxns+tKNaa1WRGCQFGLtloTj4/pk7JV4T9us3YMEoeiqI/U/RMrBJA1hK
         i2Wq3ZkH/5hphw43n/kMdgCvq9FqvvkYMPd56UMmpkCw3p7xk0COjCZq4/9eT0Dc87RW
         lfWDtvSMfZBaIXVV/p8PVjZSBEn5r5qrjjJGjY24ToJ4mdQy7EMZnsCW8zFhKR6zGAd8
         BQynZcG4QCufsR04pJI1q0nBVG85HAFt+YKol2AQOp1m1e0WdQWzQkZGfnUrgQJwTVrw
         O78Pb6s34aBo163mrfvY7xXGJBqpMVpkOl8sSYeEM93Cm9TQEIOHTPopOoX2LPlZe1Bw
         LLxA==
X-Forwarded-Encrypted: i=1; AKwUvBwWqsZlbMKVsCxPiywv5rIR6t/tdo/ty4pxH4PZXeatWq81Uv0D3UJvEEM5SonSme77t9XPjFX4Santsg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKSfgZBs/zVrgoEdVue7OJxUn2zjtKG1Om7aOJBunSbQwSGkbG9
	rJieZp+/CuLJ0XZTM0cpbA/gCCAePOX2dxL9+SpUZKLShKuIJ1IT5mKdFUei1+O5
X-Gm-Gg: AYBFou3kvsbD5hRGoEmAl7HbhX+qQ6DUNY/7eKYoO/ISB5QMBXYr4NBDmaKH18PKbOp
	jsmzKpH9LP8JMpHtAu5Y8UtmcaiW79eS9QVsN9m0yYR2/gSTC+P3tc+g00O6r1Re7+wPPYyzoK8
	BTCc7OENwJNLY79I9MMt6AOdOFrr55v8dtUMEMYDCwU6puDcqbnKL+zJMBepL+moQPJDKgbB+kB
	R0JcrRXxLwBmTxvvUJ1Uf7MirxvWH7UcHgxcmvYgLJ19uwSA6FICJU3MuMUep3yNG9vLKEvHTyN
	2Nytnfn5lMmbqX3E+zT8Dt8PX3YO2I7tM37pP81ZGtzPLJJ1KDhW8oPzghs8QNwgowyUHguiqaH
	RUYAMx7ElH1ME3fd5g/8seY/hVHLXPVRw0/7+1ebkp/mq2/Y7RBNIFcLWH/dW+oDna9N6uJ/XOc
	a1O4m/EQTxs6IuLb5fwLeFrW0q3iRXMw+y8rp3kt16VKOfcxejMNsAF7hhOYQCaueJm/xjBmEar
	EmmxTpTFvAWqnVeoHtb5nmIZs0rhQAp1Y8Dsq4XMp596Q+YqDVHoRtgPf8YUrYuD7oyhmZIkg5t
	0hmd+csVJJjdJCdsAPEXiNyFvzBUzJPw7sBjtirETyphL3rgmsT/G5leH3ujbzmqf52UR0/b2Ef
	Vw2CybPEBIRPgM5Z8n16P2xKnXcX0zV4we6te+fayTYZ1pOdFMAQhWCXje1WITUaWzdtnakTzWt
	s7cw==
X-Received: by 2002:a05:6830:2406:b0:805:8b7d:d8d7 with SMTP id 46e09a7af769-85abf964f20mr834577a34.7.1793142351612;
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:33 -0600
Subject: [PATCH v4 5/5] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-5-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

Identify the H616 UART integration on each of the six controllers. The
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

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

