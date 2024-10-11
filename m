Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEB21500B
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642542; cv=none; b=LhNhAV+Xe5xB4w+5hYW7sI94PG12pWw2OGs+UiYgvRgahcfd+MrdY6yP4dUvsPtv0t6XQVj8+aaudK1oB33c/kx/ueAfLgV0GK8oMgGboRZ75J62GBpHqkWq6tgueCgD1h0j10ap2DXW6anqe2BEyaaktQ3ywHru+nVnDGuc+ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642542; c=relaxed/simple;
	bh=BHjvuHtxcGbYTJxuDTg/fs/1zRBNwMIIEfEqMmhl7qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+QG95A6h2vrsihwFzuHcs7RdyVbtufVWisePa/EB6n3WzhTdXrg8dHxJKrLMmNIHTW9zvdai99U71KOxLDuZwMASlMRxiO8WmQYX+giW90F5/eSI+HEFMd0myCj0P38jXX30DBBWWzkJKTJd1OmqIjPYlnEUjWhxMgCNF/sxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lht25DiT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lht25DiT"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539885dd4bcso2539179e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642537; x=1729247337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=Lht25DiT8rWmoEZhyBLYBYM8dEFGPdCmxPi30jGmehaE3PjeSmzG8B27VKsNtjXo1Q
         kvFQkcjQTb+NhvaoFub4/1zIqsQnvD1GKtOZtGMSdQbaGV+qBZ1BxPUXExpt3LnFvV+q
         2kaUj1iwuXqcicjy3hXzrlInkXn5Q99MBPjpOzptSvkWXSxH9YHSnixWqm7rMDXBlp/b
         vYQYtEZfYYzEThUxAEwQUi3sCebRlPciQ4ZAPGgrKw5QwBrzMcX4etyNe9PXvw4sxPlR
         tFyxIPHWOzFd4IOii1Jj+vtWUr7IKNF8rX3LTeQd/1MysQ9HxzzBkPoSTgSg+iITycOx
         F/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642537; x=1729247337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=FwQL9xnj7BgRMjzORqr8rChJo7GnNXUZicVNvyE7x9VFPOr8Uj3DLiaYEmD8VVIimy
         41XWxY3S6G3zpae+TMo9cJpiKPnsv7oRg1Gm4d4NyUYx9aIme/Cs0EeOxSWAgLgRcHRD
         gCNxB1xO5J4nTF5nmujcv7O3/hg37ceGHuKuZVqbRi7TndG5Z7hDA8M/FQ/ZhUuP11dK
         98B76OOkMkhSrGCZYEXFR2EbKBKK8hbbzjBKL3utV4EDm9aRmSpjDzCRn6sGW41BVmyh
         moZ2WedHOlCduy6ovFZQ133enpUvnFWZL8cjaBu5cDxbByi79B43PErC2V7oqzXCve/G
         /N0A==
X-Forwarded-Encrypted: i=1; AJvYcCUckDVJc/uASgSgekHW1bucAX/qJ2Zl3QQQRWkh3+Gwl+VXMJg00f5WW+Lh3UBNZVjeNuxYnaZy9ACtdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhEBORJkaJARn94aA8x80bEjyz3/XRDyFep9zHdQXvkz0Zcd1x
	knwaVnQuwjOihQqtKCFbexyulmpjoTLnKLDpAx4wSA3FBZ27m9SkMXfdw1EDqzTN
X-Google-Smtp-Source: AGHT+IH/0iVsIqjE53CKqC3QuGl88A222SHl1NC8BOnNKbuokjEWuS32AA0HurhU3gBV0qhEcwHfLg==
X-Received: by 2002:ac2:51cd:0:b0:539:e333:181f with SMTP id 2adb3069b0e04-539e3331a00mr162073e87.10.1728642537233;
        Fri, 11 Oct 2024 03:28:57 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:56 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Fri, 11 Oct 2024 13:27:34 +0300
Message-Id: <20241011102751.153248-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>
References: <20241011102751.153248-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..2c26cb8b2b07 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

