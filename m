Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579FE3BB33
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL3znGMn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3333131e08dso8362499f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550152; x=1703154952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bSH5LSThTrH8jKZ5V0W7uU2b3lxsQ8a/FvDmGfwzlA=;
        b=KL3znGMnJ1fVpf0e8abFHErWqlyC602UoZC5SrZBHtJlAxcfU6WbhPaQa8Q0xyEshS
         hdo9XaL53ewitZDSj0+u0C6zn7uil74MV0Q76I25m3dyhng10yYAqdqOiJzhBqgm4gGv
         FnwHssTEgB8zk2pWwnfzBCD4Kje8yo6CE+tXlBRrXyO1I9vnPu9LhSIKbd/A8dxGShHD
         cKi2/4cvP1JIJsKWcRlG+DFCEWPWVwrBqRBL+wa1wQFcElwdMbbe+Gj9popOxTNFpaeG
         SLd3WbrmLqI3uN9+c5aqsmoyPBHgrWxhgWB2SP4IgNpS2ua9RgwYHUn+x70I2618TfFf
         EYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550152; x=1703154952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bSH5LSThTrH8jKZ5V0W7uU2b3lxsQ8a/FvDmGfwzlA=;
        b=cbpf9mGAIWOcjp+AiguuUBqqIR0MNc9OKDECz4EOR9A9nX6PLWXmZ92Wp8aZbvptCc
         JqEq34lqhbLF3wwcMCsg8jQZlfdyskBkSwipjpOv1yOtNlWOJcpzHXzqlQo9uOCOaksO
         3PhUxiwd3QSQyGIptN2m3kKnI2b8wBpLfGOkdmmEzOsZFp5CTno8bvHM8LQjeYoqBUKw
         Sb4WXFmrezdGVXgTx3JmFoer/Uq8OSE3jnNHqGr0b5L4WmWlQ2IRgWywDu0IxJoA0bLH
         0t9qxYfuClWEIyZ7j04PSU5mFWyYnt5UnsR5H2mYe04lDrVKgugCDR6rcHJR6aoInRQ7
         4XnQ==
X-Gm-Message-State: AOJu0YwEJP/wWxj9N+EV1V3hrjhJms06VmtIfhd7vpnuJlMajT7vH/2a
	iU/HjOP8K53QvAMfeV0e0lO+nO4xND6oew==
X-Google-Smtp-Source: AGHT+IEbki3k5FnEaNVZtWRBuhOkVOwOnKsRmJW5T9tQx+eZlX6USeTgoCxh9UtIGcxFBYXudVg1vw==
X-Received: by 2002:a5d:4bd2:0:b0:333:4940:dd1a with SMTP id l18-20020a5d4bd2000000b003334940dd1amr4977407wrt.23.1702550152438;
        Thu, 14 Dec 2023 02:35:52 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:51 -0800 (PST)
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
Subject: [PATCH 5/5] cpufreq: Make sun50i h6 cpufreq Kconfig option generic
Date: Thu, 14 Dec 2023 11:33:42 +0100
Message-Id: <20231214103342.30775-6-fusibrandon13@gmail.com>
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

Remove the 'ARM_' prefix from the Allwinner SUN50I cpufreq driver
Kconfig.arm option as that driver can support the D1, a RISC-V
chip.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/Kconfig.arm | 4 ++--
 drivers/cpufreq/Makefile    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index f91160689..510604781 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -29,14 +29,14 @@ config ACPI_CPPC_CPUFREQ_FIE
 
 	  If in doubt, say N.
 
-config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
+config ALLWINNER_SUN50I_CPUFREQ_NVMEM
 	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
 	depends on ARCH_SUNXI
 	depends on NVMEM_SUNXI_SID
 	select PM_OPP
 	help
 	  This adds the nvmem based CPUFreq driver for Allwinner
-	  h6 SoC.
+	  H6/D1 SoCs.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called sun50i-cpufreq-nvmem.
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 8d141c71b..110b676d2 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_ARM_SCMI_CPUFREQ)		+= scmi-cpufreq.o
 obj-$(CONFIG_ARM_SCPI_CPUFREQ)		+= scpi-cpufreq.o
 obj-$(CONFIG_ARM_SPEAR_CPUFREQ)		+= spear-cpufreq.o
 obj-$(CONFIG_ARM_STI_CPUFREQ)		+= sti-cpufreq.o
-obj-$(CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
+obj-$(CONFIG_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
 obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)	+= tegra20-cpufreq.o
 obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
 obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
-- 
2.30.2

