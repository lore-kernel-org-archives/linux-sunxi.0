Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649335;
	b=rk0wYAG0eU3XsDRZkOx5e0/bTY0h85MJLIDfVvcZOb4T8Xddb77Nb8ps9PLpetNBXRjn
	 9Y5eoWRdBvga6nw6frgyG7J7JyosV2lE5WPK5/2kVNFpygs2GrwdaHsOIg+V7Jlc6/mNp
	 m5DiB0zbX33ddkIZaU3EXUIh98+IqRJq3k/LyFRE0El9uEyT32StDOQFcQepyZjM8ePJM
	 FcZStaWbwXD35NQACq/FSQ1wNWpo9ntwWXPD8UcODn0+MIJjJZ/aPbZV4AZ41RvHZx6U2
	 IS1R6InLJkwRLa9XyNGTPBkZ54vZsWRr6GQ+o4w45wcwZCY25VAk6jrqRLButncGPdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
	b=kNacItjH9+Mcb6FGQXNRnCr1nD+6AMKWzTaAOZNsNiCHgqKH8BwKCgoPqk6Mdt/MbHaL
	 s1qz3vct2ZBaAP4LmmyPqDGBNQ1ApvmvwfmrX0YUUNyHJxsfhkFx73rDjGn7fYUcCV/8B
	 Mb427crFT8H0EtkAMRpfV4y+a+uPje9byq9qr4/kaPxmUondW9Rf3n+2yLu2a8yKso+7Q
	 fxMHDL+iVT6VEHiTjGWhwv8CHSaevxCoi0mhJoJuu1QMUdtJtHr2AlbNg84xL9R+j8Dik
	 F9ESK4NvF+a5OKgYJU2QeQiKbEWTva51OgEgiCmJD2Gb4+HP0VjTLSf9dTDpJEm/9Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8IfxWl7;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D1606D806
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3D1606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8IfxWl7
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-49429181ce9so2132686fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649334; x=1794254134; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=t8IfxWl7zBRGHba5ZSBWc/ijy84pAULKlQfx3k+uJubjdRU+G60cgoF2s7vyz3W2ze
         kPF+56B8XWfuXAqRYTIfPd8vnt0IiqExaZY3pdAiVyIYUN7rYwgYMDdzYmidOKLNKYu+
         I/rV/s1epY/ivz1qRAu3z1QaN/gws6s6BibdHqEalcidZhVwh6TM3Rq5UqN3NJ/ycsNY
         7+fMDI/DnXVPnRPOaS/u3QBSM1ryJ8pEEifvd13Bb2LjSmCK0KwvbDdj4l5V43H6dgFN
         NWD2racgiORAUsMHtJvPrJMT123lsRKxFLnlt+sbf+CuGzVymrL7VNetO+1+avX7HTCK
         fIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649334; x=1794254134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=Sc8iiyqmYNFS10E9pKCXWJ34G5lapDzM7Z6i8nUyZ/fj5cMEcIW3Ic1IqIm8PlMMa1
         OgaBcrFauG2fD0WbQi3Nyp8VoLjmBjM70aXr0TuW4URGesjPkbpseUA705hqFztb1SjL
         K67jXTm77yWRAfKQThxwWwpgmB4BQV8mxOPrXouVq5s4IU9neIiMeQijX3WUc9MStrir
         MhpaWVXYtk4yOb9iSThPPGj3avv1LZeefY1BT/DGYX5+vp2K6a1An70ZjAhjNyOE7iAr
         j3x/ks4acYmcgisn4BZeOGOUpAogH4a2Lf74zdQZe34biYpIJ6ztobvoHzHoH9Z1IJPj
         Wu+A==
X-Forwarded-Encrypted: i=1; AKwUvBxkgQdB8XI2XNYPUOYoBIhGgUBw7mQ261EwS8HvJW9HmzLk8mDe/zGYlt9YDWD7rMWEmWDgU1LfZvfj0w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8D8ZjU96tFgKgkmwHmbaTdUUWMF+e1armehXr6vTWH3Qm4EzG+
	Ff6WVXSOFagXRC3noSrtyzWMDqr1ErKBFICT4yT3Dfm1UwQBALDoXc4T
X-Gm-Gg: AYBFou2jcf+PziLzXaMEdwfLA6lvniVYnIeNLEiGUdnvRlMV1ZJgZ9kMSUM94wh1u5i
	ID54fb5VxI1EMgTwgUCFnDKj/2fAkOK3ppz1/RrpUGM2i5NV4Qt7xB+94qt8AhCN5vPxOt+95H/
	TTbmmKc8EkfDAY+w6g7c0ZYbPTbAXh7qXeVgn/rgVUZgMIJEBaMulX7/DeO7PZwr7ExTQhxX8zN
	nmOf6VqQzQ+/viW7GH/0tUTto84reExjmdlqWkVswcUSHByEjHSxoJ8oTgyLN1lH0YkxzV7y4zq
	YtC1Gu0v/7cFC2c+S7iN/SzD1FZTWLOZCbG41qEl0Y/U2Z4FsGBnNCCGzj98C+5FmLyafJOyMp4
	w5tdqlVDLXJ0k7iDqWR6u1dB69Xszvt9GxLkft0mXeISdWE2A3mIZQ1/bHJQKTl36v06Hs0THNe
	K2/LhdBB7HHMBqCwsjICDKffZ1gtTjD1gQp17OoPUhhmTsHGKs2kAoQ0WumjFjO1gFdesj1SqMa
	yqyiW+nNfeyPpjN0EfmKgC0cGUDFeMqeVBI/N/dLfxoKRgmyS3fVR9uB1+B2uIN3vhOHx+6KIDo
	eUiZeGwlBjebDQBoDdvttF+IjIrKrxNfOdZi5yrGtosSJEtLCUCuTARSwFxmpM8a3OrqhgzflDE
	DYu6iCSepDojWdr740UUCFruft+8ILQ/W5z2HflfIJ65t+kkijEHor0nd7aZLNIlQZ0XURsxEhX
	W4oPh6DZn1z+pD83HOjGfMNWlVZ+7bs8jra8WjFd455M/Zn4NE2HIbKOpyFYQapqjh3jUly354
X-Received: by 2002:a05:6871:6687:b0:439:a524:a29d with SMTP id 586e51a60fabf-4a9072ccffamr6663890fac.1.1793649333719;
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:23 -0700
Subject: [PATCH v6 8/8] arm64: dts: allwinner: a523: describe the UART
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-8-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

