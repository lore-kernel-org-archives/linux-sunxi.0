Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069C1A4F13
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557847; cv=none; b=E3d5wE2G73aRwb/rmkYh6Li/Pu8niesBQXQvW+ECf0Lk8CdE3IMlZ27/CoGJ8fg896oEwsZbc8VqZ2d2ISLI3mPpxkceoJQbSE6hkcjmJkINhsc1Qez0HKK5mXvSlC4VCUUPnioaM9/q575pO8YOMKB4LS2u2++FjqEHMdZdids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557847; c=relaxed/simple;
	bh=ZUQNvjzepWA4pCK8RLWIXzlmS349ucRwrxxaYBZS3Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hzz4JM3sIVQ2gKal/A9A8oN+oq0NoMKSfheadg+s6JkwB98H0T2eRfLAdqppMHpr6UkZhO54q+6iW0fyY6Me+Yau30BzBDCfckWn2Vbg6ciJr7GCpDJicNbD4FLiDuOs/Asw476qGec6IyPxfhru/zeiA3CcJ13FFZOO9k6fwKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZSmPSjR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZSmPSjR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bfb50e4e6so8368845e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725557844; x=1726162644; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=557eQ0nrkCY+/ANVkKP3VQXQ7163oT4FiuaAuauOfKc=;
        b=KZSmPSjRvHP/7+yJFFIlh6z09sTf+V9387U9de80LcQAnLZcDvXJ1t1vpBJ/ZVv7H3
         zrRNnrEHlRkYT1b5iFC6euRY4zAzs5RPSaaiCS2JIRcVzfzqbCWabCtVxVpw2Fg4ZInk
         fRAWbquNok2j23xL3RNVlix7v3xHou9plVaTPCK4jBSTU5Joj3BrxBkSK1RXAgitGmRB
         kxqU1kx4YclEOruOvoT4P49VUBGQPXqONZSOCJXpZgwW/1qVKQNZv/kFe4RapKxAjedL
         lsQGQyX5bxy11h7gLyHP5At9u576XjNWIxTjs0rxmjUYlP5+ZGykhbkSz/fOX8K7og2R
         EtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557844; x=1726162644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=557eQ0nrkCY+/ANVkKP3VQXQ7163oT4FiuaAuauOfKc=;
        b=pnU+8TTdBEefA3vYxGvIvsVDq1Np3udgvMaFz1xG3/SAO1jE71lx1mpqg18Ocr297D
         nKMDRsI1jtya6GLEslbnhAIPQyAks3TgjzgPfLWVgsCGiKZCS85vs5Io20A1xoSZWbJo
         5EHCMp0VicWN1PXcpIBq3moIIghYjFhrTn0jZJtcp/8WrTImDzM39vwl0SBV51ppe3DQ
         GoitvefWrOq/Kv+gCDH0hdvGvA3vRXMmReaEpfmCcfdq023e3Tyc0HTQkYwgpYmaAdJ5
         R2FocBmZ05f97m04gAxHikODY04PDHTZbliGsuMS/5BQqojoGGm/OYneBUqFPLlRMyCg
         btuw==
X-Forwarded-Encrypted: i=1; AJvYcCXBIhDD7oWV+POOjOLcoShrbntmWrXRKecnHB8L21sDZ3TQK1rN7gmyE8DS27mNAep2eKTjJytsxvfF9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8HmL0kxStXZFgoArVG+/hK9rSISEfvjlK9GiHKsqM/VJ1F3P9
	DkKFr10w1ZMCymz2VgDwTCk7ptW4GwBPPvNNnDDwx7Gz018DV+BV
X-Google-Smtp-Source: AGHT+IHG7cIYEiQK4CjUWPerdwh6CKrVoOAyBG3msAvSCV3Qn00TYv6w1O7L2+TkplQKEGL8B3Og9w==
X-Received: by 2002:a05:600c:3596:b0:426:66e9:b844 with SMTP id 5b1f17b1804b1-42bb02c0711mr192660435e9.8.1725557844242;
        Thu, 05 Sep 2024 10:37:24 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-185.rib.o2.cz. [85.193.33.185])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42bb37f7849sm245704605e9.7.2024.09.05.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:37:23 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Thu, 05 Sep 2024 19:37:11 +0200
Subject: [PATCH v3 2/2] arm64: dts: allwinner: H5: NanoPi NEO Plus2: Use
 regulators for pio
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240905-nanopi-neo-plus2-regfix-v3-2-1895dff59598@gmail.com>
References: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
In-Reply-To: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725557840; l=958;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=ZUQNvjzepWA4pCK8RLWIXzlmS349ucRwrxxaYBZS3Do=;
 b=HR9gGVSIHOvwivYhckB8+lKbHqe+U0NuPSVXQyZHFvG79aOdTUJqu593cgFwNB7Tm+0Wxox4m
 GvATeaSEke+ALXSM3Dxy21o3ZbF5vQNIEpWqEBoAD5294oLrtCJ2zZu
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Pin controllers pio and r_pio will have proper regulators assigned.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index dee4cd82636b..526443bb736c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -171,6 +171,18 @@ &ohci3 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pa-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pd-supply = <&reg_gmac_2v5>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+};
+
+&r_pio {
+	vcc-pl-supply = <&reg_vcc3v3>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;

-- 
2.39.2

