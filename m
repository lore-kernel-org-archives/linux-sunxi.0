Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4177F0B
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Apr 2024 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060732; cv=none; b=Y7pnBfVH9Uvry3t0i/Kp+dBMZNtlrBbHyDgLlD9KKW1Fw6MABrrt8R1grhvIrOs8/xzqF+TIbfy2TDiLgoWVyoHkJUpVjVx90BAmSQillrTA4cdfeU00jB346/TJjSlgj0FykLh4n3k9Ys8QZs2JhcJHem6D0AjfU8BVsNR/NJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060732; c=relaxed/simple;
	bh=p/UeUz6BQzzlTj362U5Q+0hUyUg483V1OKi+HLKX4OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c++p0VwvXgphpFfmR05l5aDK2IYOADfZVkc7+4u4hzqhmV/z5ZgWaze9D5ROgPxAyIKu3TJMl9rD/vjj1hJLhy5ZUY19C78V+bHvm3JA+wVWaRVGdUYN3iHQ4DQsu+WQBO/nKaf521Jd6HTQBpEd/Ustgg44L0cAvuZQSClP+sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wD/D2Sp+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wD/D2Sp+"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-615019cd427so11780887b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Apr 2024 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712060727; x=1712665527; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=;
        b=wD/D2Sp+g1TCnJS6lE0DEwMQfiCYNTpfpZdHSinpq364J51zeEJVqXARatwrQ9Dzre
         e4rpdLrC/EBJUGyMc3sqviFZVddS/fzvk0WWEF6XvZaT3tMrIY7sizjb7QFQ3ReeeYu0
         hpGVaQfh146uh06Vx+NdvWLvUzK6OMMRgHmO3OEjemmNtChjCsGzKHeqSdhc+SUyhA/E
         hQ7IF/2BsWDJ+eSYy9GuA5c4edubvWMox3W6btKaRmUjn4lud5/jdz6IwcZWTbD8wE/X
         Pz8OYxkeGp3MEmzclT+pwaL2k/dwPGXFVGJgvAG8XUrmgN+wy5GU5Qw98xPVsmF24kfp
         oaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712060727; x=1712665527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=;
        b=YMrgKM7UxlbW0snhn77wmuWLCgq9r00QP6Kfvs/hD0r7nQI2fVwbLd/Zgm4dzK71nL
         pJPSqB6l9nKhUENtULT6KjxhfWzlr+G0aIaW3RdLnK5jgGNh5+0no/Gfhdt04UvCOk7j
         sIG9VofSK31U9bIWp7sI6WQNGUzvAtLNaPuXPDN3HzgQNoUzQhQ7mHvytfQTUckJUWvE
         bi6mXshd4mBCnIxbJb2RvmyGH2/kYzhsDOydb8fj2YIrlEkgl8wYsPvLyVVYkda5rPLx
         f4uOabXDdsK6Y/k+1E3nNE/MDHRbHGGr0Un29hiR7/6k4RNSfQy+9hqn3bNCnczdCL8k
         Ga2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0lEuIVUdkN/CY+EA5p6JePt1RL34Fvri7fCImkrmOujxvwRCJ6JjVSOX8pMbv9zk7lfQRksGnrpGaAj2MQ3SNVXK/SupSM7KWuRs=
X-Gm-Message-State: AOJu0YwA9W9aAloSUBfS98hc3Pu15JI8U2fR2yl1+aHtNttyQRvYs/0o
	0mbhCU49Sqy/dMYlkT3uww/1KIicrR1HLv9yweYJdZC+R3Tq26x9bRgoMzymrRJ9qUw3IBqs5sc
	b9St+kIT9PTELhbBlol7mXrpgk2TaT/HyTNUkUA==
X-Google-Smtp-Source: AGHT+IFUrSspS0uEXi4Mtdf0lWq2f6Bt6/664idaePnQ5n7gs/Aofr4lkRbBJPYECBaOux5ZgxpPBc0T/C/GsKmHDRA=
X-Received: by 2002:a5b:104:0:b0:dcc:ec02:38b0 with SMTP id
 4-20020a5b0104000000b00dccec0238b0mr8733778ybx.64.1712060727251; Tue, 02 Apr
 2024 05:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com> <20240327160314.9982-3-apais@linux.microsoft.com>
In-Reply-To: <20240327160314.9982-3-apais@linux.microsoft.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:25:15 +0200
Message-ID: <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org, 
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
	peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Allen,

thanks for your patch!

On Wed, Mar 27, 2024 at 5:03=E2=80=AFPM Allen Pais <apais@linux.microsoft.c=
om> wrote:

> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/dma/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
(...)
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
(...)
>         if (d40c->pending_tx)
> -               tasklet_schedule(&d40c->tasklet);
> +               queue_work(system_bh_wq, &d40c->work);

Why is "my" driver not allowed to use system_bh_highpri_wq?

I can't see the reasoning between some drivers using system_bh_wq
and others being highpri?

Given the DMA usecase I would expect them all to be high prio.

Yours,
Linus Walleij
