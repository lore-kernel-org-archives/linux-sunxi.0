Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC67E3
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 01:18:20 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 78so251229pgb.8
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 17:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uJPSNJQixp4KAOx24VmNpjycyBGpOeUyZOarpZS7S9U=;
        b=mtGEkTUBd3PkBENBsIIJa2h7HAzUqi1oI0DkMcYz87M6/9lpmWbhXuhVZh6dg6e+Mw
         NJW1uHEdfulnEGemuKItE4sXphmHopfkzq0dooBurE1hqVBuUJqWLAQCzNi1Rhq5tar9
         hWQPLctc8WnjNoszIQHQAMd473M+XvmAUDs6XGl8qeOHLPY7Urs+tLWJ2Rb0YjSHLQwM
         /7f05Pjdamcl01nczdAgA+fzavPlGbKZmQkIXnrT16AcTGr1mFx8V/XbJXQ5OVk0O6ie
         Xm4os+8KaNyMvy8nTiN6RJc3Gjm5NKkaH1KYKTv9QuXO6ToT1EcYxgJNRpigyhi24HxD
         hehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJPSNJQixp4KAOx24VmNpjycyBGpOeUyZOarpZS7S9U=;
        b=Q9TrT+FUVnRT2Q+DJBSm+UiLpnViKavx//jcHIb6udCzHUasyrcBiEiMLczZ59goqW
         WM7bA5VpNUTz31kTxkndycVgZbf+FvfEAfwrVyaKJ+XcrkG3I9rEpEtRh/kq1XcvwcwY
         GZdVHD1PgRox6pRduAPi7nTmJvi3rYmXWS3HP/2J0fc+ejcxpnDz2A9RSSJIn/zPHCOt
         nDwWIJQZEU+Ku4cQFyJsPdp/QdlO5dUet89A4RuQq/sia5yIv+cjMsT3lN85KIKjZALG
         IHi3VNU2xf4y33g4jWERBYT6RWtXKvWGtGPDDNP1elXsQ1hxd9mdPRMtRPQ/D94weVQi
         118Q==
X-Gm-Message-State: AFqh2kpg7bXPo3CvyXhuUiJ9g8xaxbIbFujezHhJHzoK2UM8rmr6vybL
	ZZNU+ICF03wegZQeYmLDhTBwOo3/tFiLQD+J4tHXwC376rtxpQ==
X-Google-Smtp-Source: AMrXdXuW6Al+2ffUvJEduAUleH/WeANS/2yCTSsoZSyfTTM6iFx5AIjPfIDSlgVVbHw2Wa0pJb/5gRUmOeDWAeHdxT4=
X-Received: by 2002:a05:6a00:4ac3:b0:581:c268:f31c with SMTP id
 ds3-20020a056a004ac300b00581c268f31cmr1963983pfb.65.1672967899668; Thu, 05
 Jan 2023 17:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org> <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
 <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org> <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
 <6cffb621-8ba2-957e-9cbb-3b139448fd12@sholland.org> <CAKAF0m9SnNx=cutfGc7Mw+n6YLtrJQAP+kRe+VwX1WqRHiWbnQ@mail.gmail.com>
 <CAKAF0m9ym7-fUre3nBF195do_fhp1PGcmiDuyYoTwNO_Lzb0_w@mail.gmail.com>
 <CAKAF0m-cGuOxhzGKtxu_hiD2XJVPwjt53dF4WFAYuAK6VisgPQ@mail.gmail.com> <CAKAF0m-JVGH7dUGwWdFQQKT2UhTdpB4=h_u6H4Wbdux9_fQc6A@mail.gmail.com>
In-Reply-To: <CAKAF0m-JVGH7dUGwWdFQQKT2UhTdpB4=h_u6H4Wbdux9_fQc6A@mail.gmail.com>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Fri, 6 Jan 2023 03:18:00 +0200
Message-ID: <CAKAF0m9K=zqx1MOM1pZQY4_FOZxL8Svu0Vwn1+5FLn=whnD7aw@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Additionally to the previous message... I think we must make sure of
this really SMP-caused bug. I did some experiments with hanging all
CPU's in the SRAM.

I tried this:
1. Custom SGI. But I got random pagefaults. Don't know what is going
wrong, but will try to debug it in the future.
Example of code:
https://github.com/u-boot/u-boot/compare/master...Azq2:u-boot:new_test

2. Disabling CPUs before and enabling after frequency change.
I tried kernel API `cpu_remove()` / `cpu_add()` and simple bash script
with usespace API `/sys/devices/system/cpu/cpuX/online`.
But I have random pagefaults if too frequently disabling and enabling
CPU's. Even without any sun8i_a33_mbus.
It seems the CPU hotplug is broken on both 5.15 and 6.1 kernels. %)
Perhaps this is related to SGI pagefaults at all.

Of course it offtopic to the main theme of this listing. Just a sad fact. :(

3. Locking using SMC calls and smp_call_function.
Locking code in the psci.c:
https://gist.github.com/Azq2/5c2bf3855f9546aeb63b57f5aa042621#file-psci-c-L378
Changes to sun8i-a33-mbus.c:
https://gist.github.com/Azq2/54713f2aa68c89bda0c8792f6b760908

Is the main idea - hang all secondary cores in their SMC handler.

Yes, this is a totally bad and strangest implementation, but that is
only for experiment.
That is similar to the original allwinner driver.
I tested this for some time and don't have any hang-ups on PWRCTL.
Even with memterser.
