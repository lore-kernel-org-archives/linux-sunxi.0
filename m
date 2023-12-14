Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC7A3BB2A
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZR/6xra"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c3f68b649so55831495e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550128; x=1703154928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrT4GQFgUc2NFNy8QfHDcUrSUYysbuxBIxCpg4THq6A=;
        b=AZR/6xraG8u8MhyQix7MsMfTb3ExOUt/T9idNIZfPgIKJZ95+8FS8ao61f/WKlHd9Q
         F594RQAQJPLw1PBQIUHnRM7LMkOSDM1P7pwJp6ym6S5yoxt7GCY9W+Xm4IRZG04z2zkL
         3R2W2wyK97kfce3fizhgsga9D/cRcCHTDlnPZoJnSIMLwHOlFKyBGn8aISiI2d1HHG6s
         6u7W2NV8s1AZW2oWz2N9Vn1r3E21aBH6ku0tPGtqMFwHXUtl5BB8WFnFh1l3+kS0ddqy
         pgX4TTFEeLsO3DF+sPTwuw+5G6DfKM2Pqxd8jCpyr846MLMGzf1WsC+KRLbJpRiTrF/A
         Y9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550128; x=1703154928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrT4GQFgUc2NFNy8QfHDcUrSUYysbuxBIxCpg4THq6A=;
        b=LXgwxVzG5yHR9a33rNwfA8SF0pyd7kfFRAnGcY4skZ5hu7boeqrrX0bPhizvdw+O36
         iS57i08D1fYck4F/D+QHUNCYldNbI0IigruQSSFB7lx0MQwB1UcRGglzXoKVDIa5UinD
         5e03GVjyZ5X33tLS89z9pjkQlkdkVeM96H3IqKjSu/QqnpRd0Zu7tJvg4ouwtlir0pux
         AX1mOMh/R12I0wvypTS0RIhv0GM21phN9MeQZdDw9hEQyuUldDSWrlbDikpvcUcDZkve
         CdQHOw+hMmR1MLMQ70S5zebUhojTozrNpefTR2F84VWjffCcTUNqEoHcKT/Qs5LB5oVX
         cNrQ==
X-Gm-Message-State: AOJu0YxAKlkWeoYh0WIlRpCR1AYezLcX8zaZrQuJkUPQ/4I1ndILTnp3
	QtPnlG1txyZNh/iPmbocoLQ=
X-Google-Smtp-Source: AGHT+IGCjmnMr0NRq+HC8R0lvRI/AD01AcPL7img9WmAVtzQAIwlJBk50oZM1JWLrtlKld0tmTb1iA==
X-Received: by 2002:a05:600c:2a41:b0:40c:32fa:4f45 with SMTP id x1-20020a05600c2a4100b0040c32fa4f45mr3510981wme.248.1702550128507;
        Thu, 14 Dec 2023 02:35:28 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:27 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency scaling drivers
Date: Thu, 14 Dec 2023 11:33:41 +0100
Message-Id: <20231214103342.30775-5-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Kconfig file for cpufreq scaling drivers that can handle RISC-V
CPUs. An entry is included for the Allwinner H6 cpufreq driver that
works with D1.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/Kconfig       |  4 ++++
 drivers/cpufreq/Kconfig.riscv | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 drivers/cpufreq/Kconfig.riscv

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 35efb53d5..4bef39fed 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -239,6 +239,10 @@ if PPC32 || PPC64
 source "drivers/cpufreq/Kconfig.powerpc"
 endif
 
+if RISCV
+source "drivers/cpufreq/Kconfig.riscv"
+endif
+
 if MIPS
 config BMIPS_CPUFREQ
 	tristate "BMIPS CPUfreq Driver"
diff --git a/drivers/cpufreq/Kconfig.riscv b/drivers/cpufreq/Kconfig.riscv
new file mode 100644
index 000000000..025c7c439
--- /dev/null
+++ b/drivers/cpufreq/Kconfig.riscv
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# RISC-V CPU Frequency scaling drivers
+#
+
+config ALLWINNER_SUN50I_CPUFREQ_NVMEM
+	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
+	depends on ARCH_SUNXI
+	depends on NVMEM_SUNXI_SID
+	select PM_OPP
+	help
+	  This adds the nvmem based CPUFreq driver for Allwinner
+	  H6/D1 SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sun50i-cpufreq-nvmem.
\ No newline at end of file
-- 
2.30.2

