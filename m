Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831738655D
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Jun 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169889; cv=pass; b=NEdgQXaCNBuaH4QPZC/IpO+bio7r3Nbv/4sxPqXLmFPhdAtR5mQROtuBxCrJ3pdZPZ8ribXY1wpCJInd2PG17VpUsNPBu9Lj5SINdfbr2Pb/8XBzQf65TFOMecH11gB3GdwEDXjey4+N03x6K/aw6MjoG388KfiyQh7NzjeayWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169889; c=relaxed/simple;
	bh=ptpjUzlQRW1tacZ47KxbrmuVX9kEVKwX3KItC4VS0co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cab3Ro6aEvc3UuwnE7g8IJEcfznFegexO3+stHeMhk88kUtuNwzu21ojbsoELitxkznjG80AHSoNwjpdr3d/+FjjxsrbVZrgapifSx5AgUaVSBnpKsw/XjTewBbUylZsI5W1XkJkN6QCIvj9+Shm9fVI4VYnYWFnbCAsDtT8wtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mgZ4iPOl; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mgZ4iPOl"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd523634so12162583c88.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Jun 2026 02:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781169886; cv=none;
        d=google.com; s=arc-20240605;
        b=DQ2SFRjx1Xy771stNuInTNzq+4T1q1JtgFgXguGXEGH0w+7gp3j/Z7Iu1eLQwEyaVr
         dhEor6UsEl0n1IiWAp2eI1OjpF7rd9z7opRNhkEAFavIGTACQGTPSZx4wVEqfwcxa22A
         0h6laWodLU+902atga783ia+ny4nYx1Zc75gNa6TzkPBVMJhDBneaT5ofiP1nJ4t1Ia2
         n4ftZsL1rxDFR0ZCjwXACO/8VPyesqCQwAn0Pq5ECZmrmwtSYI5kbpdsEggub3S9jH1W
         Z0Tlcl+SSYvBXZfG5ttBP5Y3nqHVyl/rdel7w2ZkpBYtvwgU18Q9MwleSihyFpM2mUk7
         mQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jxNaQG6Oi1Xty0lZOZ4/NPsjnTXhNNGyA26nZBNmjac=;
        fh=i8lDni5BFR+MlwUZ0Toq9j6vbuHPfc+KhCab1CcFKW8=;
        b=URcHWp9UCte/zMxjwc8P2m6GIV7BHcg46VlPPFlOumqdlCenkSpEqXIYjTOr+SXKjB
         BRYrXmP+Bx/JZTSndmQMnLU0uDMhD+LKvd7seV7QNMUT5u9/qV9KDEl89r/Y4p/I8Ok/
         RtxNtCrxZTVFwoXinngeDwD+fqwGupZXYi+0MlmqhlAjIh0Urs14ftvn8Zv6IgBaHgvh
         Gd+kXYYcIUgqX0W/dHSoKXOhIH/oZrmB7VizFdUNiWMacElg1pN5dZWiU2zCL3iwmLSN
         6EKJCet7gVROxs53cvs0AIGza3KjI0lKxU9PmxTkxqaembKqmoXwsXkyQICdT83nqpQH
         txDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781169886; x=1781774686; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxNaQG6Oi1Xty0lZOZ4/NPsjnTXhNNGyA26nZBNmjac=;
        b=mgZ4iPOlzGeot9PinNJnh6lA73cJ5I+Fcipvd7AyixavbipH6B1NTGBgs+TDRV9tKl
         oPFD+uNvBZlRDd9PcSk6E5LjFa+dS783Nl7Ida2IStSlw1DZKRh3M0AbSXCulCNepCB1
         WbLxIg1Tf/umIWNrlPP+ifkjjbtdpn0N5PwtANAtS4ANEHoYO7fWk9WkaCIwGWDG2AZG
         4kI16SaCphzoI+/Aw6066qWOZRze2xiAwGDxhRAhdnNh476CvgsdmB2X4uniiIGoatom
         ad/ljoSTjG30F9Wk7F7ZCWKiu5/KHVlQupzjrzf3Db3W6yXtlCtdNH0D+pRvHyaWcA5w
         ksLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169886; x=1781774686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxNaQG6Oi1Xty0lZOZ4/NPsjnTXhNNGyA26nZBNmjac=;
        b=C33KUDnwfgzHbHwc7+/mem6Gw/bFpxKzk26DuxZ0nknotXliMvM5HhXdgbC76I3doC
         L9PXnvoIniqQ5wKevSHfpInpINDHTQrDl1LgnKVcccdvdQ93ZO/J2+s7n+6Swza3T/8K
         zUJ/hf6aRG8ntb8tCGu7bC7ui6XkjGGXxFVvIsXHiwlWK/Xw4VQeV4kjXa9l6JcN/2dH
         /VnjLNBR595ju6Mt1koc0RI4rw0aNiIDnB/lqITZ7fX43fjd2KY0KOW+2LsI6zk10HEf
         DV4+LxmK6tWNX0mNIK8cFAHKNQZ+tCx27s2oKCqEpJnW2oBcUEQFo/dU5hxgMHqjiZu0
         qoRw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ej1NfHdwhP06Sp0YYKs1cJRYialmB6hVLYi1/2mNDLMxCHi9PzDhoubNb/R21F04INuhXXI3ni3JnnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlI5lE6155GIpztciaYgJuxG+ejLqPud69HqWxYePIzt12uKEZ
	n1YKJdJjbe5BaPe0jfqQLjFQBEEAHYVJE1iF9iQ9Rga3nTPFG9rYwv1fShvTU+RJAYPxhn3c2wk
	HYpwM+swmoroqhKdzPxzWva6UNLNLIZXpJhRJVp2I
