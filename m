Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936709;
	b=pj05bawvLD7jgPd+XobrJWeQzbYJLYVLj26zyZC067l3ivsmRxuCJLgdnYuCgRgWbfim
	 ELp/3vyw0VllCdoUeeNLOYFaJ7uoaPqQBf8ilNzS4stpaSDoIQ4YMtyCe8xl0X46Rz2qZ
	 f+nlwAi1aTYE37NIuRA+myweoM9m7dGCuevupmPMYctJNFFEMnul1zd2LaeolNPubo+7b
	 VYURQr3jts49EZsEfA/tVNlG5AgmUDGqfBtpXHE5kqee4IgPxaVIzRq+tsHsa0aLUqzTf
	 J5ZaHBCEWUvhFP3tpGVzegc+rWdCEgOjLAUIDzEZ8KPqMbR5d86Nzn5L6/KrFYKaC4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
	b=qhzEhy8cgcZ0pb1GmvTZ7hmHrw3DpFQc3YEikARk9lTnv+556xi+PHUPBJGdQsdMsu5a
	 cQfmTiyrlgPEKIOIRPeBtiyjvtZ8qWSU4pN6VX4Bb5J5T/F5tLcNfhO7uyYy1dYdfNUKV
	 LIroyx3AQ1spQXN0NOvj7BnMRN1357ChhGimxcMeysgFJwQrV/kcLaZTwS/m9QcaAVpGN
	 KLe/U45uO4Qr2vJ7BTRjB6UzKeFNtsHFceMLQk84et/yepLO+XhAGzFznq84gMMnBPlBK
	 2jwItP3ufsTRcVIG9l7OPmhnCCyDxejKGvx1aDXQcqvhWKXoYUuBwUyrMPhehN3M3HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZDL0Cdx;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3587606A326
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 13:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3587606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZDL0Cdx
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1322729f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936707; x=1793541507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=jZDL0CdxdjipTJO20BvpHLfGYsQ5lqFAMhCstRy0IV50CaGfE9Uy59RCjZWKSuird9
         SjMRstHxBB+W9CZKK3Ns4/Q3RdwJNhkaOFf/AKyTHhYnGlCAUA9/A+/uaKBLw8ch4cMp
         DpDllyMf3FOn0JwlPJ3N8392lRhjpMNSrgdzWIgqfbcXWrtKfTqYJFOJslkZe4VrysbK
         KLRyOCWVaImobr0gLOLj1OkLPznQf0kUr1giag5+eCPoSdI804K+UFBpldhmNrsgLQti
         0MAlIBOnTNeaS27dlo34QKxU6TJK/4F0nV+niJBitf8WHIHnPIK7b0nZb9BGUNcVNJ0f
         wH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936707; x=1793541507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=x01IduMlq05KL24gn1cz7DxK3SzjhIOpU+6uAf8ZmJwrpDnXY7IlhG537XFiv2EUZO
         G+v4C90SuCcQxWV5olh85pqTUxFuHnGXI4D17AF0mQ+UVwdvabrAlK0xAj93/Xo7WhWz
         XVC8wK7Xx1Bo/U+Vbh1bc6FiuzMVz6Tha7rlZnxOMjVJHid5dk14nOwbaBswFQgSL+f1
         WrCCluRGTsWKrxBZXIYIAuDe+KFzqQabGnwA3nzmwrAwc2sAc9Et2MyuXIEqnp7zK7E6
         O3xNBbnzgZrQ19XeD4YpO+6V1L4ZFLCf1wucrUH/bHBL5igoqXYt2+XFoh+avOl69n+T
         tkAA==
X-Forwarded-Encrypted: i=1; AKwUvByw4gGEgUSWJaxEWKX6PQTiDwxggqHi/Ezjk2BeRAG2kaRaVbX2dRhE/zYUtB9z6+CFFRT94TMs5gytVw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLE8lTH5aw/7fawIVFFO0g3TDVcNh8mZUeg/OqLZFokYbOGazAx
	dtP1XmVq132sXDEWIH1f1FZJbt4ZX7VVsE8ncKrBhvVMDBgRU0QrQBKv
X-Gm-Gg: AYBFou2ZrOafrl+gfjqlZWkx7ulp90DHWy+ObP09qoHOk85iqlXqD6hxCNxcDoMxe26
	1P4PSSD7YaNbtshyCwtTNMEgWYphiDfOO9Rdp3cQAF9QBOgf3L0SXN21rz6AUWk434QtCfOnvnQ
	OR+bhICVN7skTNNLV4Uesl2lR6woQUI8s2F1TYpml99XB5kpF8XcsQdq2gu05RWNz0L4BoOqt3S
	6e82Huu+vVAx+T5aUfz91u1qrQWV1+LSVDFottl/y/C3Mpoh6c7te6RDw2kd/OtdVC1WIzFNZt2
	RCGHoxJP2qM75TfFZRiSPdo6YumdYCbFQeJ8xqP2UGarub9vL1fsbLDZZ5vp9Yo3reh8xpXfpz5
	bd1eS3hwhqamh8DXvA/j5yoWU1N9JLfXDcxKD6YWjUh/R1S+6H5ia4/wXYCR4AOcb9ZQRqZkEcJ
	uAnS3fDOcQxcb0rdJ6cZGPMQXz0mKSnIcynBAnMMzsGZ43/ZrN4/jhDXhG1tI6klA3kMhOwiYJ7
	p/tVurvq0ncIjZ6vLLz+1F5F7iESFtYr8fB1I5K5ScdnvBfsqdCMUZYQOYSYzCPLtrqFGPv0mMj
	+jCc1iuE/nF07w==
X-Received: by 2002:a05:6000:2501:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e3eb247a8mr7109194f8f.8.1792936707263;
        Sun, 25 Oct 2026 06:58:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 13:57:45 +0000
Message-ID: <20261025135745.102970-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0

