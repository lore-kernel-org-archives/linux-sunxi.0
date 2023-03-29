Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71F2F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:52:59 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id n6-20020a4abd06000000b0053b59893660so2510376oop.0
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaKQY99G3HY+F9cltbrOFgoelmJMxNBfQJcO0sLBgas=;
        b=H5CS54MO+8na6rl7ez7UAe+7DoyKE1mjd5SmuyVurAOzhFr7+MBrRxZ7oSjUz54YyY
         DVXGQk9O8H6xz00uumusyhS6N+Je4xbKCLNKUI3OBZFFhnvOXnlaPMNm4/JR2VFiyBIZ
         B6QzaajspJiRd0VM+aX4LlBQ4X7XdH05KoAOsTC/ieVokXZL8gy0dmC41I2lHVhpYcLE
         zh6AmMLQFD0TBPcduEuTeP30QQM2x3jyp/sKmB/t6Pua+MnDTncNUYAqPiFe58gwvlud
         k6Bci46BF9vF4xTSbj+UWtooh0FxxCRhh61tNQCWW5oB7fKOhr/P49/3Xsqc8LUAFnDg
         awEQ==
X-Gm-Message-State: AO0yUKWsidjphuRC6jvWHZyKr5LvsFXLuCizU8I3EN3RW+reeufIGdD7
	tRrSYA6JV1N/33b8bhuf6Q==
X-Google-Smtp-Source: AK7set/NHlve/5dROzrE0RjwFIfWzeZwZim5jtRZxJnjvVhB2968rp1PLl6KK6w8FucuWDAPMr2x9Q==
X-Received: by 2002:a4a:890d:0:b0:51a:6ea9:5053 with SMTP id f13-20020a4a890d000000b0051a6ea95053mr8240938ooi.9.1680105178376;
        Wed, 29 Mar 2023 08:52:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c192-20020a4a4fc9000000b0053b88b03e24sm8091146oob.18.2023.03.29.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:58 -0700 (PDT)
Received: (nullmailer pid 3198071 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:02 -0500
Subject: [PATCH 05/19] of: Drop unnecessary includes in headers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-5-581e2605fe47@kernel.org>
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

Drop unnecessary includes in DT headers. Some simply aren't needed and
some can be replaced with forward declarations.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h          | 5 ++---
 include/linux/of_device.h   | 3 ++-
 include/linux/of_platform.h | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 1f1e847a1c13..96979c67c5fa 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -16,13 +16,10 @@
 #include <linux/errno.h>
 #include <linux/kobject.h>
 #include <linux/mod_devicetable.h>
-#include <linux/topology.h>
-#include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/list.h>
 
 #include <asm/byteorder.h>
-#include <asm/errno.h>
 
 typedef u32 phandle;
 typedef u32 ihandle;
@@ -1517,6 +1514,8 @@ enum of_reconfig_change {
 	OF_RECONFIG_CHANGE_REMOVE,
 };
 
+struct notifier_block;
+
 #ifdef CONFIG_OF_DYNAMIC
 extern int of_reconfig_notifier_register(struct notifier_block *);
 extern int of_reconfig_notifier_unregister(struct notifier_block *);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 910951a22eb4..5cdafe19dc80 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -7,9 +7,10 @@
 #include <linux/of_platform.h> /* temporary until merge */
 
 #include <linux/of.h>
-#include <linux/mod_devicetable.h>
 
 struct device;
+struct of_device_id;
+struct kobj_uevent_env;
 
 #ifdef CONFIG_OF
 extern const struct of_device_id *of_match_device(
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 8ac5cb933dc3..d8045bcfc35e 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -6,12 +6,13 @@
  *			 <benh@kernel.crashing.org>
  */
 
-#include <linux/device.h>
 #include <linux/mod_devicetable.h>
-#include <linux/pm.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+struct device;
+struct of_device_id;
+
 /**
  * struct of_dev_auxdata - lookup table entry for device names & platform_data
  * @compatible: compatible value of node to match against node

-- 
2.39.2

