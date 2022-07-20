Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C933C26
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Jul 2022 15:16:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id e15so24195680edj.2
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Jul 2022 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJ8tIkSKOkkmif94JS5g10IqhgFBHH/VewA9Hfwkj3E=;
        b=b4X+6ADLKOKGU2dRMxpMAKC3N5cJNdhZuChd7j2wol/p07g6hZLQvv0fP6dkQFrDJE
         1msnYjyF+isxpx45RB3HO519e5SRnYQxLzBdVExGkZKLLUv8VgZ87GWtdoaVcWc7MPNL
         QEcwuKixToONXpvLxXpcrC+qfS1sM80UX8p/qONnzuIfPX8+cmUXyH1cjQ+Molyog0Uv
         A+NbrR9m6SfxZyEiH9FAIwOjqGN2hMbi/v+bpVJ6xhHAYLiHtbl5l1Ep6mrOFxzJfthj
         mVFyKNBNAV0cf3isYkAA1vyvSDf982Ij/tkgqqfXvOV8cVRU0QgjgjPweLNUy+Mbazoe
         jBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJ8tIkSKOkkmif94JS5g10IqhgFBHH/VewA9Hfwkj3E=;
        b=fWzc8j5f5Ubvfjl5O7YLiysvTP4XQ9ju2H/aMJepxK1PbPe/creM3BQyky2xJGdgYi
         9Txixes+d2zLo4/O0KlRgJ8u9dTuoGZdTIJmF4pv96ktIj9ZG5lgcEqm1uYYejOnzoeX
         JmKD+rNNBD1H4N8WPJuPE2UvTCFPcmroCvZ3cgKyugbNsJKwFLYDkrD9wWRNywU0CG8O
         qaDshGSZFCqJCyTkpFYd1yAElvXBdHEjNugey208xwLMLu+gBBGpgKMIA6XWLgd2zoKx
         ax7umNnwWAxi8miOjYzTV+pAD2c5xy9gU7ZggNR/N7lqr75wod931nb55Ey/iuY9LAo9
         JjRw==
X-Gm-Message-State: AJIora+OTNfVNX3UtOBAqfsU5pDMI7i8tjQnXtvKQ5iPbBOV3V0tdyBU
	OPjmkd3oo5ieD5XJHhba6hY=
X-Google-Smtp-Source: AGRyM1u1BR8LNjkBsnuM8bpiSzpEzLc1IbLV+0Vxsg+IzWfBDs4hk7RLLOpKehKwEO6sJHqOB4GkyA==
X-Received: by 2002:a05:6402:51d1:b0:43a:8154:babe with SMTP id r17-20020a05640251d100b0043a8154babemr52351088edd.26.1658330215841;
        Wed, 20 Jul 2022 08:16:55 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-13-89.dynamic.telemach.net. [86.58.13.89])
        by smtp.gmail.com with ESMTPSA id js1-20020a170906ca8100b00718d18a1860sm7942350ejb.61.2022.07.20.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:16:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org, Samuel Holland <samuel@sholland.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, andre.przywara@arm.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Fix H6 RTC clock definition
