Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9E12294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:05:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v27so18901572eda.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCTpqEx+nj1n6HjmRbfujsCzReaOepaCfo3WlWBlSOs=;
        b=kkw8H1QERm0GF5D+iS4KT6fZ4SYYp6uvTjhGEoGPgwq4dVWvWQjaCel2y3WVJlaOaE
         e5RStAF8t1Pu63/2phYMxZ3eMnlV8avzvgW8eaZg0kjlNhuonZsrQ+N3F29oFWWrbQJa
         0XVweEG5LvZrQIkVPfXx6PQxtjzmogkRZ8eqbG/jSCdy2MHJMkMLcPkpBEt1otOhJYmn
         /5Sc1TtwiGnxrxCE2p+iu+jd3zCXnPCD0XO8jVbQI6zSVlLPWgVWZ53XA5kXJlQFadqg
         et0hOf+R8C8fwCn5J8LpjKtYNuZiFG6vjBLWY1Oo5dx42Q4PDYm3/bFeE+WuqhN6s16z
         avfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCTpqEx+nj1n6HjmRbfujsCzReaOepaCfo3WlWBlSOs=;
        b=X/g/cEferRf1AbNKWWSX2D9pEx6gBKnlSQbTVuZu3s+tnyJudH8vO5CSjjkv5RT4MN
         kkxpE11r+091ojWu2hLuDaOYlz6q+2VhF28pcnxh524PoOvgWuB/bNN0SOhWj4w74MWF
         u3/gEGd2ABne2l27naUghgd+KTdMpRm68924N4wUAby6sxYq5n4GvpYnBZVJeV8eYzQO
         QQmV4NtU2thVV6dIisAn1aSCeNObXI09npSeUTnaTY+V3rBoRBDdOKISKMBA1xslCOlI
         ffApMlmR6YoIIDBJMcB+U4zOyUZAfI+BVYU1TonAY/i5MnIWFXAcxGt5bp/Brwae8m8g
         jszw==
X-Gm-Message-State: ACrzQf08+r1R54zmAWSUtdb5uUB7d7jPCHagIxX2PuDfMTO+NNdsF7iM
	5Qa/VMDe0aGa3mhBnSAFx7M=
X-Google-Smtp-Source: AMsMyM6Goj84logVrQ5XP20UoYPJnj8X72vsGoAAviPjLBcIzvX+wqD4eLNfV4AQDTIEyo+FSyuFaQ==
X-Received: by 2002:a05:6402:1d4f:b0:461:d2ed:788c with SMTP id dz15-20020a0564021d4f00b00461d2ed788cmr51595245edb.418.1667844335245;
        Mon, 07 Nov 2022 10:05:35 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090653d400b007adf2e4c6f7sm3694732ejo.195.2022.11.07.10.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:05:34 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH v2 2/2] bus: sunxi-rsb: Support atomic transfers
