Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55506F2F2
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Jun 2024 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408390; cv=none; b=r5gFtgjLQ55lpUpYBStaHdckjv5zSFMqxz/65HHCA1IIhSSByotqaJVUD8ANmOQ29YWP7kEJgsFhUnW96wiKrvEZQllEyUlk1SL6aupqPFxdsw3mR58AerUfPxZMzQtSRRFvxVIzqWSbDYChlbswo3xW4pvyQLZEKXiUFGcmXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408390; c=relaxed/simple;
	bh=8QFq53Vw68Z8wmpxtLqUJARX8ise02r0x8sOkeP68Rg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DNFQKBoxG/9Tg1A0ZhHrfkvwhSvx4JfT8WsHlF0JuBveHQbF2rCzJv1XybgYOI587dFbioIcRF3s7dlfT04Mq2why6jTyGeEsvPkpLxJdbKQsO1YnP/l7dUWjIWRdHJQvtQO0Wl0y171UberIjLuVo+71D0161gIKPiMw8o2JSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XswH0VC6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XswH0VC6"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6c2d04b0833so320625a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Jun 2024 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717408388; x=1718013188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihw1/2+Zpf4ZXG4EW0h/grJjkHSew+fByT7htqBrrOA=;
        b=XswH0VC6+AhEfRIKREGHsyLz7qh6xieS4Usln5gDGRo7KXYAE6iIVuIzhRXqz+vcaZ
         XGG4wcahQef+xm9d27mtWurmOgVuDULcuNlVKYc459wDDRfcsJRTL+gm8Z9NUtfPA5vp
         mFyU056pgsmhUf8ars58BHwl32AQ1GksMv3x3UL4ztP8FUiR0eBpUqou4OvA2FO+qbZo
         HGkJwqxtgIr3xvwNofUViRbrIn2/9/MYvKYKyj1VN0grJBp1gtCcAbVYgKcTHdn4OL5C
         xU9APLKzljx1S14VNWO/5xAOaSJxRCRL6ysqrpqKAKcIZOo4fEDvRqFf1Z4fHpISePWK
         0Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408388; x=1718013188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihw1/2+Zpf4ZXG4EW0h/grJjkHSew+fByT7htqBrrOA=;
        b=K23HOl2IzoNrJ/fbXPDKKuO9o5zo2BSfYxcciCy/e0H9Dh+pRBPCjHmUJqd3S9EoHn
         TyS2T8vEJ+EdsHoVp02Knh0orSf+/nX25zKj4wjdHSzco5HVM+3GRlTkJKYvR5INgo+/
         yoCxuXjZmBMQTAvxxih3Cv9zaKOUi3iWbYgb9oEUdXxmMpe6cIw13JtmaILQMrSCAwfm
         DpI4vpoVy8QSNUe4FNdiz6LF5PwPVRpCBOUb2rE7Xb5ncaONookEqexmoiokGzCWLmxX
         MdHC4nIWuKuyNQO4c8LkITIMHcH0UMFy/P9hSpKpl/7i1neGvLmGd3ce1+qUW98TMs+5
         1cZw==
X-Gm-Message-State: AOJu0YwcD1AhcPYyy3/YDyq6QNi8hXGHex81q8fEfXVOP8w/dEfvVwBV
	tpxYJek8EZWNMu+MS1KPwqayLRJMCahzAgHngUY0C34voJwSuvH8P+9jmMcBk+A=
X-Google-Smtp-Source: AGHT+IEfkF0C20Vh/kiDy2xtSL/1XHRFKU31bmVoG7Sc0ArkFWf26eq75/77cqaYVh2J8qNLoU8WSQ==
X-Received: by 2002:a17:903:22c3:b0:1eb:50eb:c07d with SMTP id d9443c01a7336-1f6370c34c3mr95597835ad.4.1717408387490;
        Mon, 03 Jun 2024 02:53:07 -0700 (PDT)
