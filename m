Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C694C7D
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 19:48:38 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id bj12so21000020ejb.13
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Nov 2022 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsVUZtHki8EBvGx5whDzNHPZ47FabaCsvu2d/dBbocY=;
        b=ZG5inOk3smdgd27T+dN+G6mK3Vw2vI9Eve1vkyETDAKKYvB6W2mhCYuky1V1WhSBIU
         yWtzAwcc9hobxVUf5JiqDrUZ3nOhkT1cxpfuAvh/ZajHYMLpx9vHaZfrfOQTufJD7ZwY
         2xlb4II6NgADIuwuNA6x/kaGzzCXFIh+D6jmWeDHxoNC5rTftsqZn4CJBZZQzAAzNGG/
         YRsnwP2GYjWUKQgo9NL8J3/e2kQLSep3YcxnSyIPlIbgsmPaR+ZwO4FQLYMzbPc2Xc4g
         wJBMHuhO96nlKxjIDTb8DstV87zyncHVhI46mLH9qpAvTdrVHBRYI9/JEJX5/X3Un++m
         9lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsVUZtHki8EBvGx5whDzNHPZ47FabaCsvu2d/dBbocY=;
        b=hl2srVZOoLod90MzOfKEqKhR5tyRM1UViQ0g8XimCiak1TNiNu5DF3EhiGwB3YNdZf
         gacmBsH+VaZB02y3y/cQvwwiTW2uRMG+G9LBlMgqiZgmxXy+qSMFq9D5w4CRe7cVFjqK
         hNYRMJfyWWsS+j8Zq9Ka8FdzaUq24tkFx6CzsWWz8ycDAOGRZAA8iF75KSXBCjSGJfGf
         BdlChW83mBH+mFCftUtSbkcH2PFU5UqC/UlCDj3mK4NRSu7BSYJFLgADu1MR8LevcURb
         QcTWNX2wGAcdbbHnOwNpb9YxahVLL7J5vVJEQ9AGTKv0PLkJpf7UdsRb/R/dTspEqqlM
         6EVA==
X-Gm-Message-State: ACrzQf1yPCQn86xiyo58/1ssDV9kUZxOBktvtKc2KwhDtMYb7HKXSzO4
	4Mkl7IX+/c/2/Vfylo6D9Io=
X-Google-Smtp-Source: AMsMyM5FzMR4PIjzYSnQ9p8ZEFjVMm931AWGHARdB55RkYgvKUAuSxrnAf053mOX43wfH3YRz1QFlQ==
X-Received: by 2002:a17:906:7d8c:b0:7ae:159d:1146 with SMTP id v12-20020a1709067d8c00b007ae159d1146mr15255439ejo.528.1667677716871;
        Sat, 05 Nov 2022 12:48:36 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id fe11-20020a056402390b00b00461b169c02csm1555318edb.91.2022.11.05.12.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 12:48:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 2/2] bus: sunxi-rsb: Support atomic transfers
Date: Sat, 05 Nov 2022 20:48:35 +0100
Message-ID: <4752203.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <4779430.31r3eYUQgx@jernej-laptop>
References: <20221105191954.14360-1-samuel@sholland.org> <20221105191954.14360-3-samuel@sholland.org> <4779430.31r3eYUQgx@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 05. november 2022 ob 20:46:47 CET je Jernej =C5=A0krabec napisa=
l(a):
> Dne sobota, 05. november 2022 ob 20:19:53 CET je Samuel Holland napisal(a=
):
> > When communicating with a PMIC during system poweroff (pm_power_off()),
> > IRQs are disabled and we are in a RCU read-side critical section, so we
> > cannot use wait_for_completion_io_timeout(). Instead, poll the status
> > register for transfer completion.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>

Also a fixes tag would be in order here.

Best regards,
Jernej

> > ---
> >=20
> >  drivers/bus/sunxi-rsb.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> > index 17343cd75338..0f0e498d4379 100644
> > --- a/drivers/bus/sunxi-rsb.c
> > +++ b/drivers/bus/sunxi-rsb.c
> > @@ -267,6 +267,9 @@ EXPORT_SYMBOL_GPL(sunxi_rsb_driver_register);
> >=20
> >  /* common code that starts a transfer */
> >  static int _sunxi_rsb_run_xfer(struct sunxi_rsb *rsb)
> >  {
> >=20
> > +	bool timeout;
> > +	u32 status;
> > +
> >=20
> >  	if (readl(rsb->regs + RSB_CTRL) & RSB_CTRL_START_TRANS) {
> >  =09
> >  		dev_dbg(rsb->dev, "RSB transfer still in progress\n");
> >  		return -EBUSY;
> >=20
> > @@ -279,8 +282,16 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb *r=
sb)
> >=20
> >  	writel(RSB_CTRL_START_TRANS | RSB_CTRL_GLOBAL_INT_ENB,
> >  =09
> >  	       rsb->regs + RSB_CTRL);
> >=20
> > -	if (!wait_for_completion_io_timeout(&rsb->complete,
> > -
>=20
> msecs_to_jiffies(100))) {
>=20
> > +	if (irqs_disabled()) {
> > +		timeout =3D readl_poll_timeout_atomic(rsb->regs +
>=20
> RSB_INTS,
>=20
> > +						    status,
>=20
> status, 10, 100000);
>=20
> It would be good to check only for RSB_INTS_LOAD_BSY, RSB_INTS_TRANS_ERR =
and
> RSB_INTS_TRANS_OVER flags and clear them afterwards. That way we avoid
> problems if this path is used outside power off case.
>=20
> Best regards,
> Jernej
>=20
> > +	} else {
> > +		timeout =3D !wait_for_completion_io_timeout(&rsb-
> >
> >complete,
> >
> > +
>=20
> msecs_to_jiffies(100));
>=20
> > +		status =3D rsb->status;
> > +	}
> > +
> > +	if (timeout) {
> >=20
> >  		dev_dbg(rsb->dev, "RSB timeout\n");
> >  	=09
> >  		/* abort the transfer */
> >=20
> > @@ -292,18 +303,18 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb
> > *rsb)
> >=20
> >  		return -ETIMEDOUT;
> >  =09
> >  	}
> >=20
> > -	if (rsb->status & RSB_INTS_LOAD_BSY) {
> > +	if (status & RSB_INTS_LOAD_BSY) {
> >=20
> >  		dev_dbg(rsb->dev, "RSB busy\n");
> >  		return -EBUSY;
> >  =09
> >  	}
> >=20
> > -	if (rsb->status & RSB_INTS_TRANS_ERR) {
> > -		if (rsb->status & RSB_INTS_TRANS_ERR_ACK) {
> > +	if (status & RSB_INTS_TRANS_ERR) {
> > +		if (status & RSB_INTS_TRANS_ERR_ACK) {
> >=20
> >  			dev_dbg(rsb->dev, "RSB slave nack\n");
> >  			return -EINVAL;
> >  	=09
> >  		}
> >=20
> > -		if (rsb->status & RSB_INTS_TRANS_ERR_DATA) {
> > +		if (status & RSB_INTS_TRANS_ERR_DATA) {
> >=20
> >  			dev_dbg(rsb->dev, "RSB transfer data
>=20
> error\n");
>=20
> >  			return -EIO;
> >  	=09
> >  		}




