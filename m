Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2921C188CB1
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086137; cv=none; b=n0VC5HUVPJck0Fs6wgB9WegXzo6klm9fS5cLZYGrsYoH+5Z18k8Zhu2MfDXnESs1YmvgABJ+CQol+GxuCsLIPo1Hmg7c2CJPMfWj7/5CLvHuTHz9A6mbCCEmPk5eGxAtxtVtisKa1hn7PMEbd4M3+VyvHPghETwVRvH4/2lk7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086137; c=relaxed/simple;
	bh=XsvG87BwJjdkSaTHJqzYZpciQ121wWu6rMuV/WcvVAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LtKaQK2E7ZKl+Qo/fKDg3YEULuN4VkkNO7JyQYDoSnLil9lqiHoqy3mpYyCZPqKySKqFZTbN88Ql7fDzJXqczWL+zc1u4KOH2yiVIZkA4gWTzxSFwJGY+XWd255uvEShwStJUMQs2tIHaJB8pfBWKFzCOmD9NtEp/9km71xob/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxhyhXHV; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxhyhXHV"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70938328a0aso2351942a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086135; x=1724690935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDgCKdCvmsY03Pik3wYi9u14QEc+d2Lmm2q5fMkp+bI=;
        b=RxhyhXHVWi60W/OTS4idreXXpZkWDDacykBBdp3ROPV834ob49UyFAwQHLHsCnP7Uf
         e/aafLFMRE+pEfqCTxXUm1vf4fH22KhAP0M1H/1YA/k6HoJQROQV90ngiOjBr17YrbpR
         kCZtm9YYDZG1U1hP9sRjQ2s7/H2/jF126yAe74CQmnCRZsaBRdzmi9HR7Bspebk3AKNO
         kucNv530IOUIy4j1on9vv7Of4uBsA5cOwjWReVzvGs+ocWPDti0qPlrFFy+w+s4uqPwV
         ul90jGWp/F30NscV9thhHTvWmm0xovCA+OitzyqHKDUqzraPDmuB26txfHGHIUA8Gd81
         wP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086135; x=1724690935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDgCKdCvmsY03Pik3wYi9u14QEc+d2Lmm2q5fMkp+bI=;
        b=bqOGwRuXRzoNckx/UFMttaep0JvbRDZOMs7bDPwCc8iNZxjDQvDdthwJcYbwtNhjbO
         9aUnWjivpEekCN3S1/URWlqe/UacrDE0m/Y0tUTP0yqSVAASa2NdEmdOFtWuQj+bqn3P
         FsQusjyYp/LjYCvAczxeVo/w9O9jit+GTLp7eVDWKvgF1D5LQX7QQLOJCWBh9YAnIo4i
         nrqigcI+AtFdrdWLxpmJc/fMsKdS0mWZd48tB6B9EQpX5qqkNrLqqB4MbDIhexdHimJP
         np4BNwF8/PSYJCb9CQ85Asw7sjBnlKw42xLFsKc3lMBjiR+ZV4vGloHZScXrBkYi9t+m
         P0Pw==
X-Gm-Message-State: AOJu0YxAfOR2o1gNiTK+BQp1cCl/aH8OT93jKHEGFzDfBRqVWOI0xhab
	1lnS9Mo+1iVuXmADYbNiw2VdQf+lr+pnZHN5qq7P7hYp0nHmnkMssWIGMw==
X-Google-Smtp-Source: AGHT+IEOCZLpFVa3etUE3cD8cEJLVRhuC8dwY9gXtzaL2mwue40C2B/W2Rq9aJPon4OTO+dgphhnHQ==
X-Received: by 2002:a05:6830:358f:b0:709:4e4f:931a with SMTP id 46e09a7af769-70cac8a3c81mr16674258a34.22.1724086135220;
        Mon, 19 Aug 2024 09:48:55 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 15/15] arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX
Date: Mon, 19 Aug 2024 11:46:19 -0500
Message-Id: <20240819164619.556309-16-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819164619.556309-1-macroalpha82@gmail.com>
References: <20240819164619.556309-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the necessary nodes for the AXP717 to allow for monitoring the USB
and battery charger.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 078b9ea3d9d0..18b63efae083 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -21,6 +21,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <1024000>;
+		voltage-max-design-microvolt = <4200000>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -217,6 +223,16 @@ axp717: pmic@34 {
 		vin3-supply = <&reg_vcc5v>;
 		vin4-supply = <&reg_vcc5v>;
 
+		axp_adc: adc {
+			compatible = "x-powers,axp717-adc";
+			#io-channel-cells = <1>;
+		};
+
+		battery_power: battery-power {
+			compatible = "x-powers,axp717-battery-power-supply";
+			monitored-battery = <&battery>;
+		};
+
 		regulators {
 			reg_dcdc1: dcdc1 {
 				regulator-always-on;
@@ -307,6 +323,11 @@ reg_cpusldo: cpusldo {
 				/* unused */
 			};
 		};
+
+		usb_power: usb-power {
+			compatible = "x-powers,axp717-usb-power-supply";
+			input-current-limit-microamp = <1500000>;
+		};
 	};
 };
 
-- 
2.34.1

