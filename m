Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320045FBA1
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Apr 2024 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052986; cv=none; b=DYvq5wYQdz5Bfx0GtC6vYT7s678qaMG6VOSzQgiorNbhZTrs3e5xFJxBDZ2BrFWhaQQoij2RaFN2txwWrg5psUkREHfFXkFhI+GkCk+ixR8LvBt8t6DL2jnMXmHa01aMFZB/liIv4E1dRkL8a/RG773zK4iX/by8FtZt/EVV/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052986; c=relaxed/simple;
	bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSgveFIfu9orp9RXXglTwqFeqfCO3WFyHK2guOMwc9VrEf/jkpGY1A8Muiq7ST+QLPLuccUdpVvTaoWWN2Mwg8my+l8qiq+E94vmWH1aszsXeOBxxNYRezoDjtenIIzzh9rXA38G5uNb+Ul6vvdRGs1wJWHDIvf25fiiC/ZWLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiiZAHRh; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiiZAHRh"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so3942697276.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Apr 2024 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052982; x=1712657782; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=ZiiZAHRhwtcSgxTB/tXxP7iw5yibr8flu2COZgBYM3CWmjlxlmqdzsB3AHcWetOtFy
         Eu+zYIPGbjl2ulJH+BVje7SE8+M4PTXYHnKaC7SAtF1wEtnYMOwe+/bdFHm758kpMSxM
         BVlZnKOU8m8/CY0nNgbyXMCx8Rn80sBbWJa5YzqyWeqGJu5NWuK3eVYYOnQ1yLeRaNyC
         b9cxS+Bn18PVgyv0QM+bP3HdU0gdR9r58C2pcJRTAbn8BoQPb4RIXwFFTC/h2wLN69yH
         Xm5CiHVyjWEpjfZ5XCsiCW0vHeBtLwuErmG11jm3OjQIEAI8PCJGThmR6hDXidw5+EJV
         PY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052982; x=1712657782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=lLCbOMinZWpBXYZrX9JCyuD81uzA4RAKB4wqOccrtLftAfvQuBTaaD29hHc7JsDvHV
         Av4Rydyuzso4cDl/mTzTZRy0s3CtM2X3mSAcmLiGFLNJ6S9/wyY8iSCmb1hj4Lg24j/w
         h/Q94eyjeSCchGb7Jw8i/HPNSRZ8h4pX5Fg+HPhlDW7Xg947UgoRYiMeJLy6LBXKBCo4
         YQwJ6wtfGRIOCo3Wcg9qgGiOOAwu8y91OefKIS4OVQlTlRneqoP3RvsNr6uqTpTgoFDT
         MhUvW6Op0fZs1NqlDS3NEFsAYW++jXNQG6aQyMAqQVlX0UsZrPGnue8m6Q3M+Ppd+AYw
         mVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUbQiU9hwzstd9xhvZl8qoOobkPvS+vwQ4j4PtE8uzeMJMecOfns6eNGZ+eWTNsp/r1rNWnxUbIWQ0xyWSLzgLzDPU8a/cir1ti9NE=
X-Gm-Message-State: AOJu0Yxlq/MQZWp0fIyglplYsZsvifNedtV5mA4AV9093xw20trZ92bu
	F20LDPqLTzLoDm0yGYk+frgFavzQJLzDqQYoBKum30q16VGoq0eeUH1o4cgKBHfxZyaXEY4ZwqX
	XI3is8CXolsYzS/RNBzDyr2vi+HQ387FbDw49pA==
X-Google-Smtp-Source: AGHT+IHzjYx5u+Am4EzQhN6aMsFTdxF/7ehGqP9AXe12JTbN0HclFOy9oE6Q1Tva+ZRKMaaQSSepEoCeBcfLH2AuW+A=
X-Received: by 2002:a25:b191:0:b0:dcd:b034:b504 with SMTP id
 h17-20020a25b191000000b00dcdb034b504mr9487652ybj.27.1712052982018; Tue, 02
 Apr 2024 03:16:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
 <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
In-Reply-To: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:15:45 +0200
Message-ID: <CAPDyKFp5KET0HR+8MwO4cf0O6W2kyFqHoKcVf5jbgBuLuQUcFA@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Tejun Heo <tj@kernel.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
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
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, 
	jh80.chung@samsung.com, oakad@yahoo.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, brucechang@via.com.tw, HaraldWelte@viatech.com, 
	pierre@ossman.eu, duncan.sands@free.fr, stern@rowland.harvard.edu, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 17:21, Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> > At this point we have suggested to drivers to switch to use threaded
> > irq handlers (and regular work queues if needed too). That said,
> > what's the benefit of using the BH work queue?
>
> BH workqueues should behave about the same as tasklets which have more
> limited interface and is subtly broken in an expensive-to-fix way (around
> freeing in-flight work item), so the plan is to replace tasklets with BH
> workqueues and remove tasklets from the kernel.

Seems like a good approach!

>
> The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
> workqueues are the same as when you compare them to tasklets. No thread
> switching overhead, so latencies will be a bit tighter. Wheteher that
> actually matters really depends on the use case. Here, the biggest advantage
> is that it's mostly interchangeable with tasklets and can thus be swapped
> easily.

Right, thanks for clarifying!

However, the main question is then - if/when it makes sense to use the
BH workqueue for an mmc host driver. Unless there are some HW
limitations, a threaded irq handler should be sufficient, I think.

That said, moving to threaded irq handlers is a different topic and
doesn't prevent us from moving to BH workqueues as it seems like a
step in the right direction.

Kind regards
Uffe
