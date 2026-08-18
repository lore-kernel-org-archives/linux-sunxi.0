Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C7E30D3ED
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787090275; cv=none; b=NpIWeusXSVdxbnrwJFv/P5YZ85vN84q/GN2eqdbql5YB2aEkei8r4KGEbVypMebHws4/M5dyHv8G6yeWRB2aLLm+AZxITRxmkTgARd6JoB+Fap6QT4NcqeKJ/SD5S88iW3aZ4S9laAx+ljnP7hO6pQw5NyE/J06OeT7hxxr+ogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787090275; c=relaxed/simple;
	bh=0bk4vHU7riPTkp0zVUJu+Hfk78vnSH25XsmU7Px7Nqg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXd083H3uXPmMnS/BOXPpUqZHU8pMcU+siD4Z+bHLYEe6e50vshouRVH0nK2ikFcVdC3YhLino572r9ZO53WvRv2AMuLAvPTyKd8JBcSZ1XJhWjwEpKT7ihsQGoPLvXISejc4FljuQxg1GrazbwPOGRlwRwnGAKlbFgVARdKx8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlYOUUkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNKlQX6U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlYOUUkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNKlQX6U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILdBvx2328712
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 21:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=; b=JlYOUUkVzm3vEXz/
	5mBT6rv83MXtScLI1UU4932QqojIgbCaBm9G8j43JXFBsv75PqiIE+fUSc/EV5zW
	WllbA9Nl3oTlzhOl7udifyPWv4coA9p/cOwOr8X3YXWcxbtjkSev4EdU3hIDRMdf
	eOv/ibIRSKKDkTUbVJ9xZESABlL8P8VrQiu+kmoZRh58VQqQ4EgoCWI+r8/rqTQm
	HHQ/4KDJ1WJ6PWbMqh6sUt5zrpM5pioIy/N0v31ZKlb9lWGbDmC88nDyu8uhMQQd
	x/lCS40MKyefj/c4AF6YLkx04NRr78ioNJ+jA+ZcqIw5r0zF+aJLxtbD7MJncryJ
	W0cf4A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjg54a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 21:57:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so592457a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787090272; x=1787695072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=;
        b=BNKlQX6UdwzgAB/IzlWosOAOChwC8OaUT2FcJKi1SONu3xfNupvbeaSoek4mQmRSLu
         wq+Hd69FMil/DR3T9NL5ljsGNi+A5JL3ZKaON08nuEXvFIvB64d+IZByEpcflOeS8Dlr
         z2T0lVEMCuBV32oYM2NRSTScVMjE8mbGo5+jeCvAp6X0vDAZS32BdulAckSf3KxRO+CR
         JDDelaEO1j6oaMyJeamYN4yc5SL6i3QBSUyNDGLSxjgv4sZhtZXsKHuQtSNkLBv4xjkq
         TvW6MQDZfOabrb20NhiPArYjPMrc6eRXxQlQn2cGveWyoLUkt9MViTY+CzDkFNLkGGCk
         kNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787090272; x=1787695072;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=;
        b=Xq9wxKm1bueRi9T+spEy3hL02MuPz/C5xclA93TM0HySTamtEqVFO6gO77FKrEgHDx
         hRaUy9v1pm6a5VEDE4s2G2Kx/DM7EFSld45/BnJE+8UyPMBErGAtT3QkaDeO8YQ93rsK
         8Weo+P6VzOUwE9hZ6W4cNSbZFTS1P0RySr9w4iZYHPSXUc9mg/qWKAOAAhM2ITCqL+Xn
         doF8ca+R5rSOgts4cKAbUH1EyxmVQbauxDkUxpS3F+ru/xjR8/BR4dWW+kt/c4Z1Zm63
         50parZxGYcrrGMvm/hktnax6RuCpDNoA4rL33mpgd4dznVmDFu4vMJ5QzFeHu0DYwV6b
         hs+Q==
X-Gm-Message-State: AOJu0YwvKIq6iDJdBaoh/6HsyZGsIHL1xyUSgcVjGTCuMVFXqXbQQIl7
	qm3BqfnmN5/z3J2DQSQq6myrEtC/TYl9i7WnXJH9vouLtMVmAjR0YvVCaH4esAjTU2ZZuN39N4c
	GzZrYbHm2QpgyD453M9b9ijbF8FdqosYbTzFxMKOsh6vzK6h1NQ05W++CDQcKPaCtMQ==
