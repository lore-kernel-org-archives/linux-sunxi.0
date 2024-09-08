Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF417BEC8
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Sep 2024 21:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725832087; cv=none; b=skS6OOEPmjKLkm+sJeUMZWpvapfuySSRKQNCo6TNUw6btifOHusu+Yy0Lm82pDpggxOI7JiemmlpJXqt60P937dY+IAvPFJ8D2q949es0q1bYo1+y+tGajzDnCihixFSHBQf0eYA+gUaSt+v60e8HOBEZ7yH7xi4bmx7f0d4P+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725832087; c=relaxed/simple;
	bh=61A2TmpCBTvA1OQSWxfcDyW9YW/y1h704XtvhNpV7BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9w/eZ9EtUCZ/PvRZ526w8PGf9DQCOAoZxPea25xth4awJ1vW70TpYZlPYnoQAYuW0oYwHvox+8cpFAGfTnQrrgkXlZS8fcdSNzw/eDMaRahdRd7WseeXBKZEryDku2TyTBjsPHbUSssVK+RpaRV0I/st0nu92yMYndj3KKppr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxdUM3bO; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxdUM3bO"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75c205e4aso14507191fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Sep 2024 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725832084; x=1726436884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5lHdD1vu8tp19LY7L9NdChS/5uF8VF0FGda3xCecrM=;
        b=DxdUM3bOZdupE0v46ydkyF6kz5t2G3kexVwruqOwpgZPwpGCapvVbEg5vVbWs9OtIc
         6ptyiVjAQjS0GOZ9QrZtIQaplT0rXiE2vvzSpZ+5bl9qNDwZgwqnxtVsaNzkXwwZ4nJ7
         Jf7jJ+3R8HlfuVsorc7CZK9UqR6K/DR/tnjqB4V4uBZWfANHXTqyoSgR5yCtnIq1ZQgC
         unvVUUHwN3lgUyuFBYuhXdXvixuWB2hNY7Z41P0x/tuueFCCsP9n3ZY543xcDIXKNxtt
         0W+j/GxO94b/re9pQ87FaIuhyxCZlehA/5px+2gP0RFOQw33OSDSpFsp7lzxoxPNvL67
         pl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725832084; x=1726436884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5lHdD1vu8tp19LY7L9NdChS/5uF8VF0FGda3xCecrM=;
        b=taIxeMCYhGrQT3ix+BR3TXXPoax1fWvBg7pj/xMEvuVtCeSgZU5XSW1vMdcxisW2GC
         F6dKsWw368pjZcFBdgoZu1cXr49T8HMAuKOoq+4MGes0H5d1F/XJxeJEcfr1yen0v3U/
         YSSsSVgb1A4BXj3oU2lixx+117BfUcTBDxOh62a/BazQ9fAJoetMC3D8x0CBj+vTEyq3
         TkBAPo8t3Mb20xCSj0loCsokbCyWkvJAPe2Y/3nhlrQEoYaSKSPIKaqVJbW2Li7E7rnn
         /ws9zX8+7hUFMNyc/aFI2JjFlMHPSRxyZ7dyun0kKOzOueMcScC+EFVqH/pJbVFF0xlg
         oCQA==
X-Forwarded-Encrypted: i=1; AJvYcCVbERB9tU6gaHv08S8NYSZf2s42SevRij8fGQUnVKhTGR7pxx/tS8WO7HtAWai/EKOWkPiqaRDvLBmyXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPCXfj+x48nHaNo0l0QCq4Fsyb5zYno17gMJ9TFbxuBaSbOlR+
	P1ffYLhomzawBBx4gPc6yaFwtjOTt0inxXR6cSoSui4YdD985aMf
X-Google-Smtp-Source: AGHT+IGWrBJfazLT3p6fzD1nzJeGKGktro5pYGcc4Vwm9vZSCn+YQvZnQ7GH/Qcypc5LoLYr8Z+kkg==
X-Received: by 2002:a05:651c:1543:b0:2f7:614f:7d3e with SMTP id 38308e7fff4ca-2f7614f80b5mr27281081fa.30.1725832083627;
        Sun, 08 Sep 2024 14:48:03 -0700 (PDT)
Received: from localhost.localdomain ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c009a5dsm6094001fa.72.2024.09.08.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 14:48:03 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: sun50i-a64-pinephone: Add mount-matrix for PinePhone magnetometers
Date: Mon,  9 Sep 2024 00:47:18 +0300
Message-ID: <20240908214718.36316-3-andrej.skvortzov@gmail.com>
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

From: Shoji Keita <awaittrot@shjk.jp>

For lis3mdl, values are based on datasheet and PCB drawing
and tested on a real device.

For af8133j, values are from testing on a real device.

Signed-off-by: Shoji Keita <awaittrot@shjk.jp>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 66fbb35a7fae9..d35d747292ce6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -195,6 +195,9 @@ af8133j: magnetometer@1c {
 		reset-gpios = <&pio 1 1 GPIO_ACTIVE_LOW>;
 		avdd-supply = <&reg_dldo1>;
 		dvdd-supply = <&reg_dldo1>;
+		mount-matrix = "0", "-1", "0",
+				"-1", "0", "0",
+				"0", "0", "-1";
 
 		/* status will be fixed up in firmware */
 		status = "disabled";
@@ -206,6 +209,9 @@ lis3mdl: magnetometer@1e {
 		reg = <0x1e>;
 		vdd-supply = <&reg_dldo1>;
 		vddio-supply = <&reg_dldo1>;
+		mount-matrix = "0", "1", "0",
+				"-1", "0", "0",
+				"0", "0", "1";
 	};
 
 	/* Light/proximity sensor */
-- 
2.45.2

