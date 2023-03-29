Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD582F4E
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:53:26 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id h22-20020a4ad756000000b0053e4ab58fb5so1449704oot.4
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxrilhvfwDlef/A2YTUefG5k1p916jMGPiiHrDKkFR0=;
        b=Tz/MdZQ1H6VcDYcipnTgy05vHvHKcuneCZKh0lLZeEW5hzx+0ab8vcdwdTUaX2Lb7n
         gji5Bs2NsoLf63wOFNxiLpUWzRm31NxIEH+EVMMXkG7ix9x0+n/cioG1nX3ONFbPjTOC
         VxYRIqP/IAK4sdVpNrP5Zgdgi0MzmqdwYJ5mbJ5BwAD30lNoRRVGi/1Czf5B30JfUd1L
         NxZFwsJ4UM1yTpYfP4mgFLOz55zHtUSX8wLo012cwPm+c9YxcEjwV/R9kqWNzpuX6R+3
         Vpj8HEN24x3PHeGOe83crrqTFLw/cH/1nI6FC9oXsZhNLpu7Xu/Q+Do1zuUvTE9t2Wgm
         Zm/g==
X-Gm-Message-State: AO0yUKXITDYg59Dmsw9JzdusjvCUVg/rpBeqWKc7Dv1vQ4aRuvJrNLHp
	Pk5nl3gOYuuiDPj5rqFD4Q==
X-Google-Smtp-Source: AK7set/IvKP58b96RyfRxVRB8Yjm2uXbhHwCU35QLNRLqkqctfQoMFiFz1/Ijy3GHwDVb/O3xlHYvQ==
X-Received: by 2002:a4a:52d4:0:b0:53b:8b5:48d0 with SMTP id d203-20020a4a52d4000000b0053b08b548d0mr9782179oob.1.1680105205203;
        Wed, 29 Mar 2023 08:53:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 4-20020a4a1704000000b00524faf3d2d7sm13940444ooe.41.2023.03.29.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:24 -0700 (PDT)
Received: (nullmailer pid 3198097 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:15 -0500
Subject: [PATCH 18/19] OPP: Adjust includes to remove of_device.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
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
 drivers/opp/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index e55c6095adf0..63b126c6215e 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -13,7 +13,7 @@
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/device.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/export.h>

-- 
2.39.2