Date: Mon, 07 Nov 2022 19:05:33 +0100
Message-ID: <1929426.usQuhbGJ8B@kista>
In-Reply-To: <20221107112949.21f52e50@donnerap.cambridge.arm.com>
References: <20221107052201.65477-1-samuel@sholland.org> <20221107052201.65477-3-samuel@sholland.org> <20221107112949.21f52e50@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 12:30:29 CET je Andre Przywara 
napisal(a):
> On Sun,  6 Nov 2022 23:22:00 -0600
> Samuel Holland <samuel@sholland.org> wrote:
> 
> Hi,
> 
> > When communicating with a PMIC during system poweroff (pm_power_off()),
> > IRQs are disabled and we are in a RCU read-side critical section, so we
> > cannot use wait_for_completion_io_timeout(). Instead, poll the status
> > register for transfer completion.
> > 
> > Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> > Serial Bus") Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> > Changes in v2:
> >  - Add Fixes tag to patch 2
> >  - Only check for specific status bits when polling
> >  
> >  drivers/bus/sunxi-rsb.c | 27 ++++++++++++++++++++-------
> >  1 file changed, 20 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> > index 17343cd75338..012e82f9b7b0 100644
> > --- a/drivers/bus/sunxi-rsb.c
> > +++ b/drivers/bus/sunxi-rsb.c
> > @@ -267,6 +267,9 @@ EXPORT_SYMBOL_GPL(sunxi_rsb_driver_register);
> > 
> >  /* common code that starts a transfer */
> >  static int _sunxi_rsb_run_xfer(struct sunxi_rsb *rsb)
> >  {
> > 
> > +	u32 int_mask, status;
> > +	bool timeout;
> > +
> > 
> >  	if (readl(rsb->regs + RSB_CTRL) & RSB_CTRL_START_TRANS) {
> >  	
> >  		dev_dbg(rsb->dev, "RSB transfer still in progress\n");
> >  		return -EBUSY;
> > 
> > @@ -274,13 +277,23 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb
> > *rsb)
> > 
> >  	reinit_completion(&rsb->complete);
> > 
> > -	writel(RSB_INTS_LOAD_BSY | RSB_INTS_TRANS_ERR | 
RSB_INTS_TRANS_OVER,
> > +	int_mask = RSB_INTS_LOAD_BSY | RSB_INTS_TRANS_ERR | 
RSB_INTS_TRANS_OVER;
> > +	writel(int_mask,
> > 
> >  	       rsb->regs + RSB_INTE);
> >  	
> >  	writel(RSB_CTRL_START_TRANS | RSB_CTRL_GLOBAL_INT_ENB,
> >  	
> >  	       rsb->regs + RSB_CTRL);
> > 
> > -	if (!wait_for_completion_io_timeout(&rsb->complete,
> > -					    
msecs_to_jiffies(100))) {
> > +	if (irqs_disabled()) {
> > +		timeout = readl_poll_timeout_atomic(rsb->regs + 
RSB_INTS,
> > +						    status, 
(status & int_mask),
> > +						    10, 
100000);
> 
> So if I understand correctly, this mimics the operation of
> sunxi_rsb_irq(), just replacing rsb->status with status.
> But wouldn't that also mean that we need to clear the interrupt bits in
> INTS, since we are about to handle them below?

Yes, I pointed out that in review of v1.

Best regards,
Jernej

> 
> It probably doesn't matter in practise, since we call this during power
> down only, but looks like more robust to do, from a driver's perspective.
> 
> Cheers,
> Andre
> 
> > +	} else {
> > +		timeout = !wait_for_completion_io_timeout(&rsb-
>complete,
> > +							  
msecs_to_jiffies(100));
> > +		status = rsb->status;
> > +	}
> > +
> > +	if (timeout) {
> > 
> >  		dev_dbg(rsb->dev, "RSB timeout\n");
> >  		
> >  		/* abort the transfer */
> > 
> > @@ -292,18 +305,18 @@ static int _sunxi_rsb_run_xfer(struct sunxi_rsb
> > *rsb)
> > 
> >  		return -ETIMEDOUT;
> >  	
> >  	}
> > 
> > -	if (rsb->status & RSB_INTS_LOAD_BSY) {
> > +	if (status & RSB_INTS_LOAD_BSY) {
> > 
> >  		dev_dbg(rsb->dev, "RSB busy\n");
> >  		return -EBUSY;
> >  	
> >  	}
> > 
> > -	if (rsb->status & RSB_INTS_TRANS_ERR) {
> > -		if (rsb->status & RSB_INTS_TRANS_ERR_ACK) {
> > +	if (status & RSB_INTS_TRANS_ERR) {
> > +		if (status & RSB_INTS_TRANS_ERR_ACK) {
> > 
> >  			dev_dbg(rsb->dev, "RSB slave nack\n");
> >  			return -EINVAL;
> >  		
> >  		}
> > 
> > -		if (rsb->status & RSB_INTS_TRANS_ERR_DATA) {
> > +		if (status & RSB_INTS_TRANS_ERR_DATA) {
> > 
> >  			dev_dbg(rsb->dev, "RSB transfer data 
error\n");
> >  			return -EIO;
> >  		
> >  		}


