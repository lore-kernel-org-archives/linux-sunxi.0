Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB086EB
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 20:54:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id u6so16706482eda.12
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JLpwwEXvedQcLSuNA4DzktxLoXCkv7XPZtcpdI7RP1M=;
        b=TGpe97p6Ce7FLnyRPQfqVNbuhRn0U4mG9fpqb40Yzo53H6tcokSazCrUQPQbEByrLe
         /PfiR7WiMk00weE+lYWoc+McibIlOxJVSZ+Nu6G1yZ22IlG5b03qd7VUkZroNnEDH6AD
         zGKtP4ruHG0xQKGPaEnKJ0SV3H4kVPdobxnNo21OL8pIfwwR3nkJZts8BgGCVzrDHU3F
         /nPdp8ljRlD07KEwQBEnsnjk7sb3Qx4Y922k9fBaDNmOx2gHKy7PtErKhRm8Ku9WqJa9
         3YYJZNJmMARtTKW3nOTvO1V9HFKnVklxulvKFZhAspfSEEdmI9fnanw/0NUrSBHb0J0q
         HUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JLpwwEXvedQcLSuNA4DzktxLoXCkv7XPZtcpdI7RP1M=;
        b=MlueJfH031DT6rHZ6xizbm8yVW0UTb84t1BQ/OAX+rKxEQJmjh5W4cN2WmSsK3YF5z
         FcX8YSPBz/jCZTIgQqk6ynXN0x5JCG97b/orOADvm1Mn+uEsq7yMmzh5wUm5Rv1krahK
         zgbGVu5liMyWjUKNSz6yA8YsNQn0ikazmoJDiukI1pLxp/Xc9jubu6F95ZmB5fNVdhUs
         uxaCc+a+MYx4mhYOlHYXeI6sRhjd7lJjyyjAcs8yh/h92dTR1WmoFqH77+U/JNxIf1bQ
         nAM29U5sFmQdrVlUPKPDnRELCSku11CDf+U3vsLXsIDR9ph2MhrUj8jC3oIzMRPZq/eg
         lADw==
X-Gm-Message-State: ACgBeo1ugc6EoRw6SaQxT7fk4ikgysXkNOzw5nD3ThS/hmt36IB32EOG
	q+gGaALGKWqUDGiWwWeSYRw=
X-Google-Smtp-Source: AA6agR6zqYzji20rB720Vdttu81EUOPdjApp4KPqjPFgABTZQ++qgs+Qo7iGaU5DZHd3gQAlFxx9Nw==
X-Received: by 2002:a05:6402:1655:b0:44e:b208:746d with SMTP id s21-20020a056402165500b0044eb208746dmr374656edx.229.1662497678203;
        Tue, 06 Sep 2022 13:54:38 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id my44-20020a1709065a6c00b0073dc897e040sm7291990ejc.51.2022.09.06.13.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:54:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, qianfanguijin@163.com
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Evgeny Boger <boger@wirenboard.com>, Andre Przywara <andre.przywara@arm.com>, qianfan Zhao <qianfanguijin@163.com>
Subject: Re: [PATCH] net: allwinner: emac: Fix double spinlock in emac_timeout
Date: Tue, 06 Sep 2022 22:54:36 +0200
Message-ID: <8150758.NyiUUSuA9g@kista>
In-Reply-To: <20220830033258.8105-1-qianfanguijin@163.com>
References: <20220830033258.8105-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 30. avgust 2022 ob 05:32:58 CEST je qianfanguijin@163.com 
napisal(a):
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> The system will dead due to double lock if sometings trigger
> emac_timeout, next is the kernel logs:

Maybe something like this:
"emac_timeout() callback acquires lock and so does emac_init_device(), which 
called inside lock protected region. This hangs the system and produces 
following warning:"

