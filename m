Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B02F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:52:55 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id r84so10635238oih.11
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yItqnZ9vRLGQesakQq7xospJXeaAueRctcAXfNX28w=;
        b=dp5E/hzuDrv8C+YRoxu80yY5oTceOQZXc8FKFYv8gfKS2sP50mNS/UmiaqKPJ/+x1q
         5gca39DzcBs71d+UXv07B8GDKmzdoGJXGh/DSsUAOPpQO5DPrEXZ/qlWeIqBBIWrGwQS
         QBx6OjAYK+ak6/zGXrda+/LHPleR44yvoBjuf9HBAA9f/OfzuDWoeJq1YLtOKRRAdLam
         HZjq+CXtsLrLL/5XdhVxNf19R0aLSpwXww7NJAic4Gq2loIvBKkRk9Jh0uKi6n/JgSxV
         Od1w552IIf9vmMd6MNTEimUykwqgjBEyyJytwEt7+yECbXAwpUuRHon/0cCiFv5/tEaC
         YKiw==
X-Gm-Message-State: AO0yUKWwT+3jhFSHyiV6fNgr341dIPhOC/WTKvFzhRUMp2n7YlVKvvA8
	PgxFeV6lD6fk+ppJ08V9xg==
X-Google-Smtp-Source: AK7set8VenL+CVecLJkZQ+2YD6HECaZWNdDHKrwGAWt0Tn+DIRoRNNZ1eYx2LdRkWm+8wMeNY2nxyA==
X-Received: by 2002:aca:1c07:0:b0:386:9dba:4571 with SMTP id c7-20020aca1c07000000b003869dba4571mr8390718oic.25.1680105174043;
        Wed, 29 Mar 2023 08:52:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q132-20020acac08a000000b0037fa035f4f3sm13719284oif.53.2023.03.29.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:53 -0700 (PDT)
Received: (nullmailer pid 3198099 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:16 -0500
Subject: [PATCH 19/19] of: Drop cpu.h include from of_device.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-19-581e2605fe47@kernel.org>
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

Now that all users which had an implicit dependency on cpu.h have been
fixed. the cpu.h include can be dropped from of_device.h

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of_device.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 5cdafe19dc80..7ac9a8ae9c80 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -2,7 +2,6 @@
 #ifndef _LINUX_OF_DEVICE_H
 #define _LINUX_OF_DEVICE_H
 
-#include <linux/cpu.h>
 #include <linux/platform_device.h>
 #include <linux/of_platform.h> /* temporary until merge */
 

-- 
2.39.2