Date: Wed, 20 Jul 2022 17:16:54 +0200
Message-ID: <2118699.Icojqenx9y@jernej-laptop>
In-Reply-To: <a7a253a0-1cc3-61e4-ae59-fc299057974a@sholland.org>
References: <20220719183725.2605141-1-jernej.skrabec@gmail.com> <a7a253a0-1cc3-61e4-ae59-fc299057974a@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 20. julij 2022 ob 02:21:29 CEST je Samuel Holland napisal(a):
> On 7/19/22 1:37 PM, Jernej Skrabec wrote:
> > While RTC clock was added in H616 ccu_common list, it was not in H6
> > list. That caused invalid pointer dereference like this:
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 000000000000020c> 
> > Mem abort info:
> >   ESR = 0x96000004
> >   EC = 0x25: DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> >   FSC = 0x04: level 0 translation fault
> > 
> > Data abort info:
> >   ISV = 0, ISS = 0x00000004
> >   CM = 0, WnR = 0
> > 
> > user pgtable: 4k pages, 48-bit VAs, pgdp=000000004d574000
> > [000000000000020c] pgd=0000000000000000, p4d=0000000000000000
> > Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > CPU: 3 PID: 339 Comm: cat Tainted: G    B             5.18.0-rc1+ #1352
> > Hardware name: Tanix TX6 (DT)
> > pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : ccu_gate_is_enabled+0x48/0x74
> > lr : ccu_gate_is_enabled+0x40/0x74
> > sp : ffff80000c0b76d0
> > x29: ffff80000c0b76d0 x28: 00000000016e3600 x27: 0000000000000000
> > x26: 0000000000000000 x25: 0000000000000002 x24: ffff00000952fe08
> > x23: ffff800009611400 x22: ffff00000952fe79 x21: 0000000000000000
> > x20: 0000000000000001 x19: ffff80000aad6f08 x18: 0000000000000000
> > x17: 2d2d2d2d2d2d2d2d x16: 2d2d2d2d2d2d2d2d x15: 2d2d2d2d2d2d2d2d
> > x14: 0000000000000000 x13: 00000000f2f2f2f2 x12: ffff700001816e89
> > x11: 1ffff00001816e88 x10: ffff700001816e88 x9 : dfff800000000000
> > x8 : ffff80000c0b7447 x7 : 0000000000000001 x6 : ffff700001816e88
> > x5 : ffff80000c0b7440 x4 : 0000000000000001 x3 : ffff800008935c50
> > x2 : dfff800000000000 x1 : 0000000000000000 x0 : 000000000000020c
> > 
> > Call trace:
> >  ccu_gate_is_enabled+0x48/0x74
> >  clk_core_is_enabled+0x7c/0x1c0
> >  clk_summary_show_subtree+0x1dc/0x334
> >  clk_summary_show_subtree+0x250/0x334
> >  clk_summary_show_subtree+0x250/0x334
> >  clk_summary_show_subtree+0x250/0x334
> >  clk_summary_show_subtree+0x250/0x334
> >  clk_summary_show+0x90/0xdc
> >  seq_read_iter+0x248/0x6d4
> >  seq_read+0x17c/0x1fc
> >  full_proxy_read+0x90/0xf0
> >  vfs_read+0xdc/0x28c
> >  ksys_read+0xc8/0x174
> >  __arm64_sys_read+0x44/0x5c
> >  invoke_syscall+0x60/0x190
> >  el0_svc_common.constprop.0+0x7c/0x160
> >  do_el0_svc+0x38/0xa0
> >  el0_svc+0x68/0x160
> >  el0t_64_sync_handler+0x10c/0x140
> >  el0t_64_sync+0x18c/0x190
> > 
> > Code: d1006260 97e5c981 785e8260 8b0002a0 (b9400000)
> > ---[ end trace 0000000000000000 ]---
> > 
> > Fix that by adding rtc clock to H6 ccu_common list too.
> > 
> > Fixes: 38d321b61bda ("clk: sunxi-ng: h6-r: Add RTC gate clock")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> 
> This bug also got fixed in passing by e1c51d31befc ("clk: sunxi-ng:
> Deduplicate ccu_clks arrays"), but that won't land until 5.20.

Argh, good catch. I will send your patch as fix then, otherwise there will be 
issues during merging.

Best regards,
Jernej

> 
> Regards,
> Samuel
> 
> > ---
> > 
> >  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> > b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c index 29a8c710ae06..b7962e5149a5
> > 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> > @@ -138,6 +138,7 @@ static struct ccu_common *sun50i_h6_r_ccu_clks[] = {
> > 
> >  	&r_apb2_rsb_clk.common,
> >  	&r_apb1_ir_clk.common,
> >  	&r_apb1_w1_clk.common,
> > 
> > +	&r_apb1_rtc_clk.common,
> > 
> >  	&ir_clk.common,
> >  	&w1_clk.common,
> >  
> >  };