> 
> WARNING: CPU: 2 PID: 0 at net/sched/sch_generic.c:478
> dev_watchdog+0x2e4/0x2e8
> NETDEV WATCHDOG: FE0 (sun4i-emac): transmit queue 0 timed out
> Modules linked in:
> CPU: 2 PID: 0 Comm: swapper/2 Tainted: G W 5.15.0-00047-g0848e4aeb313
> Hardware name: Wisdom T3 based CCT Family
> [<c010f740>] (unwind_backtrace) from [<c010b744>] (show_stack+0x10/0x14)
> [<c010b744>] (show_stack) from [<c0a4d978>] (dump_stack_lvl+0x40/0x4c)
> [<c0a4d978>] (dump_stack_lvl) from [<c0120734>] (__warn+0x104/0x108)
> [<c0120734>] (__warn) from [<c01207b0>] (warn_slowpath_fmt+0x78/0xbc)
> [<c01207b0>] (warn_slowpath_fmt) from [<c0898a54>]
> (dev_watchdog+0x2e4/0x2e8)
> [<c0898a54>] (dev_watchdog) from [<c019a888>] (call_timer_fn+0x3c/0x178)
> [<c019a888>] (call_timer_fn) from [<c019bddc>]
> (run_timer_softirq+0x540/0x624)
> [<c019bddc>] (run_timer_softirq) from [<c0101298>]
> (__do_softirq+0x130/0x3bc)
> [<c0101298>] (__do_softirq) from [<c0127ea0>] (irq_exit+0xbc/0x100)
> [<c0127ea0>] (irq_exit) from [<c017e514>] (handle_domain_irq+0x60/0x78)
> [<c017e514>] (handle_domain_irq) from [<c05a6130>]
> (gic_handle_irq+0x7c/0x90)
> [<c05a6130>] (gic_handle_irq) from [<c0100afc>] (__irq_svc+0x5c/0x78)
> Exception stack(0xc14f3f70 to 0xc14f3fb8)
> 3f60:                                     0003475c 00000000 00000001
> c01188a0
> 3f80: c107b200 c0f06b4c c0f06b90 00000004 c1079ff8 c0c62774 00000000
> 00000000
> 3fa0: c10b2198 c14f3fc0 c0107fcc c0107fd0 60030013 ffffffff
> [<c0100afc>] (__irq_svc) from [<c0107fd0>] (arch_cpu_idle+0x38/0x3c)
> [<c0107fd0>] (arch_cpu_idle) from [<c0a57f38>]
> (default_idle_call+0x3c/0xcc)
> [<c0a57f38>] (default_idle_call) from [<c0157258>] (do_idle+0xdc/0x13c)
> [<c0157258>] (do_idle) from [<c01575a4>] (cpu_startup_entry+0x18/0x1c)
> [<c01575a4>] (cpu_startup_entry) from [<401015d0>] (0x401015d0)
> ---[ end trace a70942a1265338f1 ]---
> rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> rcu: \x092-...0: (1 GPs behind) idle=75d/0/0x1 softirq=8288/8289 fqs=931
> \x09(detected by 0, t=2102 jiffies, g=13485, q=1635)
> Sending NMI from CPU 0 to CPUs 2:
> spi_master spi2: spi2.1: timeout transferring 4 bytes@100000Hz for
> 110(100)ms
> spidev spi2.1: SPI transfer failed: -110
> 
> Fix it.
> 

You should add Fixes tag here.

> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c
> b/drivers/net/ethernet/allwinner/sun4i-emac.c index
> 49759deeed8e..d49c2c18f39d 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -378,14 +378,11 @@ static int emac_set_mac_address(struct net_device
> *dev, void *p) }
> 
>  /* Initialize emac board */
> -static void emac_init_device(struct net_device *dev)
> +static void emac_init_device_without_lock(struct net_device *dev)

Maybe "emac_init_device_no_lock"?  _no_lock suffix is often used in such cases.

Best regards,
Jernej

>  {
>  	struct emac_board_info *db = netdev_priv(dev);
> -	unsigned long flags;
>  	unsigned int reg_val;
> 
> -	spin_lock_irqsave(&db->lock, flags);
> -
>  	emac_update_speed(dev);
>  	emac_update_duplex(dev);
> 
> @@ -398,7 +395,15 @@ static void emac_init_device(struct net_device *dev)
>  	reg_val = readl(db->membase + EMAC_INT_CTL_REG);
>  	reg_val |= (0xf << 0) | (0x01 << 8);
>  	writel(reg_val, db->membase + EMAC_INT_CTL_REG);
> +}
> +
> +static void emac_init_device(struct net_device *dev)
> +{
> +	struct emac_board_info *db = netdev_priv(dev);
> +	unsigned long flags;
> 
> +	spin_lock_irqsave(&db->lock, flags);
> +	emac_init_device_without_lock(dev);
>  	spin_unlock_irqrestore(&db->lock, flags);
>  }
> 
> @@ -416,7 +421,7 @@ static void emac_timeout(struct net_device *dev,
> unsigned int txqueue)
> 
>  	netif_stop_queue(dev);
>  	emac_reset(db);
> -	emac_init_device(dev);
> +	emac_init_device_without_lock(dev);
>  	/* We can accept TX packets again */
>  	netif_trans_update(dev);
>  	netif_wake_queue(dev);
> --
> 2.25.1


