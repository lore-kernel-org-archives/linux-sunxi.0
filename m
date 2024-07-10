Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012815534D
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653587; cv=none; b=q9ttwCbbz1yAVPnujlzhCfBxKxYaDNg/LY9LN9Xi81c2l7/xCu3K19oEwgCKb6jsuTl05GpIXM3RqK0FeWE65E0MDLmQKlh2ZZd1FgIkXYR0FIDePP9ObaVtaHo151bsIfNUL2nPVoTHetD8fL9jig5T/VgArLe4I0QRk6L+vMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653587; c=relaxed/simple;
	bh=iQfsNDwxQuKmM1LvRmrJ5KrF/yqZ29FfGhovA+NFxD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YNmqA3SuiHVf8QLipaiaX+iMPBVeGv9Iu8tac+kJYr9GmchmyNS6IXUUou1qGOkU2kmRxp1LHmOCS4BVUJgBwWgudapf4SZK5KIoe7rX2/nTf1bsgCuYmLNRzH13kwFNLovdQQyCvenS4OwFxN0QrciK6bNhQ/HilbOwY0RXEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcCYjnuY; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcCYjnuY"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70361745053so150092a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720653585; x=1721258385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIkm02pH4tYGv9UK3P4L+KwMHHNwtAihXpO73Co81yw=;
        b=ZcCYjnuYNk3wSh/7qJVflBlnQpcGsNrreppsWCNf9x3jceTVVS2pXNTHXxPUeUDoe5
         5/QqbiVJo8gFVgsSHR7cLk2G853f6HfGA/weVXEIakJ3wQwLeybLj9za1+JCNJMQVYO/
         00kd6NcyQ1lN0eRpsYqe3/D9D7WfR4BeTnPfc6Hnl1DHpMSPOBB/WHXyf/AW8q7EgwgG
         MEcE0C6g4xxa/5Rzj3L2oijGw0zOsvNinpnMa9U9yQ6Yvbf18xc1cn0l0WfNAXkC1lqY
         ZLGgHwu9HVHpLBabvw4X0PKriSjDtxZxw35MpIc7A+f2sdja9+0NX6aEswhaExk6h4KX
         tzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653585; x=1721258385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIkm02pH4tYGv9UK3P4L+KwMHHNwtAihXpO73Co81yw=;
        b=v69KtS6Lfh4GSXeNmC91klX3itXYv1c/sI9fRNf3+5WJontCNxxg7Acm/mb3L/pP+K
         s1nVOLxPJWL/MVxXjZwJTzfSE9qIVJQpSuvCYMsH0bLrAL4quUHWricd5oyDvZTlVZye
         xC41BR0w3fKd8dcdWVDhXQXT8y34rcKpPVr6RxZwefksO7g7ZBVp6rXJB7wfuJJc54pT
         pyEhvBvsY10Z2SNl8EWQoTeGm3SGDTjyFQ5k5NBEM53B6IeLYDH48zIDT12qZkcqk6jS
         AnXJMOkPOiXvUDoI+LRcTg79p/vIEkH9SqUkWx9/+nqDI3m1jl4ofrVR6TfduGQGo1EZ
         aWXA==
X-Gm-Message-State: AOJu0YxnB2jI0hlGoM0qDgduKYnzbnfNQ7Mftkz9xzM6hUKgRS+LOcsQ
	ki4uYKmFmd6cC9ob3zt6o8Km0kXrtjFR4+r+70KhtffP6/vd3cMNtDvosA==
X-Google-Smtp-Source: AGHT+IF3x5wUTNgVSORkAmMogpfaZhEuPDMl15HKaYLsS+U9CvYuQLfK/vjMohNlgE9vsofi97w/zw==
X-Received: by 2002:a05:6830:1d4f:b0:704:1569:58be with SMTP id 46e09a7af769-7076d4d7fefmr432032a34.16.1720653584854;
        Wed, 10 Jul 2024 16:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374fcbf30sm1040207a34.65.2024.07.10.16.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:19:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 4/4] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
Date: Wed, 10 Jul 2024 18:17:18 -0500
Message-Id: <20240710231718.106894-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710231718.106894-1-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
clamshell form-factor. The key differences between the SP and the Plus
is a lid switch and an RTC on the same i2c bus as the PMIC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  3 +-
 .../sun50i-h700-anbernic-rg35xx-sp.dts        | 34 +++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 0db7b60b49a1..00bed412ee31 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
new file mode 100644
index 000000000000..0cf16dc903cd
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+#include <dt-bindings/input/gpio-keys.h>
+#include "sun50i-h700-anbernic-rg35xx-plus.dts"
+
+/ {
+	model = "Anbernic RG35XX SP";
+	compatible = "anbernic,rg35xx-sp", "allwinner,sun50i-h700";
+
+	gpio-keys-lid {
+		compatible = "gpio-keys";
+
+		lid-switch {
+			label = "Lid Switch";
+			gpios = <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE7 */
+			linux,can-disable;
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+			wakeup-source;
+		};
+	};
+};
+
+&r_i2c {
+	rtc_ext: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
-- 
2.34.1

