Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89CA7E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 05:06:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id u7so9086627plg.13
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gNvaAoMPbdbdyvNqhaTtDMGsJUQFjlXi46W57sai814=;
        b=NKY5xGBqWdv1qptYi67G9s1QIJ57Ku3frhJzM74pZxsLSWQd3yGijZwqvpsfapeTSv
         ciClB3KxoTrc1xQ+TglZAorvsC5xzJmyKKSXlKKHCDdqdirRKannkSUmPr9zZywT+Bz4
         ToUJxiflwolHfGYbJiGmq6FDTq2Xxcb7eDK1qR0daTZVhI2aCIztxoAJHyoEtr158TQO
         +WU1o2FQ3VPVx1ngQsmc0FgbIEYGWk4Hfv9u109YdchiW4PGtaPXUDEXSLjo3cbT+cp6
         uJrsyjjetqBcXf1KxiqOadLPtU6M+ubji3ZOGb9QMjnJs45xc06rZKn5bhHuT1sW7y4s
         kL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gNvaAoMPbdbdyvNqhaTtDMGsJUQFjlXi46W57sai814=;
        b=Rb7w8TU/VVLOMyU5ilQxJOgcvp8I2Ajuo7zi0m7JYM0+QU+xJwTf7hf4GXldp/i783
         W2hGXD49Uif0QM6oZxTOFqiN5h0Gjs+5qjhM+udaEMlhxOBVLiuik6PysRtL4pdcNSUE
         N1Q3A7VAyBSy+7nYHLpOtnbQCIW96Xr81I3n4YYQzMAur2FqBHN69Mn98uRhARA5z70y
         kG6ZXD+EAw0TQbd64kwd07lRYxTR/hKRFvHiskClaOT+zW5XQoLvu316rpViHIyCAvRc
         4qftqV7eD5veoSqJTtbOnBuOV/RMcuGOztIZ3scquutftExhzFb8GJE4Mjl63m+3F5nS
         2IBw==
X-Gm-Message-State: AOAM533f88kYzUUt7DiZseTp51VO8CKLCU3/7tr+xfoZQLZmdgoaQwBc
	LJ6WOu8Z0mysuJBsd1fE4lNB3Q==
X-Google-Smtp-Source: ABdhPJyk6HWS+uLuAV1Fn7IQFtK1dt2aoEgyN3lkCaQS7r5QtxgXFkshOgNrfrKAaTBDliwuWIE75g==
X-Received: by 2002:a17:902:8698:b0:158:99d4:6256 with SMTP id g24-20020a170902869800b0015899d46256mr16749805plo.104.1650863167283;
        Sun, 24 Apr 2022 22:06:07 -0700 (PDT)
Received: from localhost ([122.171.250.232])
        by smtp.gmail.com with ESMTPSA id l2-20020a056a0016c200b004f7e3181a41sm10159399pfc.98.2022.04.24.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 22:06:06 -0700 (PDT)
Date: Mon, 25 Apr 2022 10:36:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Xiaobing Luo <luoxiaobing0926@gmail.com>, tiny.windzz@gmail.com,
	rafael@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	mripard@kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq:fix memory leak in sun50i_cpufreq_nvmem_probe
Message-ID: <20220425050604.fv4f3s74jmvx6rlp@vireshk-i7>
References: <20220423151204.2102314-1-luoxiaobing0926@gmail.com>
 <4ee2421f-79a8-7f4d-f7ef-33f0ccf49337@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ee2421f-79a8-7f4d-f7ef-33f0ccf49337@sholland.org>
User-Agent: NeoMutt/20180716-391-311a52

On 23-04-22, 21:46, Samuel Holland wrote:
> On 4/23/22 10:12 AM, Xiaobing Luo wrote:
> > --------------------------------------------
> > unreferenced object 0xffff000010742a00 (size 128):
> >   comm "swapper/0", pid 1, jiffies 4294902015 (age 1187.652s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<00000000b4dfebaa>] __kmalloc+0x338/0x474
> >     [<00000000d6e716db>] sun50i_cpufreq_nvmem_probe+0xc4/0x36c
> >     [<000000007d6082a0>] platform_probe+0x98/0x11c
> >     [<00000000c990f549>] really_probe+0x234/0x5a0
> >     [<000000002d9fecc6>] __driver_probe_device+0x194/0x224
> >     [<00000000cf0b94fa>] driver_probe_device+0x64/0x13c
> >     [<00000000f238e4cf>] __device_attach_driver+0xf8/0x180
> >     [<000000006720e418>] bus_for_each_drv+0xf8/0x160
> >     [<00000000df4f14f6>] __device_attach+0x174/0x29c
> >     [<00000000782002fb>] device_initial_probe+0x20/0x30
> >     [<00000000c2681b06>] bus_probe_device+0xfc/0x110
> >     [<00000000964cf3bd>] device_add+0x5f0/0xcd0
> >     [<000000004b9264e3>] platform_device_add+0x198/0x390
> >     [<00000000fa82a9d0>] platform_device_register_full+0x178/0x210
> >     [<000000009a5daf13>] sun50i_cpufreq_init+0xf8/0x168
> >     [<000000000377cc7c>] do_one_initcall+0xe4/0x570
> > --------------------------------------------
> > 
> > if sun50i_cpufreq_get_efuse failed, then opp_tables leak.
> > Fixes: f328584f7bff ("cpufreq: Add sun50i nvmem based CPU scaling driver")
> > 
> > Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
> 
> Two minor style issues: there should be a space after "cpufreq:" in the commit
> subject. And the blank line should come before the "Fixes:" tag, not after.
> Otherwise:
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>

Applied, thanks.

-- 
viresh