Received: from kl-desktop.lan ([103.149.249.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323e9f20sm60678215ad.189.2024.06.03.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 02:53:07 -0700 (PDT)
From: Ke Li <cnnblike@gmail.com>
To: jernej.skrabec@gmail.com
Cc: linux-sunxi@lists.linux.dev,
	Ke Li <cnnblike@gmail.com>
Subject: [PATCH] ARM: dts: sunxi: Removed redundant sun8i entry
Date: Mon,  3 Jun 2024 17:51:34 +0800
Message-Id: <20240603095133.1792688-1-cnnblike@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Jernej.skrabec@ and linux-sunxi@lists.linux.dev, 

I'm looking into the dts Makefile of Allwinner. It seems like in 724ba6751532055db75992fc6ae21c3e322e94a7 "ARM: dts: Move .dts files to vendor sub-directories", we made a mistake and duplicate the "dtb-$(CONFIG_MACH_SUN8I)" entry on line 202 and line 265.
A patched is generated for this.

KL

Signed-off-by: Ke Li <cnnblike@gmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile | 65 +---------------------------
 1 file changed, 2 insertions(+), 63 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 4247f19b1..f9484f8d4 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -260,69 +260,8 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
-	sun8i-v40-bananapi-m2-berry.dtb
-dtb-$(CONFIG_MACH_SUN8I) += \
-	sun8i-a23-evb.dtb \
-	sun8i-a23-gt90h-v4.dtb \
-	sun8i-a23-inet86dz.dtb \
-	sun8i-a23-ippo-q8h-v5.dtb \
-	sun8i-a23-ippo-q8h-v1.2.dtb \
-	sun8i-a23-polaroid-mid2407pxe03.dtb \
-	sun8i-a23-polaroid-mid2809pxe04.dtb \
-	sun8i-a23-q8-tablet.dtb \
-	sun8i-a33-et-q8-v1.6.dtb \
-	sun8i-a33-ga10h-v1.1.dtb \
-	sun8i-a33-inet-d978-rev2.dtb \
-	sun8i-a33-ippo-q8h-v1.2.dtb \
-	sun8i-a33-olinuxino.dtb \
-	sun8i-a33-q8-tablet.dtb \
-	sun8i-a33-sinlinx-sina33.dtb \
-	sun8i-a83t-allwinner-h8homlet-v2.dtb \
-	sun8i-a83t-bananapi-m3.dtb \
-	sun8i-a83t-cubietruck-plus.dtb \
-	sun8i-a83t-tbs-a711.dtb \
-	sun8i-h2-plus-bananapi-m2-zero.dtb \
-	sun8i-h2-plus-libretech-all-h3-cc.dtb \
-	sun8i-h2-plus-orangepi-r1.dtb \
-	sun8i-h2-plus-orangepi-zero.dtb \
-	sun8i-h3-bananapi-m2-plus.dtb \
-	sun8i-h3-bananapi-m2-plus-v1.2.dtb \
-	sun8i-h3-beelink-x2.dtb \
-	sun8i-h3-libretech-all-h3-cc.dtb \
-	sun8i-h3-mapleboard-mp130.dtb \
-	sun8i-h3-nanopi-duo2.dtb \
-	sun8i-h3-nanopi-m1.dtb\
-	\
-	sun8i-h3-nanopi-m1-plus.dtb \
-	sun8i-h3-nanopi-neo.dtb \
-	sun8i-h3-nanopi-neo-air.dtb \
-	sun8i-h3-nanopi-r1.dtb \
-	sun8i-h3-orangepi-2.dtb \
-	sun8i-h3-orangepi-lite.dtb \
-	sun8i-h3-orangepi-one.dtb \
-	sun8i-h3-orangepi-pc.dtb \
-	sun8i-h3-orangepi-pc-plus.dtb \
-	sun8i-h3-orangepi-plus.dtb \
-	sun8i-h3-orangepi-plus2e.dtb \
-	sun8i-h3-orangepi-zero-plus2.dtb \
-	sun8i-h3-rervision-dvk.dtb \
-	sun8i-h3-zeropi.dtb \
-	sun8i-h3-emlid-neutis-n5h3-devboard.dtb \
-	sun8i-r16-bananapi-m2m.dtb \
-	sun8i-r16-nintendo-nes-classic.dtb \
-	sun8i-r16-nintendo-super-nes-classic.dtb \
-	sun8i-r16-parrot.dtb \
-	sun8i-r40-bananapi-m2-ultra.dtb \
-	sun8i-r40-oka40i-c.dtb \
-	sun8i-s3-elimo-initium.dtb \
-	sun8i-s3-lichee-zero-plus.dtb \
-	sun8i-s3-pinecube.dtb \
-	sun8i-t113s-mangopi-mq-r-t113.dtb \
-	sun8i-t3-cqa3t-bv3.dtb \
-	sun8i-v3-sl631-imx179.dtb \
-	sun8i-v3s-licheepi-zero.dtb \
-	sun8i-v3s-licheepi-zero-dock.dtb \
-	sun8i-v40-bananapi-m2-berry.dtb
+	sun8i-v40-bananapi-m2-berry.dtb \
+	sun8i-h3-nanopi-m1.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
 	sun9i-a80-cubieboard4.dtb
-- 
2.34.1