X-Gm-Gg: AR+sD10nBLyogE2kxpBACJDpG5+riF5xuNEZ6QxSE19Ruf70tmFhV0eAOlj3ce39kFE
	lkFFWMZp5BZ/t4P48OmIA3DsXB82x7M9K82Ba/x4hS36TfSKRJtRrIbiGrI8CXMkeDTfALGlPep
	zmfh12OV3PZIlx/oKKY1DA1FnB+xub7dFvZxXrVv53NV9Jg0wGL/0ZzZScfEHRLgmuzaYOP/LxJ
	qaVpYhDXWfpAUftoL0JIQW+rrdVj8pB7kDLJ9uPnbcdQ+oChM6BNl4LUFeAxKv98OlgPkYisR2P
	HuC+faiSWSOaQRVkUo+UKpmcUz83GGpFuSNEfggD32gmkxf5PlcCpVknBCfpTxlW49ncAbPpDof
	Kk42UHntp1wBI5nStaJBYYz529Q==
X-Received: by 2002:a05:6a20:258e:b0:3c3:7cd0:fc27 with SMTP id adf61e73a8af0-3cd00d58d5emr482775637.3.1787090272100;
        Tue, 18 Aug 2026 14:57:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3c3:7cd0:fc27 with SMTP id adf61e73a8af0-3cd00d58d5emr482715637.3.1787090271501;
        Tue, 18 Aug 2026 14:57:51 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm245946c88.15.2026.08.18.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:57:51 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:57:48 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-kernel@vger.kernel.org (open
 list:MAILBOX API),
        linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Allwinner sunXi SoC support)
Subject: Re: [PATCHv2] mailbox: sun6i: modernize probe and convert to fully
 managed
Message-ID: <20260818145748.000040a8@oss.qualcomm.com>
In-Reply-To: <20260814205553.39894-1-rosenp@gmail.com>
References: <20260814205553.39894-1-rosenp@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX3EnMdP9rdXz5
 99eRIE/0TF2vrhMdOxIZHEBqYTr/Q6jz3ElsVm75Tk2EymyMCc0TPos1CzXQDSHVtZNmCNf4+rA
 pTUzY35cKuor4U8QwuclEhRBlJh2UC0xL3tLI0Y8nt6ewFokFYu+JwmVPv2TB12JcqpWW8xQ6+a
 VR7TZemOS5E/dmPw5i26J/gNwS2COuqmXKB7twiHAb87g1NK98DeGkLYbhdv1zuiJH3FZXypzIm
 Z4kubzcSwH8I7QMbaWUXPgtBHIx15COa+O70LsiKdOUaPTv07TeVEjPg/Kih6ebjOU4ulfL9XkW
 L31DWu+msmxby9FSZ8yqMqoB5PFZf+Wp3p/UfWZc5hXZNx99tKkJT5QFqMLCzif4rRjdLmkJWLk
 tzPC71MG0bW4k2gDAgMKdfTF9zA7UqnPfVIFiPdXwMkJp//C3BqM4f1ip4P5JAvFX1fY18JhJ94
 rG9gNnO8lrn8GLhkWDg==
X-Proofpoint-GUID: qOV-KBEztR5k4HvesIsCuoNW3pP1AFt2
X-Proofpoint-ORIG-GUID: qOV-KBEztR5k4HvesIsCuoNW3pP1AFt2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX3nDz+Q20MiTB
 yx3bhhShD7y+bCBLnHbdQrS/rFyQ4YvhnzdGS2Y4X2vtQSfuIQFGpY3SwfLZWnYjyHqw8WujAF3
 i24fpy9MEde15vu+ujZpKlt8nvOZLYc=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a84d561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=5cn5XzpzBu7RpU3fuqAA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180162

