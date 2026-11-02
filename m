Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649331;
	b=0UyVztCSe7Uy4zjwG7SBNVE68TXT3ilRPZOngc88TKUZQtnGU6vqJ/T4fKCez/MUDgkO
	 H753RbLMSrA7oM39oqgA/fFShGZ+5bBtq8dUtjyury6Q9Fdn/TLMsCb0lTbNf31Mr7HuC
	 PcZahF+xsQoXSuDW7uZicN7YHgYO/9dIFdl5AwmevkPxlP4cjn9sm9S4JUEEego/7N5bs
	 VWQv3hXRJ0cLamsLsZi+GYL32GDAWLlxFQlezVzW9yW5a9mMmXOmyH3UCZH7rWG7EDWkV
	 n4aVafqC0qwnk7uCRkdMamM5mgfaj2HJJthaE9UtIkYIqmL3xV603sAoqo932Pwh5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=D+lJ1vGEGJSjVavLpZwWKmVSJKcqzzq6CaXGxa7HbY6g1IHtwOe6XnHlRYJgpYUkvrAh
	 JeWvEfqnNYqPqW1/mXWBI8fAEFZr1Qo51lyYXezDvh9JYZRy8ap+bY6kLRU/LwJhsFRgo
	 351AeeSR+oU4Flc/pXxK73T59yeWwdSPhPS67/D+wlE+9HMUUhrM0sH4NwnNgirjfwiCu
	 P+japVthvq1YuyFh0AlkB93u1xjHXmFKB7hyFS5ssBOXM/1xU1skqXYxcvsIwOKe0ZMnp
	 UzK5npto36jp+nlAI1eZM2T9TBmDdv6EULIYJykQwYsLwWZDQPkQ5/ZTeeeDmhKiBug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Af5a/vAH";
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EBF6082BD3
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EBF6082BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Af5a/vAH
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so3294311fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649330; x=1794254130; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=Af5a/vAHQyxVbtMS7M4YFT3ap66GLXiNs8tZhzksVYLSETDD0AzYtyw0w2InSDyQSF
         /KSglRnflvs5Q8uq4dFZ9k2hVRDqs2GMjaWDANjePaff36Dr4Tr8XunzUolVTW/k7RiT
         fqN8yKuWIiv4YbAML4E8mNy2NWafWj7cZQkidlE2+OhRXdGtyZvoxwtRL0UsJB3SRAmz
         fQArR50FMyuYEI7/WrjOBxvAWX4PzdOMtP3Zm8uCWoOlxHV8R8rHpeXDbdYBefp7LKqz
         SL1iKLxhD2tztZggReHSC/by7bVaHDzJlqLMPNwxMEZkeS6ZuoS3Q0d3O9xvjGSZ9nC7
         M5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649330; x=1794254130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=ksH9oCa5M3JQpUnQ9anQaug89+fsGXWEBCF6gtaUxKeIRSPVTUSa0Zf8l2yI5zyZZ+
         Wky/f7jEOTRyfsnDIB35haiXetje7SIiOsTN1D10ZI1vpgLaBButhf+PULN6pJYlu5Ob
         dV12TcNmhQlAnlmJlNXJzRTdMhhVnsSZtduI/NoVqgl2ZkfBaP3Gl7Sax1SYKLqQtmoc
         DjzXB4vuuE5DDGqq4NifjAOIhCQ1e+NBtnWGszHYC+46obZF1WiTdSHS+UWJEhUkYEgO
         jXRDM8TzOyFEIUd3jPXp6MxOXeEso24rddRnfiCofnm90+9b8L/B4WUMKlNqoSB86hj6
         5NlA==
X-Forwarded-Encrypted: i=1; AKwUvBxy7T+vVMuFcH2c4bFp6zpPbYiG06QJVt34Jj4esRtvgWp+KSFNrULtPkl0bHqdXxIpze+/xk17XERAlA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8JNWYYvB3bPZXaOQ/ngbTwHrRqTBsZJ8F/SAM9B1S/6gB8umE5
	sic8k4xlSXb2RK9o84LMPw7TKam6Kta8OT76Z2DsJ/UwDFul74uZDjVT
X-Gm-Gg: AYBFou2s1m0tPG5v/NqdbaAT5bMVEAMCS4Sj39NnrE9C4sqSFp7srU8avAnn/mNuRWh
	AaodetJqIy2kD50CEe1Uv4d5SmzQj6cOfJyBdjpwuIUuaaL6j5AIMyfcCWDU4wfgCpeXfID198r
	fuIpoQGrGG2zi/EAD0/3oQU9WY5bIK3LAuKMF3Cxm+HvXoa74OArnM1CPrxkshH5FUoZpJ7Mcjv
	QCTuThcc1f8Lyae/FpvtabY8+nvzFKSNjyAc3ogVXI78A2+GIGJUPnAyXnxCCmQojKnTs28YR28
	KV52d79gvujuZ+2Lr35IihfZFu0blq8z+YFNf0hMN0hQJgcOdWYsGwUgVMZSBnWxjciEK/jgLwQ
	x0/KHZn+n79hYiEmjd0MFQpzNvujUJm6BzLZG0uOUzOoAYgfTgumuKJaSfdKGCo1h0qCq1F134W
	iXVuWHatSZEeIIVe5XYXYrp/EpJK1KFwpqpvKEF0ShrParMGPG+df4KAK0Pzgo7WeRmgNjeekfM
	E2FcBhsIRrk0KrxUdv7iEbgHszDgJ9mERUPAbwJL7oHSS2w7xVPZa32M7le+AswZ/uxAOw3oqO3
	RyTexA306R1Y4YqEZG/owE9LKqCtlGM8cb2GTD07YVzOW0xFvKbONmFZAk/XpiW4R+8Y3A5xntt
	5zuSovGD7gKRS8SF3OgiyRxoT3OXPI7YbH8H7gN7+Cku4jNj89JF9i5mA3IB08iIFcnjCKekaxS
	U7coLBzRuiTMKpcLkHQuAmUn3ODybj8SrD43qHVP5YYrFd2clRv3NRWApJZ5B+D1QtxhKGxWlJ
X-Received: by 2002:a05:6870:3d86:b0:4a7:4cd1:6f37 with SMTP id 586e51a60fabf-4a90764ba69mr6695598fac.19.1793649330169;
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:20 -0700
Subject: [PATCH v6 5/8] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-5-25afcb346b0c@gmail.com>
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

