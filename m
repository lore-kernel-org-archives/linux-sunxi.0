Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6072F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:53:03 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id w133so11926451oib.1
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxkTC00mmtvkJ/ocm+Trr4LHDuiGbRgef51Eh65eFno=;
        b=HEjUz2Gm4L2QJd/mMEbxTh851psYMH4z9ffTRmTHJU2bs4VIPN4f5HjOy2BSYmZrSp
         qlGQv5tQXoBcvKLhddEcEmDsvQfzYHOwyAag4+isH9zjWtZDQnUvTVqpWkjP3oawirEb
         GaHgLSEVWhzcvKucup/WLuYGZEm4Z+4P8LcJ2f7Q+kMuPYMyD1wL7748+Gi0in0Ozo03
         abzVxb8PWLmGyvpnLjXUR26K6kHIM8n92FqAbRCLCN7T+BfpeyDP/KpyD0j6UumPy0cm
         832Aex2kplh11NImPdxnTSfsvVb0eKxW4E7CWOdCxgn2ZUFFpPmkwZF3KQdt9UEB3c/W
         49Kg==
X-Gm-Message-State: AO0yUKUx0cm1IB1CUIc39OhyQYyhKIYrRgARuEASRDkYAaAuzZ1hfw1F
	pu0D/f6t4sbS5Wudp1dL1A==
X-Google-Smtp-Source: AK7set/XHs0DeHUv3FR5klH7bLctWLDiPHbV4Bgynq9MiBxHYJ127vn5iRHwUkAWb6rjGdajk82w8Q==
X-Received: by 2002:a05:6808:1445:b0:387:715e:56b8 with SMTP id x5-20020a056808144500b00387715e56b8mr10764982oiv.56.1680105182676;
        Wed, 29 Mar 2023 08:53:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p184-20020acad8c1000000b003896e31867esm228723oig.49.2023.03.29.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:02 -0700 (PDT)
Received: (nullmailer pid 3198083 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:08 -0500
Subject: [PATCH 11/19] clocksource: ingenic: Add explicit include for
 cpuhotplug.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
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

Removing include of cpu.h from of_device.h (included by of_platform.h)
causes an error in ingenic-timer:

drivers/clocksource/ingenic-timer.c: In function ‘ingenic_tcu_init’:
drivers/clocksource/ingenic-timer.c:338:15: error: implicit declaration of function ‘cpuhp_setup_state’

The of_platform.h header is not necessary either, so it and of_address.h
can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/clocksource/ingenic-timer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 24ed0f1f089b..089ce64b1c3f 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -9,13 +9,12 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
+#include <linux/cpuhotplug.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/ingenic-tcu.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>

-- 
2.39.2

