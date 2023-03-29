Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73C2F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:53:19 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id d22-20020a9d5e16000000b0069b5252ced7so8421590oti.13
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avhGoClAu60FK+4OH3axA1tPVPlExeBA2pd36OTtZtE=;
        b=rO4/hL7fu8T+9lfIiQPexlJjLMIO2PPQUAvsZPFSj7UgXyP2WDCYIFX7gjjMGE072r
         LRqXmQn8NdhMIPWPXDxbUQYt35Bc9WJfnMFdCZbnUxSRou+g5THnTg/F72ihIwF8fzPg
         uxZIdf4AILmwfYF7JaO3jfsBsLGjv3vF8p6t1GX596HhJWh1JFrJ66GvqIBl7ahC2fKP
         w/trH0X8/gSaSv5i0EZLxrLUNCRrfZApIFwkXgTLYMH7GmtRqqXW8v22/wraiTCNCIDp
         Ml6oc+1gj2+U+G6sv+zYx6ZM6237BJCv0Qwnea90glqYYxvtihLapPK3dyvd8VNN0T45
         r90A==
X-Gm-Message-State: AO0yUKWdnhuvSW9sGtnA2i+x1d+TcaDDT8a6gRWRbdNMpZgoSRyrDPSm
	bLoCzRtF7h66k1bQUZ332w==
X-Google-Smtp-Source: AK7set+ZOHjqyI4LzxgjdsE15Cx5pZk+wokjAG0VqGy5aA+Dncm2MiNsSACjR/bJ9bGa9YBaDIKZXg==
X-Received: by 2002:a9d:67c6:0:b0:697:ef66:e7f4 with SMTP id c6-20020a9d67c6000000b00697ef66e7f4mr9233955otn.24.1680105198532;
        Wed, 29 Mar 2023 08:53:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s14-20020a9d758e000000b006a154373578sm2278866otk.39.2023.03.29.08.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:18 -0700 (PDT)
Received: (nullmailer pid 3198079 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:06 -0500
Subject: [PATCH 09/19] riscv: cacheinfo: Adjust includes to remove
 of_device.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-9-581e2605fe47@kernel.org>
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
 arch/riscv/kernel/cacheinfo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 3a13113f1b29..e3829d2de5d9 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -5,7 +5,6 @@
 
 #include <linux/cpu.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <asm/cacheinfo.h>
 
 static struct riscv_cacheinfo_ops *rv_cache_ops;

-- 
2.39.2

