Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B24C62
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Jul 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753911898; cv=none; b=bIFsv8w7pgFMBusTusd4RjvQVfe1D6laVvFqhZU8iwV1zS0uE9L5T/WShpm8LGILmynggpt2JUjA6Qpehrp463tkrddbr6r6NydfX9MClyo84TqH0YOJvkJ99szOT1vScOGgE5Cxzo1lqMN1OpoW7aKobouV6VYHpg+DZJNt5QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753911898; c=relaxed/simple;
	bh=PPRlwx1CPANTimR56E3Tq9xJjZZGDr/ycInC7SqiA7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2eD2pm+SZiz3VriR7Sw9Wfbpq9qy1oKDO0KYlpFG7oCKImRlGjinY6pQB6y7QqNTDGQ0c2Duel7VomrvjShSebFWKdxQpSubJ9eTErbKC1XlmBuFFxImq3GcYFndXROC6kxDwFaiyJg68nb18N9PFbtIxofpHoe4TFBQ0O80GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NefG+6+A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NefG+6+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753911895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
	b=NefG+6+AoB+nFdpZ+Mvu2NIzuXZlagaCp//jX+1tbnrdjPncw7v6yX2nAiBAio1zkx6niJ
	gUHhSY3aAFEOzAafEwReh8wVfBbiY6PRCmjRy2pqoIkoRfBRl6CzHHeh/74hcaFFuKN+Lj
	YirNP4/+yqXVhT4auVKrq63d+e1PXqY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-VcrR05OvM-C6qmq2uEac8A-1; Wed, 30 Jul 2025 17:44:54 -0400
X-MC-Unique: VcrR05OvM-C6qmq2uEac8A-1
X-Mimecast-MFC-AGG-ID: VcrR05OvM-C6qmq2uEac8A_1753911893
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-af8fd22707eso13454766b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Jul 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753911893; x=1754516693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
        b=sFkzHWDNS+ssFRW5q7RA6LFtILa7vftpQgY2Q3e/xaGvHyTXp0KORecwtQ8j2u33zt
         er6Desj9NXH2EMsSxAH1vgVbsoBL9ATq2FBbCSsl7iB4XjFSfHSctGQ3ol03S56+0sPa
         UBSd7tMUbQzQYSS9IVmrBk16/fXm2Wjb5OMvOhMPuCYpTlB+b8qIbJjOqzVWNySvzJCL
         mwhVVadBR/wJWtgMGAkt64eVlGxysKR3GWn+bkjMMBKg8S4o84ozMEubRAJTcjld7kif
         C9qT4NerJcwDrI/bnfL1CRwb1YbxXl7HVps4mUt34Q2U9YjUbfYxAtK3ZPZt4zqDVFYZ
         B4yw==
X-Forwarded-Encrypted: i=1; AJvYcCXa1Vy2FoXx2ginWtFcy8TamJIvChrMPJVlHtwC2hPJvdRI4XeQDSl9Ww+uQ0dah5Nb/jF2zh7fy4VwBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuYrR0uQjC+8dE6xj6U2wRR1NMC3n0sp/7T46iO71krjuY/FJz
	/B1KhY2AHk18u72IxrFyptzITww07sbyfLI88nmJDml+E7yMaBCkdiWYjbV82Jm59l0pNUPV+3y
	Rx7R6eTki0IlwKI/DEyuyJlsx3/EK5oteQWXo5l9HSpbKiemghZsw+a8fpC5ssY3Yhcjf9lCKgZ
	J5Wy+Djc0aBWeeAKJlCKXI96X3XUNTx0uubmJhRMQ=
X-Gm-Gg: ASbGnctZvTzwyluzxJF9Hwrfkl8/qff7HMKOAQc2Uvz+jaShKcvcbDNU8LZKj888Nvs
	UD/mc702HVJcMxzAHBq8KV+PDpGNhpmlb7vnEtTlPAWM5Rs0PcxUvw8OJBEN6jj5Iognxpd3o+0
	+HFP2HHO390HggNzqpfquy
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id a640c23a62f3a-af8fd95983cmr588747666b.28.1753911892817;
        Wed, 30 Jul 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETx/Q8z8JkM7YCT5hwYxMVdj/tg+Mt8q7qzSVGG/eKji/F1PzdcrMN7TdxkQSZqczHP8nko8qLTPufvPgLTYo=
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588742766b.28.1753911892317; Wed, 30 Jul 2025
 14:44:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com> <20250711-adorable-winged-petrel-3a55df@houat>
In-Reply-To: <20250711-adorable-winged-petrel-3a55df@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 30 Jul 2025 17:44:40 -0400
X-Gm-Features: Ac12FXzMGo-MKds2pkAwVkvrlMlbQL40TOGBvmpmqZ_c-U-gdfMUVGNxYave4ac
Message-ID: <CABx5tqKuOcE83t+BVz=1WudVtBxJYTzcjWJ_n4se0JQWeU_Y1w@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
To: Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dE7Aoj3gBkxB8lD5AcI8nD_IB9GpRLwMIoLK9vTC2RY_1753911893
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 3:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Jul 10, 2025 at 01:43:10PM -0400, Brian Masney wrote:
> > -static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rat=
e,
> > -                               unsigned long *parent_rate)
> > +static int sun4i_dclk_determine_rate(struct clk_hw *hw,
> > +                                  struct clk_rate_request *req)
> >  {
> >       struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
> >       struct sun4i_tcon *tcon =3D dclk->tcon;
> > @@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, =
unsigned long rate,
> >       int i;
> >
> >       for (i =3D tcon->dclk_min_div; i <=3D tcon->dclk_max_div; i++) {
> > -             u64 ideal =3D (u64)rate * i;
> > +             u64 ideal =3D (u64) req->rate * i;
>
> There shouldn't be any space after the cast.
>
> Once fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>

OK. I'm planning to submit a v2 of this series on August 11th when
v6.17rc1 is out. Unless the maintainer that picks up this whole series
plans to drop the space on merge.

Brian

