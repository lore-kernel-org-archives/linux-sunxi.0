Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E42F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:52:52 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id g21-20020a4ad855000000b0053e563c2f72so1297288oov.6
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUvdSWvlelGy1WbXkwFcUNCtjmz5cL2Z3yoJim8fyN4=;
        b=dALS9xprj6HsdgJbG8zwQYZHkTLKYTSjFexwL8yJTr4MbsGD3kCClfhP6Mu3VyA5Cx
         QDRAfpMr53hBjY+0Xh75f58CaAhIqk4PvGpw8nLUnw5tlh1ByXaKp911pjUa589J78AY
         Y6AQ5gt1g7UZ5k1Ow9jRAzLC6m7iX0q6Pza0UgVZeTLgztB7M6ou9IO0TrfcPq97ZTyJ
         5NMI7Oz0HIaVhRYNRePwOShGFXy0V77iDwIPwKDOtFja00FunpaB1lFFpguX/HO1RdJx
         90KkzzBY+5MI8UZqr8vhF5rFrmlfb7yEY6IBgl++twrt+NChQD1TeWgS+mqivykuRlwo
         4c+w==
X-Gm-Message-State: AO0yUKW/0hAuaGMDGXlnZ6I7u1SSFw/6ITLIdpGe274ziJ4f4hm361cg
	jI+bJSrFr5tvNSwQB0zlwg==
X-Google-Smtp-Source: AK7set8fZmNpueyLlqRjeVxsIcrGmIm7sG0omBAJB7zOEj3TTntZfmKbMnjZiGlZRcAnzZ6+ha8iMg==
X-Received: by 2002:a4a:4191:0:b0:538:4d29:30cb with SMTP id x139-20020a4a4191000000b005384d2930cbmr9034039ooa.8.1680105171818;
        Wed, 29 Mar 2023 08:52:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 129-20020a4a1887000000b005252d376caesm13850273ooo.22.2023.03.29.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:51 -0700 (PDT)
Received: (nullmailer pid 3198095 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:14 -0500
Subject: [PATCH 17/19] irqchip: loongson-eiointc: Add explicit include for
 cpuhotplug.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-17-581e2605fe47@kernel.org>
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

Removing the include of cpu.h from of_device.h causes an error:

drivers/irqchip/irq-loongson-eiointc.c:420:9: error: implicit declaration of function 'cpuhp_setup_state_nocalls' [-Werror=implicit-function-declaration]

This driver doesn't even use DT, so all the DT includes can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/irqchip/irq-loongson-eiointc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index d15fd38c1756..fd9d87f1470e 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -7,16 +7,13 @@
 
 #define pr_fmt(fmt) "eiointc: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/syscore_ops.h>
 
 #define EIOINTC_REG_NODEMAP	0x14a0

-- 
2.39.2

