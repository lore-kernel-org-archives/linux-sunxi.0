Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5B7433A6
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717608057; cv=none; b=la220REEWjM8g4xJiUOslzH5A3hPhNs4zrcWWdLczBOVs5nbxYFw3F+2IOOoJo2q+AbgMSIYtV9kD3NGBDnM4GIvARLWzSn0hGKXc12sc5SZK/VH6CITI/LNhsh6V0uREaONpzbHYGcGAp3qS4kHtLKS81VSYIzi75qtdTswoMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717608057; c=relaxed/simple;
	bh=cBU3yekOXtlhNWdWpyG2xf0kFZVmOK5W2mTTLEsUAFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VxVvclttY1CUBZpmdZj8PCuJv4rn6aPpBnvc0yWVs+egBRGJYhaBFEG0RkEKz5FLdC8u8gNVv2lhemthMJmgFGjzMH+VkqP2+JnvvVL4FmNRRk75e8ITpGR8z2vmY1FPjyI24/A8E7G2cD+A9vTQjKVwgCxPPv1Qy0vzXxHA9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkEXwVGS; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkEXwVGS"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5ba33b08550so2321196eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717608055; x=1718212855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iycGYFzd3F+df0p/qsCILVl1cIBvCeHnsWMgOkKCQP4=;
        b=nkEXwVGSktYOomjGBPMGlj/NXHzKz22q9/8GUwym6y8a/WwKHFO7MLFeCJxNnkytAT
         I3y7j27khO2MjpU2oqTfOwLUP44uawoOxM6Hz5yZOKFf85z8AZe/WLFBzRwIllk5hdc4
         qQW8u78PfUK8bsaK2yh7GxXY/NuYudzfkpu2p6jpQ5FsN58amXe7AuY+jcvyqDcVylwN
         +Z0Y2MPEaqTyepgqM6pk4V0XjKZ8VgbDGRB97fRO1k049c7JyI02ONBlTpl4dnOKzRX0
         FbXvg+/ZW20ZCt9d3elj7F9uUx1Fs1DZ2K6h8YcurLDGotAFXsZeeCi4mTKQz7tUJmSL
         BGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717608055; x=1718212855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iycGYFzd3F+df0p/qsCILVl1cIBvCeHnsWMgOkKCQP4=;
        b=qnYY1Tzgwoi+OKHHRdXCukV2mSSrxDEvo5cdQsA5JVfFYLzayCyTuGk13Cu/HSO5tu
         KrCMiNvqj/J/Wj7UsfcUHu8R+zvYbXLdWtdM54Z7QmeEVNyBQM0w8qwpB+H+gJaqkUuR
         wp2sCVgr2gS6u4SBbqUx3D9AV3bLBGbP30Iktxf6IsYwWS/3o8qg0Uq2UvA/VoL02HC1
         qokH/ohJNVy6RD8kw6h+IcSCy/s4503OA4ThtmNp41I6fNwdLH6i/vHolWKlM2VMKU+C
         v+xa5OrwaWRd3t800XQBfWFUDS1kP/9kWF0mnUKyQD1/gdqT9YVl38A2fp8wwegaugvj
         vLpA==
X-Gm-Message-State: AOJu0Yw9LQTSAVYpLS/XzGnWJ4/kRdDt81CgqfF+4HD0bqmgky8U2Tqv
	VSTQvDBE3FFwSeuTgWxtcK5pTlw6E+voC/+/i6pOHYmER4W9D5tIehik3w==
X-Google-Smtp-Source: AGHT+IGLosO08ZXKoA1XuLlmpddoc2V3y6CwKOw/IuAQwj1zCJCa9l6+oWIoh8BDD8IE8Pbo6tjJnQ==
X-Received: by 2002:a05:6820:62a:b0:5b9:f351:3f8b with SMTP id 006d021491bc7-5ba78d42decmr3790153eaf.0.1717608055299;
        Wed, 05 Jun 2024 10:20:55 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba72cb44f4sm586124eaf.40.2024.06.05.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:20:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 1/4] dt-bindings: clock: sun50i-h616-ccu: Add GPADC clocks
Date: Wed,  5 Jun 2024 12:20:46 -0500
Message-Id: <20240605172049.231108-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605172049.231108-1-macroalpha82@gmail.com>
References: <20240605172049.231108-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required clock bindings for the GPADC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6f8f01e67628..ebb146ab7f8c 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -112,5 +112,6 @@
 #define CLK_HDCP		126
 #define CLK_BUS_HDCP		127
 #define CLK_PLL_SYSTEM_32K	128
+#define CLK_BUS_GPADC		129
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index 1bd8bb0a11be..ed177c04afdd 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -66,5 +66,6 @@
 #define RST_BUS_TVE0		57
 #define RST_BUS_HDCP		58
 #define RST_BUS_KEYADC		59
+#define RST_BUS_GPADC		60
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.34.1

