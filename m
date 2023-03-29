Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D32F4E
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:53:23 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id d22-20020a9d5e16000000b0069b5252ced7so8421683oti.13
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcRNyMomlVIyDJBO4v13lmumWoZCHsVn17zoo+wPdkk=;
        b=znuq0Il2nGpZrKCYIAF1jxNTRtHtnqNrhuW4ly0Aq6eSx6O93Z88yKc16VRD3MqeGv
         JJHKgInSwirqnkcUNUZ0bsIZ2/OBmYOv4Men3tLCJWW05GkuHJtL6bxzUF28/gyJBEPN
         zD+CtsKOsMqPIVtdLJeiq9WHFX816UkgVKZJrfsDHuKvKvvjSst54Ze0KPAUvwJQ1kVU
         N38ynQaIx6s5IpOhci9tTHqvHNTNkcdd6pvavV+tafUNXXq1S8s4Kf2pvYA8IG3meUgV
         o4Vb0n6bWKQ81PLcdC9HhY3DJJzL8Nyf0G6mR0sVVaxbZfCDtC6VWXbR9Ks8w6B1zQGx
         AMZg==
X-Gm-Message-State: AO0yUKUaee6fS/oL/cBItRqFGajewHniQ+AVpmh6xaEaScLrwCEJYWSm
	o+vDyjBcqWv4AijSJee3G7UCfRvndQ==
X-Google-Smtp-Source: AK7set+G4RUI7e7LVlBDXGQ8p8x17CahM2R0t8c+RybdcRc83FcjeXtVKZHsxX3oO+Yqeus+IJNu+w==
X-Received: by 2002:a05:6830:124e:b0:68e:da51:2cb2 with SMTP id s14-20020a056830124e00b0068eda512cb2mr10233310otp.37.1680105202916;
        Wed, 29 Mar 2023 08:53:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y26-20020a056830209a00b006a06e7972ebsm6242943otq.38.2023.03.29.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:22 -0700 (PDT)
Received: (nullmailer pid 3198087 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:10 -0500
Subject: [PATCH 13/19] soc: mediatek: mtk-svs: Add explicit include for
 cpu.h
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-13-581e2605fe47@kernel.org>
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

Removing the include of cpu.h from of_device.h (included by
of_platform.h) causes an error:

drivers/soc/mediatek/mtk-svs.c:2134:41: error: implicit declaration of function 'get_cpu_device'; did you mean 'get_swap_device'? [-Werror=implicit-function-declaration]

of_platform.h is still needed for of_find_device_by_node().

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/soc/mediatek/mtk-svs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f26eb2f637d5..1b7579a5bec6 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -7,6 +7,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/cpu.h>
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>

-- 
2.39.2

