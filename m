Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D587E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 11:30:33 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id b12so11545881plg.4
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jq3lZaJRWmUC1+/YH0KaBe1qk/+UKzuPPxjecR22D8I=;
        b=FoikZIM5R9luRPxIlH8rApfm/qpfKWJbs1ksYjkd4SJBe3V7l6HI0fF1ZWVFSGCxJ7
         ndio9iXLaNi7fKs5F/5KAULIbINTFEznMBMLZ8gYetFUOQ7ajvbAeCtjFzvp/q4uOnsB
         R26i3dJfeRkfqktQWFGVNsM9Opm9s8xd8ZDnk5jcxIkXouauxKutvc0bDNAi8zuUhPsE
         mTGXQu29XlCN9Ehfw7Prztx3JeO4GQ44LWZzH5stAgHImRd5/On3vpCHtdYjz95pSdS4
         fbZvEFCgGHKpEbbFdFDJaHMkw+TtFu43dgkcUYROO+86i9QVwRvi9x5r4pG7FyUFmbfe
         ApIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jq3lZaJRWmUC1+/YH0KaBe1qk/+UKzuPPxjecR22D8I=;
        b=cf4Te1Z07rrlJW2sPp+Zty4xXqkFREODHOC7/QcFY7xuf5uSWbv/jSKWyoAAg4zZPc
         jg2fP1E+l4OsBTEnAytnA8idF5Kmu1f8ftqMbjj190IfsfSLJRU5BPyI1lCiwxnaQAqM
         +m3BSK4tpdy6ADsQKFSc28N91EbbU9rl3XdzFzX9ZjOIil2BH3Ym7Xgkyy+CH3BjQ6Xz
         a6mX+ckmQa58Z4YLJ8klD6qzGESON1oSyohyWPd4vR+85gaM1k364cB8Kerxf8XtaHgB
         5WExu1heEQ1+Jyb2ngYoW4bx6qmxDkl4uIXSlerbLNva+7eSaqFYsWICiRfznagYjsEC
         cNwg==
X-Gm-Message-State: AOAM530L3O4desS3jlRvXjbS3Sfs7YdjqxYDAvQWYmmrIri8NYL4kv4e
	EAZu/nVWtZTkyt7IxO6Zeok=
X-Google-Smtp-Source: ABdhPJzOBPsNT1iiha9Pn7HKouA6c3xrQ/DXkWrAOftr5V7RJf9IPtWYLNYqi8A9p0/ZbHO348dWhw==
X-Received: by 2002:a17:902:b406:b0:14f:bb35:95ab with SMTP id x6-20020a170902b40600b0014fbb3595abmr17610765plr.140.1650886232444;
        Mon, 25 Apr 2022 04:30:32 -0700 (PDT)
Received: from ip-172-31-12-67.us-west-1.compute.internal (ec2-54-241-4-221.us-west-1.compute.amazonaws.com. [54.241.4.221])
        by smtp.gmail.com with ESMTPSA id i11-20020a654d0b000000b0039d82c3e68csm9819072pgt.55.2022.04.25.04.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:30:31 -0700 (PDT)
From: Xiaobing Luo <luoxiaobing0926@gmail.com>
To: tiny.windzz@gmail.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaobing Luo <luoxiaobing0926@gmail.com>
Subject: [PATCH v3] cpufreq: fix memory leak in sun50i_cpufreq_nvmem_probe
Date: Mon, 25 Apr 2022 11:30:09 +0000
Message-Id: <20220425113009.2182485-1-luoxiaobing0926@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

--------------------------------------------
unreferenced object 0xffff000010742a00 (size 128):
  comm "swapper/0", pid 1, jiffies 4294902015 (age 1187.652s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000b4dfebaa>] __kmalloc+0x338/0x474
    [<00000000d6e716db>] sun50i_cpufreq_nvmem_probe+0xc4/0x36c
    [<000000007d6082a0>] platform_probe+0x98/0x11c
    [<00000000c990f549>] really_probe+0x234/0x5a0
    [<000000002d9fecc6>] __driver_probe_device+0x194/0x224
    [<00000000cf0b94fa>] driver_probe_device+0x64/0x13c
    [<00000000f238e4cf>] __device_attach_driver+0xf8/0x180
    [<000000006720e418>] bus_for_each_drv+0xf8/0x160
    [<00000000df4f14f6>] __device_attach+0x174/0x29c
    [<00000000782002fb>] device_initial_probe+0x20/0x30
    [<00000000c2681b06>] bus_probe_device+0xfc/0x110
    [<00000000964cf3bd>] device_add+0x5f0/0xcd0
    [<000000004b9264e3>] platform_device_add+0x198/0x390
    [<00000000fa82a9d0>] platform_device_register_full+0x178/0x210
    [<000000009a5daf13>] sun50i_cpufreq_init+0xf8/0x168
    [<000000000377cc7c>] do_one_initcall+0xe4/0x570
--------------------------------------------

if sun50i_cpufreq_get_efuse failed, then opp_tables leak.

Fixes: f328584f7bff ("cpufreq: Add sun50i nvmem based CPU scaling driver")
Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 2deed8d8773f..75e1bf3a08f7 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -98,8 +98,10 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = sun50i_cpufreq_get_efuse(&speed);
-	if (ret)
+	if (ret) {
+		kfree(opp_tables);
 		return ret;
+	}
 
 	snprintf(name, MAX_NAME_LEN, "speed%d", speed);
 
-- 
2.36.0

