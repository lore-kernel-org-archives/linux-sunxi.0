Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C42F4E
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:53:28 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id b19so11914888oib.7
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=022ntgbo/qozcpOEnF6DlWHlLfWcIn+6VTfzUh5A9FY=;
        b=kgkjnK+SC4wIi7Itfz8ISGT+z3nq2MUcbIhNVAy0RdLtA8ahjXUK+V55ruw8Lr+Fjk
         NxSVzrjPay7qpRLM2/HW3HUsjZqqQCoFkl9UWJsiwcT3iVDopIfolu7cTZ5jIbQy4pe7
         GyTlm8fIrcOoUCTCXytbTHUMR/w9YK8kC+YeY6FgERLc1t+Q1WS7iED8j3fXgmI3Ecan
         UyXsyOmuXGyrrEvWM1cSqM/Kh4P8NPZViDpNM9XhDHoTMgW1XCCzVAFAvngDeDteatH2
         zjqiFtFf7mTLxNmwtTfDI5ABTLj/bwWecbydxPNvMSZT1AQrI7X8RVq0ZzUQM5migXQu
         /JdA==
X-Gm-Message-State: AO0yUKUk/Y15MtSRT6hH/O9BxwYHckIlYZ4CaPyCxwQCOc2YYLz6hdYB
	Ppocc0slq9lOP6qjjgju5w==
X-Google-Smtp-Source: AK7set+mgwqrtp3sj8LCfLB0ZJyIWcTnGcbFer41ylAZRGD0ZYDF+G/GFDHWLU149fBQcrWXcPEKPQ==
X-Received: by 2002:a05:6808:616:b0:386:db46:f6fb with SMTP id y22-20020a056808061600b00386db46f6fbmr8106850oih.17.1680105207535;
        Wed, 29 Mar 2023 08:53:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l8-20020a056808020800b003874631e249sm8002092oie.36.2023.03.29.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:26 -0700 (PDT)
Received: (nullmailer pid 3198085 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:09 -0500
Subject: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove
 of_device.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
X-Mailer: b4 0.13-dev

Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
implicitly including other includes, and is no longer needed. Adjust the
include files with what was implicitly included by of_device.h (cpu.h and
of.h) and drop including of_device.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/thermal/cpuidle_cooling.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_cooling.c
index 4f41102e8b16..6f6daead485e 100644
--- a/drivers/thermal/cpuidle_cooling.c
+++ b/drivers/thermal/cpuidle_cooling.c
@@ -7,12 +7,13 @@
  */
 #define pr_fmt(fmt) "cpuidle cooling: " fmt
 
+#include <linux/cpu.h>
 #include <linux/cpu_cooling.h>
 #include <linux/cpuidle.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/idle_inject.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 

-- 
2.39.2

