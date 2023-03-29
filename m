Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0F52F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:53:01 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17e140619fdso16642072fac.11
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGkcT5R0a8JeH9pr+tvR6Dp+SnQFVzxwMvRKP+oraeM=;
        b=OnZoEFdqXXdNy1n8sMfZCQz++HZjhD2W/7A4GmXgnCsUaThJPgfGHzjNOU6F9TnZmL
         1m36eMmiTHsuK8QfGOw30Zc/MGmTqNJWrovCG1bEetL+RMkGWDuFbDwdgh9RMjCOuJcl
         cInX69B4x4Mlfu+RGHbjzgTUak0O62qWwQx8rppcuH9fWi+8A0XDzgsok0vkar7jVv1n
         CkoHrv+tUqk32sjjozxx3MsOWUPcQh74Yo2xVyccfgbY0iz41q9YOkPPtMtwqHotKsUk
         w4jUhVRoiDaQu8CwTLVEzOpUxbI4X8GzaYWVJHzoO7LGc1Szwsj+R5xLMhX3f3FBjKuy
         sRTg==
X-Gm-Message-State: AAQBX9cPf/8pBGjoIaYKKCvXQd4Dcz+65BgBa8gBn+bDiSJRlSSNGTFy
	dLW2th64WcpZPxS6SgOfPw==
X-Google-Smtp-Source: AKy350Zzh18IDSS9PRm/nm4uzfWROBk4i8K8e/GnmjZJixonIc4wyA8Ejs1S5hYlKdIJ6vpTCTaGZw==
X-Received: by 2002:a05:6870:1fcd:b0:172:5de5:785 with SMTP id gp13-20020a0568701fcd00b001725de50785mr13981327oac.6.1680105180656;
        Wed, 29 Mar 2023 08:53:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a056871030400b001762ce27f9asm11853490oag.23.2023.03.29.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:00 -0700 (PDT)
Received: (nullmailer pid 3198091 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:12 -0500
Subject: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
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

drivers/cpufreq/sun50i-cpufreq-nvmem.c:42:19: error: implicit declaration of function ‘get_cpu_device’; did you mean ‘get_device’? [-Werror=implicit-function-declaration]

As of_device.h is not otherwise needed, it can be replaced with of.h
(also implicitly included).

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 1583a370da39..4321d7bbe769 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -10,9 +10,10 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>

-- 
2.39.2

