Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C772562
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 15:39:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id g20so18920109edw.6
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T01Vsboe7BIJvmOZnpFBnqjbW+9iDm8fcl2QrWQykBc=;
        b=kPM/SNHsAbBB6TPmDqMIcF3+pw23OqniiDoKpyCh8WM3av7/TyIAZaj6mkSAGUIcjv
         wFg+zJ5PJZ+OWSTcT08+l6llF1V5IgIUQ9t9PmYB8P1utoqI0nFy9Sdd2k3AgNv1l1FZ
         QMAzyQq1xVzv7dZo/YM6MGJvSX6DHz7za/D8I82l0lzgoEB/wX1qUpMZ5UpQ7sSIAkay
         eN5yzepL0YRYBfLDwIPqUdkAGkJswqyaldV+jhNmHzLZbiOEdgabkRZ5U26w8TJcEOHl
         KWg4YZcX1tRWUsPoJozBH5dm9g0k5T0XGeJWULpmf/oYCe3yRJQ/UT3aBDA/kFoxJykM
         xorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T01Vsboe7BIJvmOZnpFBnqjbW+9iDm8fcl2QrWQykBc=;
        b=4qhGMsRh7JrqHtSn77C4hgALTKaPSIx6B3LnYLsvt4G8r0BL19sOVFIUvH1vOxU8Ow
         F5oHb2EeZDKnnrJprdCgNAqY6P/fQwfIAB8fIjTY1FrCMIMMFg5+8SgTTRKb0ly/5Z7a
         8FRaNOrcwcChkjRDFSodAkkpld9ynXy/wueV1V0NtI6f95xmzGeIjGJOc5w2fZJuUGTy
         faEcOz0PDFIJ5YXUjKkmUNsXPUf3oW2Ji4VVOIpYvnA3+/C8BCfqn6RbFYwNRClc8vqy
         KcVpUS/vthBYMJ4/BIJjSCKT9JliI9jVuoS796dK2HaQY9N3LTiTLWwpkbHrARPgJknr
         2SsQ==
X-Gm-Message-State: AOAM533lEPo6Iv3HQDuRnPOa/AxsNx3Q2lj+KFRc6HjTkW8wkj16bQMc
	GzwIeElZmJ5iNgszOoxTy0I=
X-Google-Smtp-Source: ABdhPJzIyVAdyqYhswiICra1oKeo5UKFm4s/D+QpyQPj+7Teup4JNUsf36N9FoOwox9FncoffG3lOQ==
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id g9-20020a056402090900b004166f3c5c1dmr19408479edz.108.1650901181156;
        Mon, 25 Apr 2022 08:39:41 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402090600b0041d8c2f9e61sm4826215edz.31.2022.04.25.08.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 08:39:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: tiny.windzz@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org, wens@csie.org, samuel@sholland.org, mripard@kernel.org, Xiaobing Luo <luoxiaobing0926@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Xiaobing Luo <luoxiaobing0926@gmail.com>
Subject: Re: [PATCH v3] cpufreq: fix memory leak in sun50i_cpufreq_nvmem_probe
Date: Mon, 25 Apr 2022 17:39:39 +0200
Message-ID: <3099618.5fSG56mABF@kista>
In-Reply-To: <20220425113009.2182485-1-luoxiaobing0926@gmail.com>
References: <20220425113009.2182485-1-luoxiaobing0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 25. april 2022 ob 13:30:09 CEST je Xiaobing Luo napisal(a):
> --------------------------------------------
> unreferenced object 0xffff000010742a00 (size 128):
>   comm "swapper/0", pid 1, jiffies 4294902015 (age 1187.652s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000b4dfebaa>] __kmalloc+0x338/0x474
>     [<00000000d6e716db>] sun50i_cpufreq_nvmem_probe+0xc4/0x36c
>     [<000000007d6082a0>] platform_probe+0x98/0x11c
>     [<00000000c990f549>] really_probe+0x234/0x5a0
>     [<000000002d9fecc6>] __driver_probe_device+0x194/0x224
>     [<00000000cf0b94fa>] driver_probe_device+0x64/0x13c
>     [<00000000f238e4cf>] __device_attach_driver+0xf8/0x180
>     [<000000006720e418>] bus_for_each_drv+0xf8/0x160
>     [<00000000df4f14f6>] __device_attach+0x174/0x29c
>     [<00000000782002fb>] device_initial_probe+0x20/0x30
>     [<00000000c2681b06>] bus_probe_device+0xfc/0x110
>     [<00000000964cf3bd>] device_add+0x5f0/0xcd0
>     [<000000004b9264e3>] platform_device_add+0x198/0x390
>     [<00000000fa82a9d0>] platform_device_register_full+0x178/0x210
>     [<000000009a5daf13>] sun50i_cpufreq_init+0xf8/0x168
>     [<000000000377cc7c>] do_one_initcall+0xe4/0x570
> --------------------------------------------
> 
> if sun50i_cpufreq_get_efuse failed, then opp_tables leak.
> 
> Fixes: f328584f7bff ("cpufreq: Add sun50i nvmem based CPU scaling driver")
> Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>

This patch was already applied (v2).

Best regards,
Jernej

> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-
cpufreq-nvmem.c
> index 2deed8d8773f..75e1bf3a08f7 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -98,8 +98,10 @@ static int sun50i_cpufreq_nvmem_probe(struct 
platform_device *pdev)
>  		return -ENOMEM;
>  
>  	ret = sun50i_cpufreq_get_efuse(&speed);
> -	if (ret)
> +	if (ret) {
> +		kfree(opp_tables);
>  		return ret;
> +	}
>  
>  	snprintf(name, MAX_NAME_LEN, "speed%d", speed);
>  
> -- 
> 2.36.0
> 
> 