On Fri, 14 Aug 2026 13:55:53 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> Replace irq_of_parse_and_map() with platform_get_irq() and move both
> IRQ and MMIO resource acquisition to the top of probe, before any
> allocations, for early error exit.
> 
> Switch from devm_clk_get() + clk_prepare_enable() to
> devm_clk_get_enabled(), which combines both operations and registers
> devres callbacks for automatic disable/unprepare on unbind. This
> eliminates the manual err_disable_unprepare error path and the
> remove callback entirely.
> 
> Use devm_mbox_controller_register() for devres-managed controller
> registration, and drop the remove callback and platform_set_drvdata()
> which are no longer needed.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Drive by review whilst having coffee...

Looks good  - possible follow up suggestion inline + suggestion
to make a minor reorganization to avoid setting
mbox->regs = regs; way later than where it can be set.

> ---
>  v2: fix compilation
>  drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
>  1 file changed, 18 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
> index 6ba6920f4645..3b838f6c837a 100644
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
> @@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	struct mbox_chan *chans;
>  	struct reset_control *reset;
>  	struct sun6i_msgbox *mbox;
> +	void __iomem *regs;
>  	int i, ret;
> +	int irq;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);

Maybe do this just after mbox is allocated so you can set
mbox->regs if this succeeds.  Where it is now is a long way
from either mbox or regs being acquired.
>  
>  	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
>  	if (!mbox)
> @@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	for (i = 0; i < NUM_CHANS; ++i)
>  		chans[i].con_priv = mbox;
>  
> -	mbox->clk = devm_clk_get(dev, NULL);
> +	mbox->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(mbox->clk)) {
>  		ret = PTR_ERR(mbox->clk);
>  		dev_err(dev, "Failed to get clock: %d\n", ret);
>  		return ret;

		return dev_err_probe(dev, PTR_ERR(mbox->clk), "Failed to get clock\n");
>  	}
>  
> -	ret = clk_prepare_enable(mbox->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to enable clock: %d\n", ret);
> -		return ret;
> -	}
> -
>  	reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(reset)) {
>  		ret = PTR_ERR(reset);
>  		dev_err(dev, "Failed to get reset control: %d\n", ret);
> -		goto err_disable_unprepare;
> +		return ret;

		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control\n");

and other similar cases - both more compact and correctly handles deferred probe and
skipping reporting of things like memory allocations failing (as those are very
noisy anyway).

>  	}
>  
>  	/*
> @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	ret = reset_control_deassert(reset);
>  	if (ret) {
>  		dev_err(dev, "Failed to deassert reset: %d\n", ret);
> -		goto err_disable_unprepare;
> +		return ret;
>  	}
>  
> -	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mbox->regs)) {
> -		ret = PTR_ERR(mbox->regs);
> -		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> +	mbox->regs = regs;
>  
>  	/* Disable all IRQs for this end of the msgbox. */
>  	writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
>  
> -	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
> -			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> -	if (ret) {
> -		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> +	ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> +	if (ret)
> +		return ret;
>  
>  	mbox->controller.dev           = dev;
>  	mbox->controller.ops           = &sun6i_msgbox_chan_ops;
> @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	mbox->controller.txpoll_period = 5;
>  
>  	spin_lock_init(&mbox->lock);
> -	platform_set_drvdata(pdev, mbox);
> -
> -	ret = mbox_controller_register(&mbox->controller);
> -	if (ret) {
> -		dev_err(dev, "Failed to register controller: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> -
> -	return 0;
> -
> -err_disable_unprepare:
> -	clk_disable_unprepare(mbox->clk);
> -
> -	return ret;
> -}
> -
> -static void sun6i_msgbox_remove(struct platform_device *pdev)
> -{
> -	struct sun6i_msgbox *mbox = platform_get_drvdata(pdev);
>  
> -	mbox_controller_unregister(&mbox->controller);
> -	/* See the comment in sun6i_msgbox_probe about the reset line. */
> -	clk_disable_unprepare(mbox->clk);
> +	return devm_mbox_controller_register(dev, &mbox->controller);
>  }
>  
>  static const struct of_device_id sun6i_msgbox_of_match[] = {
> @@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver = {
>  		.of_match_table = sun6i_msgbox_of_match,
>  	},
>  	.probe = sun6i_msgbox_probe,
> -	.remove = sun6i_msgbox_remove,
>  };
>  module_platform_driver(sun6i_msgbox_driver);
>  

