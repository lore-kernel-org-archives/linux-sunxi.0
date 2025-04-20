Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321A1E5B6F
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745142514; cv=none; b=frwBdJkxPP7FumeToO1Td3PgGaS/lUKp5fNVz0JisQMKd5/lsJOr9xud0A+Sg7UJkqLkGZIuTZgd49Zqh62V+J5F8LyYitxB1gqkNZgYq3zIksomrPy8FxnLbabO6utg3SlYI0YTgWiqFUpH6rOIQhZyO7/ekfKSLXdwfCHBGoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745142514; c=relaxed/simple;
	bh=6VxIYaKIWn8yii/GfU9vwQ76mILw7alX8heBfuLY9lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uonwdpgG0/wgPMieLfVOcF9PNyeuxg0CVApefjp2YkhIjxMMb5YnZp52LakndbNoB19zRDzyPbTRC16NAiUDGH0YNBAQbaFLA8e41znSfMZXHyAKFrR3uZGsg60kkZVCTxipAp3aY4WfFZyKUmtIqRHbmAKGrVCOeFCpoEbZ6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQtOaLYh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQtOaLYh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso25968345e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745142510; x=1745747310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J70zSIsICNkhe0luW48bZRB0FNJW9CojZ7pnZGLzqis=;
        b=EQtOaLYhPGmeiRc5GfWQF3dZQuqtTp+rkK8A1mxdKuqIOX/Hi3BR3k2goiYHL/bsQb
         qUKE+xK+BqS3qbTtT9A9KcEddGSVICgnpl4k0llF1+OCj7Ja0U5vjqrxVqn9tvhmwEyR
         eBS3ou6AATs+XQL7RKcFCCYZan1H6OoxK+DuaOOohj+wAlRCAhlMV8KpqE8Dmx76xbF8
         kFtRxFYKP4U0uuB8jUUofzvsYu568Sw6D9rZqt8Z6f9zAy43RtOXAC+IZEPu7mbd0kLJ
         FKACLGuLRrq0fa6Cz2w5OsyF3AsmuYYlqir3/+DQ5V9+PtPcqjSRsT3O1TK/72eUyhxa
         8oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745142510; x=1745747310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J70zSIsICNkhe0luW48bZRB0FNJW9CojZ7pnZGLzqis=;
        b=Gwz3aQexaMYfhKv2+H0Gg6Pm9AXFQ47as+mV+44EvSCsErLrYSfjC8nnyyHBAFvQLD
         YEWgRcmxJiEV8ggZExhW4egu9DJCsGBN8aG+T+MVYLLVSYLQ0tlZau/0+oxVu27WfVzY
         ksJB/E4W7oqaYkgcDysngTZ1EIJHdrQEm5Zi0GUB9me8mnLF4VA0C9bkbnkR3+hGyYZA
         ZPW35h7TVAUCKiqdkP/gaOMWSEOsWIKxChLy434uvCJqJlQ7lPeNbJzcS1Z7BrMnAZV6
         g+Ycf/wP8IfvPppcwLwCWSBkj8bMLTqkGeRM20hQKZM2+MToD+UQj4+np6jlIuIw3wCP
         sS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrFxzgDHazzgm8PnDOltEOtQ01+6kkaSr3WRoKrPQ3k/A+tzqglI9SZtVlixbuXXXOt8hL2xRCSSIGsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeI/ZQCyq/rSt9Z/YgxeDrMye/OAxUwDs/cwhzkfOfGWnCMFyW
	jsyxZCZLpRYLc1J8BioE040UGpB4KHiAFxz1Nz5c4T5Av2nFTxRe
X-Gm-Gg: ASbGncsJc+eMfhVCY36fXhx6KscWoBmSZDLRLW/pakZ8Tej4+P4Vk0M59S5kuDJI+7q
	9zRco+4j4EX2NPVcpfp3+yzJjgiGZAhBTi/l6QzXRyjS9H217hMcZcOOwH0Tml22fZ1JVSzjfEU
	J9u1ttKKPE78v6IrazeWCxy9lPcqKaz0BZ7EQA6F9IP6/na6k2HHOii7DOaOw3W5e8fdpbkb6sj
	X9FMCPoY47KxlzscRbS5j+A8n0m+E8IbDETDZ/LAHsnSpMRoLlyfOjAjVcdIUM17IY8VWoXb7mx
	og48MMkE8BJPMgjuxxtKFmj0+yuuR0peOuxTiZaThBsD6mlJQfzE99tTn7QrtvDlgGb6rQisdOI
	gVx29ymS+IgFlqd55kwBXSxkQt4j+kMApXZ951aIDwKMYJc9raEv98OziK71y6l/iLUvxYlvMaF
	0=
X-Google-Smtp-Source: AGHT+IF9o36sHCpVLQh3u/uS8Mj0MuecjMIiXN/dsX6wb8zysslgsszsD29TtXQILSnoqleCJeVPxg==
X-Received: by 2002:a05:600c:8711:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-4406ac0f82bmr69263145e9.27.1745142509826;
        Sun, 20 Apr 2025 02:48:29 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm8273712f8f.49.2025.04.20.02.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:48:29 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v4 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
Date: Sun, 20 Apr 2025 10:48:04 +0100
Message-ID: <20250420094823.954073-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420094823.954073-1-pbrobinson@gmail.com>
References: <20250420094823.954073-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds all the pin mappings on the WiFi/BT header on
the original Pine64. They're disabled by default as the
modules don't ship by default. This includes, where they
haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 09e71fd60785..3256acec1ff9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -124,6 +124,17 @@ &mmc0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	bus-width = <4>;
+	non-removable;
+	status = "disabled";
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -286,6 +297,7 @@ &uart0 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
-- 
2.49.0