X-Gm-Gg: Acq92OHBO7XcEQYwN1oDR4+0cvfq/rAk5b/cvMK+iNb6oTCibKtwPdz/al7DHTwtZYi
	iWCvw1mC4OgjIZdQoT82Z3M6b/kt9QwYkbRk2510X+LHxIaK7B/JVFP4PCOQxfX+pyMvMUyFPtU
	tIlIDD93GGMWrUrjlV3bJxTBOAhGMWoVes3EEzlGpZbT+G3Qt27rYSYD3tusMZDWUdgKxVUQdFV
	C0Ss30PHJvgnhEM6FJJF3oB4hFemYvplgeXiAg2BJS376Z3N9Btn4kRsXBidXTzTZDNfMRR0pI9
	T9/xp9+WeCK00sc+BAJvt5hSHODXZGH2+/J40mq7PVVydtI=
X-Received: by 2002:a05:7022:1b08:b0:137:1ae1:bc2f with SMTP id
 a92af1059eb24-13842181f98mr1005419c88.13.1781169885639; Thu, 11 Jun 2026
 02:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606110958.2CPRMnM0-lkp@intel.com>
In-Reply-To: <202606110958.2CPRMnM0-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Jun 2026 11:24:09 +0200
X-Gm-Features: AVVi8CfR5bv_cwVh1j_mobE8Sz1NOjQDmqNkwS0WX3LWG1D7btR5qlprUv15XLU
Message-ID: <CANpmjNOZ_11Ef0qYnagaDshHoYy4=cUOQBsd+0DPJyJt02pWnQ@mail.gmail.com>
Subject: Re: [linux-next:master 4283/12670] drivers/dma/sun6i-dma.c:792
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Harry Yoo (Oracle)" <harry@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>
Content-Type: text/plain; charset="UTF-8"

+cc maintainers of this driver

On Thu, 11 Jun 2026 at 10:59, Dan Carpenter <error27@gmail.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
> commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4283/12670] slab: support for compiler-assisted type-based slab cache partitioning
> config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110958.2CPRMnM0-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202606110958.2CPRMnM0-lkp@intel.com/
>
> smatch warnings:
> drivers/dma/sun6i-dma.c:792 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
> drivers/dma/sun6i-dma.c:873 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli' (line 874)
>
> vim +/v_lli +792 drivers/dma/sun6i-dma.c
>
> 555859308723d8 Maxime Ripard       2014-07-17  783      dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
> 9aa48806edb8c3 Samuel Holland      2022-04-24  784      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24  785           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> 9aa48806edb8c3 Samuel Holland      2022-04-24  786              sun6i_dma_dump_lli(vchan, v_lli, p_lli);
> 555859308723d8 Maxime Ripard       2014-07-17  787
> 555859308723d8 Maxime Ripard       2014-07-17  788      return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> 555859308723d8 Maxime Ripard       2014-07-17  789
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  790  err_lli_free:
> 9aa48806edb8c3 Samuel Holland      2022-04-24  791      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @792           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>                                                                                                 ^^^^^^^^^^^^^^^^^
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @793              dma_pool_free(sdev->pool, v_lli, p_lli);
>                                                                                           ^^^^^
> freed and then dereferenced to get the next block.
>
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  794      kfree(txd);
> 555859308723d8 Maxime Ripard       2014-07-17  795      return NULL;
> 555859308723d8 Maxime Ripard       2014-07-17  796  }
> 555859308723d8 Maxime Ripard       2014-07-17  797
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  799                                      struct dma_chan *chan,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  800                                      dma_addr_t buf_addr,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  801                                      size_t buf_len,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  802                                      size_t period_len,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  803                                      enum dma_transfer_direction dir,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  804                                      unsigned long flags)
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  {
>
> [ snip ]
>
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  868
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  869      return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  870
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  871  err_lli_free:
> 9aa48806edb8c3 Samuel Holland      2022-04-24  872      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @873           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>                                                                                                 ^^^^^^^^^^^^^^^^^
> Same.

Not sure what's going on here, but is this a latent bug in this
driver?  It appears some recent changes made Smatch see through this
better.
