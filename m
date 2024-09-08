Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCCD17B50F
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Sep 2024 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725832084; cv=none; b=KExsfFsxz7IxL/OUhBGcbQ2zyxFQXTg+g8W3J2iOzm2xdSmnYr5z/fLPiopjcZSblBSwNos/h+lb1yyn6MCTVBOdHFRHbQrUZ81goQvdB32BfgA8MqApfBR9IXKAb7hlmWOT0UaXj2miyMHyO0sbjm2XVPwg4wRhHGOtuhDMV/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725832084; c=relaxed/simple;
	bh=enP55UdvGXp5F5o/Qt/iN8GCJ3XoOR4JNPqAB/35NGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBNoJlQDYmWjr+oTzxbydNB6SVJgAmTjhRxJtQ0yByLsG1xWAL3SvUiaq9ohueC0auhaAkVf6D8iAE9VoB3UIRqgNdlewKo0TXylaxalT/jji2+VOT6WZDURG23VJCEKKgPjqtJHmzm9iZNP/gs4iQqvHmvTO0pmGY71+2+tSig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoDLCKU9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoDLCKU9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso14302871fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Sep 2024 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725832079; x=1726436879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3h/dy8U8KeKo9pl0s6GpX+Ff1bmWBiKnyAT/bdQlUo=;
        b=MoDLCKU9kyRSceQII9UOjLxXOAn94NemMtC0lfh5yQlKZFmhJkNVsKKl7bup/BnMiX
         qC/gpEinStQr4f1KXFaotikvTyO8/89bmy4XcK9bSiB5gjQ4qY/935PxEO9nLphhyvhq
         NILT81cDnrU62zpxj1at1ckO5bvCIsWUDODvyw7tjcea87yzchTyczmzbortUA87HGn/
         +QZ0zV4yi4hpY5dErTnxj9Iq2TtiuFvrQy2ntYtx3s0COa+v37k3xCTaIZnAkKxcsQlZ
         3VT1I2w2DZzA98sn+lOo0P453wykTxaa8BjoCzdSqyBSO7+T5dmgtQQ2zdvraD1wvmRx
         kavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725832079; x=1726436879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3h/dy8U8KeKo9pl0s6GpX+Ff1bmWBiKnyAT/bdQlUo=;
        b=UhcGGhDtqNobtwgKkgP5sLgNWpW3utdjYNL/zvwzixtsCFNPVf/Vcz9XLQX9e98NqM
         31ojRVPvamrhL0X2F6cOnWlY5Tg3qHQMJvreWJdBtDH+AhXJVkCg8SZ1mgXNiqyx+Zio
         n66fUlYFKUrQ0P6tp+R2DQcobdMb6wVUK+ZNb3gMlfCCxKpw7XugzRxa0Pvf17MSbHBa
         826sgHLdjh/Nbbi2dOwuFjWW/7jjIvqzcSWc9VmhEDsJESRzQ6Cw3TWDyfE0CBKpx5pw
         AsRHb15Z1Bs77NeXj/7q82YFNeQjBDeCTMFbd5ZliTi3RJLnWPmXlGAJ8e3hQJ87dXdg
         oTGA==
X-Forwarded-Encrypted: i=1; AJvYcCXylWmYWOrBCWiGTbYl/dgcoVJUqcRKaKRXAtKbvc0gVAwF+szSupplcNf5XmWr3PFFanazPSvTn3YV6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0oAyaqR9UVXu4fN0jy/vCryWLP6IeDWxem3/jIoBYQQVbh6to
	NoBDFgw6gOT7Sx+9gD2+oiGbJF6In7PLI01XzUpMf8TFHdZRPw/g
X-Google-Smtp-Source: AGHT+IGrW/26G4fqJ55LEXa+E3HPJe1Oq8TWJKGljblgXwZFH5PCcrjxnSDxIUyY7RjRWG/956715A==
X-Received: by 2002:a2e:a58e:0:b0:2f3:d82b:1959 with SMTP id 38308e7fff4ca-2f751f00b02mr77757571fa.23.1725832078203;
        Sun, 08 Sep 2024 14:47:58 -0700 (PDT)
Received: from localhost.localdomain ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c009a5dsm6094001fa.72.2024.09.08.14.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 14:47:57 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
Date: Mon,  9 Sep 2024 00:47:17 +0300
Message-ID: <20240908214718.36316-2-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <icenowy@aosc.io>

New batches of PinePhones switched the magnetometer to AF8133J from
LIS3MDL because lack of ST components.

Both chips use the same PB1 pin, but in different modes.
LIS3MDL uses it as an gpio input to handle interrupt.
AF8133J uses it as an gpio output as a reset signal.

It wasn't possible at runtime to enable both device tree nodes and
detect supported sensor at probe time, because both drivers try to
acquire the same gpio in different modes.

Device tree fixup will be done in firmware without introducing new board
revision and new dts.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Link: https://patchwork.ozlabs.org/project/uboot/patch/20240211092824.395155-1-andrej.skvortzov@gmail.com/

---
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 6eab61a12cd8f..66fbb35a7fae9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -188,6 +188,18 @@ touchscreen@5d {
 &i2c1 {
 	status = "okay";
 
+	/* Alternative magnetometer */
+	af8133j: magnetometer@1c {
+		compatible = "voltafield,af8133j";
+		reg = <0x1c>;
+		reset-gpios = <&pio 1 1 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&reg_dldo1>;
+		dvdd-supply = <&reg_dldo1>;
+
+		/* status will be fixed up in firmware */
+		status = "disabled";
+	};
+
 	/* Magnetometer */
 	lis3mdl: magnetometer@1e {
 		compatible = "st,lis3mdl-magn";
-- 
2.45.2

