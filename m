Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793050952;
	b=ChlEah60QJ6hCrnwK0+aty/jCcjxgw36wKr6wFri26Tjh1smjq0H2JEuBKM4OGPMg6nt
	 iDeAyNaFhGIE8RFM4KOlu/Wf+ly3vmlVY9Q7KhREE7hxlo5VFCaxGjmnX7KMXPbhWYFpb
	 3eUCjTm6BYaFyO0dWEgglon/AvXlX8YW51n27pUMr3P+m2oJuAdgIXGFc21YhO/u7MIM+
	 yLTYc0Vp+2+0qOxRuO+3Rvj+l2ZxCb5K3kWBX5aaqUYIhYbyUgn3BsMjX1m8/H9uu7wv4
	 M4NRqcy3FoXkJIxChLPGH5O4vQ4gkI1YPcFz7vwBHFDITpXpAYx8qCx/EodrdqHOlFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
	b=Gk1a5JYeAHPdlsFDsNxuG2V/wxM06w/VaKwFz2/dn26DmkIv9HXsXiq3vJ5RCCjxkTU2
	 BZJvCJWfDBhYJLM1QPVyekXVDZqtFTPkEcy0nR2mk8WsUEdpSrpP7CPQPzleDVQgrpr0D
	 8MIb0fByu55pxTg5v0fnwquuMJXyKUlPxm0gPYGkfxmnkpbqvmB4qUZqeSwXyteGTjILF
	 CWQdAUSFUi9qXGmOwwOWtQ/CCwQZSuxWO1gAHO8eDmluZCEwMHTzIYeZux2+4zOfN6iCF
	 g+CIu4fdFVYPkRZpNda/qWzVFEEksfKWmnkezuiOaXWBYl1cT31iCoi7W1CxIBbfeGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TboEegik;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1368606A320
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 21:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1368606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TboEegik
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so777997137.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 14:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793050951; cv=none;
        d=google.com; s=arc-20260327;
        b=cIvVn5tzoA+zwU6Lz+MZlY0LCC7cBq37uwcFSgZmDMCzsDg5CcFSqWjAaSdhLViNFf
         sBujvGbBd/kCDLMMi8PCfDzWloBU6HhF7fygxVBaCZCgqWTOMjFaX992VLISPV6/mtSY
         TJwKxvmsBknTvG6zqEHbbzFRgpgOsfKW/HQCayE3J0nIWlWr/XCyy+SvB3SLIL4Gglkx
         x4byyXttwSedN9U+h9W3aYeEEcQCrdHDkHRDTNn7fux1hQyj38roI2IcBtDHYUEFRjY0
         p0kH/sh7USbbWwmPTmp8ORfoRZ+lgKzoc1VrO8lvHIMdfAM3gSLywbQJm0LCxDGLD4Qr
         aUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        fh=9sE3beCEY3EHjrqTwmG0QZBtnvr6OOQeJ0Z7OBgEfUo=;
        b=Su9ltZzO9cmj6PpFh6HsnQkcmTl1JtOsp7ZC0hlSIovuqdvVC0fI253piEtRkWzyKp
         h0GE4SHZcfl3z1cyyrBwaZJifWBX0lQcBCdIKwYegb7dh2R7tDw4Zc3pInQYTL29iHNg
         aL0ak4Eg8xafu3UkHJqnwfqh03lcxXSoqfQnSD/AxNZFPeQ7Pg5HOuNi8YzlkTYFJukx
         1exzFAJZLeC/9HR0PVuLEJJUJOPQfnSRuzhENg8KT9NwoRCb6O0OvJ4JKxDlWfdXRLKG
         l8QJetUp953Uwysug1ccz5qZWMv6LJXgwl9i877PhVkxByUJsfNu9Qy7dHmk2GmURx7I
         hOsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793050951; x=1793655751; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        b=TboEegik884mBMOam/I2h6doQQZTnYmfDZ5Zarv/NLamEtBDbS2N2VGWCkhLwuywem
         Fz5Gs67CrrdSl5prkutYltCqZMGOmvKOe+7ctzrIkxRZ+OREY+tRwg857gFfrAPyVzdn
         /yaMnmlJQRkKgSsH5Kkjlo3pPBPp66SDk9BPHIoAqA8QU8MHLyH5NZil4ehbpEWMgCIB
         H1Mndpw3q8Qz0tAcUIxWVjnSozoL3g2PPAxZ9eHXD8eQ86EbuVoqeX4O4XjhVNcDUOM+
         CDGpjnz2Sq7767ZraN3SaN0/Oxdl7SSsdBpgrH7ouuWasi8xAzELSaY/30/jrcLcnt7W
         ywhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050951; x=1793655751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        b=Wmb7917LURnIeWNQwbJGuyye5g2Bwh5vFiIVUKUprj3vO63aUnJ80Afh9XPADlg5UE
         e5D4RB6icDfvIfEPqMXoxuKaOXP/MqNZbnVP6e0MFffb5kWdfQqKn5dY1TT7n49WMhqb
         Vk8t4jAmLSFf3EBV84k/7QEo+/vMY5bdyiiunYH7bTG9J65pe8jPjorlq26y3hTqdnxB
         sES+TP63H/RbZDSCBjhMoLF5UpfmtgeUnpWDCGmKbX7VssAzLW+CxPQNA3LhoZhRdjPP
         0dXsf9nDcHvHxOgf6weuRWWQDkyvV/5Ri1M7hlKjAeep+EIcOAe/yLOTb/+qOfHT4q2K
         jGpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgCYvCxyYlbrMUcn86Kwx0p4dOO4W/sIOdX0k70ZPJWEuAAtI/s5I3sWjnPBWvct3jLPSJnlIgd4R8iA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKqUT6LsQ+xRuM5fo3JjV8eZFf+j6uBiEfOz9iXij3hIzg6mCQn
	shXjOWTbf9z4BCpQDIA6JttllGtkGE/umr6I2IAVIMddO0LuMHYi/7sqDtl0rsNsC3AaSbJbbq+
	t/QajF/3/YAJ6f/E16mtfsYhaNX7ytys=
X-Gm-Gg: AYBFou2Vik+Y6xoQvG1c4ltZiGAuieoKzjmKrwyNDhNQMXJenJBvtgq1S2E5wjS4iix
	77hq9D9h75q+5RUHJUdzc+Gxn52XLwZY4stbF57DMhLoJTB1gJU9kUmVFs+O9jB9Jz2o1FaSnri
	QOW7eQSu+hEvoAUjA49uYAi7kJL4TQL2QmQDm1No4Yr6jQ5CZiyok5bHeTvWU38hdE0GMXxETN3
	iEFR1ClRmawMSkcV4P+f9l8N5NUYIycmLvX4T+WXZ8BXtCnqP3xKMbfTSnmLTboLtQLbKEIdgBf
	4PYsc1I63KKcn/RG19PMNwDFWDob9jDEP5RgyYRn9s0EQ9E93Z6wfdOCZonLekadWPVWDbfXIVd
	f3S5xNphzgItNvzC4GHQUyE0H2fO87LWf4FQoS9ZgvDZqe+i3/4bdMsWh4GHd6gVDPmC1zkZVvG
	m3K4wFZ12xVhwLP9JaWVYNVwFwVgrvUgwwBPPKydBVIvOtAwpwZF20+JdjrYc/sWKuCtxMvQpd0
	PHV1/jPE+v7YiKAOz9ZRXNf9vLqPw==
X-Received: by 2002:a05:6102:334b:b0:7cc:33c9:b3d2 with SMTP id
 ada2fe7eead31-7ce5cdcaeecmr2526579137.25.1793050950510; Mon, 26 Oct 2026
 14:42:30 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com> <at_CpZrmQ986UEqv@SMW015318>
In-Reply-To: <at_CpZrmQ986UEqv@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 15:42:18 -0600
X-Gm-Features: AclHuK-4-WgnFSyD4HMuuPSJHkf08GLM_LN-zKGiCU3BeJkAlzKME5OQQIP7X_g
Message-ID: <CADvTj4ptPZeNsjrdB9Lr2aJe9FKJ+w1m0ATfwXhO=zEo0APtvA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel ownership
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:14=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 05:38:23PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an unprotected owner snapshot. Termination can miss =
a
> > new assignment or detach an owner while an interrupt is about to comple=
te
> > its descriptor. A sampled IRQ can also be applied after reassignment.
> >
> > Protect physical-channel ownership with sdev->lock across allocation,
> > interrupt handling, pause, termination and residue queries. Read and
> > acknowledge IRQ status under that lock, and allocate and start each pen=
ding
> > channel in the same critical section. This also serializes updates to t=
he
> > shared interrupt-enable registers.
> >
> > Nest vc.lock inside the device lock when accessing descriptor lists or
> > updating cookies, including cyclic notifications. virt-dma takes vc.loc=
k
> > independently when preparing, submitting and completing descriptors, so
> > the device lock does not replace it. Client callbacks run outside both
> > locks in the virtual-channel tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-----------------=
--------
> >  1 file changed, 33 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 435d7daa1c0f..d3a63c866645 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -217,6 +217,10 @@ struct sun6i_dma_dev {
> >       struct clk              *clk;
> >       struct clk              *clk_mbus;
> >       int                     irq;
> > +     /*
> > +      * Physical channels, pending list and registers; nests outside v=
c.lock.
> > +      * virt-dma also takes vc.lock independently for its lists and co=
okies.
> > +      */
> >       spinlock_t              lock;
> >       struct reset_control    *rstc;
> >       struct tasklet_struct   task;
> > @@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_stru=
ct *t)
> >       struct sun6i_dma_dev *sdev =3D from_tasklet(sdev, t, task);
> >       struct sun6i_vchan *vchan;
> >       struct sun6i_pchan *pchan;
> > -     unsigned int pchan_alloc =3D 0;
> >       unsigned int pchan_idx;
> >
> > +     spin_lock_irq(&sdev->lock);
> >       list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_=
node) {
> > -             spin_lock_irq(&vchan->vc.lock);
> > +             spin_lock(&vchan->vc.lock);
> >
> >               pchan =3D vchan->phy;
> >
> > @@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struc=
t *t)
> >                               pchan->vchan =3D NULL;
> >                       }
> >               }
> > -             spin_unlock_irq(&vchan->vc.lock);
> > +             spin_unlock(&vchan->vc.lock);
> >       }
> >
> > -     spin_lock_irq(&sdev->lock);
> >       for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) =
{
> >               pchan =3D &sdev->pchans[pchan_idx];
> >
> > @@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_stru=
ct *t)
> >
> >               vchan =3D list_first_entry(&sdev->pending,
> >                                        struct sun6i_vchan, node);
> > +             spin_lock(&vchan->vc.lock);
> >
> >               /* Remove from pending channels */
> >               list_del_init(&vchan->node);
> > -             pchan_alloc |=3D BIT(pchan_idx);
> >
> >               /* Mark this channel allocated */
> >               pchan->vchan =3D vchan;
> >               vchan->phy =3D pchan;
> >               dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
> >                       pchan->idx, &vchan->vc);
> > +             sun6i_dma_start_desc(vchan);
> > +             spin_unlock(&vchan->vc.lock);
> >       }
> >       spin_unlock_irq(&sdev->lock);
> > -
> > -     for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) =
{
> > -             if (!(pchan_alloc & BIT(pchan_idx)))
> > -                     continue;
> > -
> > -             pchan =3D sdev->pchans + pchan_idx;
> > -             vchan =3D pchan->vchan;
> > -             if (vchan) {
> > -                     spin_lock_irq(&vchan->vc.lock);
> > -                     sun6i_dma_start_desc(vchan);
> > -                     spin_unlock_irq(&vchan->vc.lock);
> > -             }
> > -     }
> >  }
> >
> >  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> > @@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, vo=
id *dev_id)
> >       u32 channels_per_reg =3D sdev->cfg->num_channels_per_reg;
> >       struct sun6i_vchan *vchan;
> >       struct sun6i_pchan *pchan;
> > +     unsigned long flags;
> >       int i, j, ret =3D IRQ_NONE;
> >       u32 status;
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> >       for (i =3D 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg=
); i++) {
> >               status =3D sun6i_read_irq_stat(sdev, i);
> >               if (!status)
> > @@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, v=
oid *dev_id)
> >                       pchan =3D sdev->pchans + i * channels_per_reg + j=
;
> >                       vchan =3D pchan->vchan;
> >                       if (vchan && (status & vchan->irq_type)) {
> > +                             spin_lock(&vchan->vc.lock);
> >                               if (vchan->cyclic) {
> >                                       vchan_cyclic_callback(&pchan->des=
c->vd);
> >                               } else {
> > -                                     spin_lock(&vchan->vc.lock);
> >                                       vchan_cookie_complete(&pchan->des=
c->vd);
> >                                       pchan->done =3D pchan->desc;
> > -                                     spin_unlock(&vchan->vc.lock);
> >                               }
> > +                             spin_unlock(&vchan->vc.lock);
> >                       }
> >
> >                       status =3D status >> DMA_IRQ_CHAN_WIDTH;
> > @@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, voi=
d *dev_id)
> >                       tasklet_schedule(&sdev->task);
> >               ret =3D IRQ_HANDLED;
> >       }
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return ret;
> >  }
> > @@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
> >  {
> >       struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       unsigned long flags;
> >
> >       dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc=
);
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> > +     pchan =3D vchan->phy;
> >       if (pchan) {
> >               writel(DMA_CHAN_PAUSE_PAUSE,
> >                      pchan->base + DMA_CHAN_PAUSE);
> >       } else {
> > -             spin_lock_irqsave(&sdev->lock, flags);
> >               list_del_init(&vchan->node);
>
> suppose need vchan lock here?

vchan->node links the channel into sdev->pending; it is separate from
virt-dma's descriptor-list nodes. All runtime accesses to that pending
list are protected by sdev->lock.

The same lock protects vchan->phy, so it also keeps the physical-channel
assignment stable while pause() checks it and either pauses the hardware
or removes the channel from the pending list.

resume() additionally needs vc.lock because it inspects vc.desc_issued,
and issue_pending() needs it to move descriptors between virt-dma lists.
pause() does not access those lists or cookies, so taking vc.lock here
would not protect any additional state.

>
> Frank
> > -             spin_unlock_irqrestore(&sdev->lock, flags);
> >       }
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return 0;
> >  }
> > @@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_cha=
n *chan)
> >  {
> >       struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       unsigned long flags;
> >       LIST_HEAD(head);
> >
> >       spin_lock_irqsave(&sdev->lock, flags);
> > +     spin_lock(&vchan->vc.lock);
> > +     pchan =3D vchan->phy;
> >       list_del_init(&vchan->node);
> > -     spin_unlock_irqrestore(&sdev->lock, flags);
> > -
> > -     spin_lock_irqsave(&vchan->vc.lock, flags);
> >
> >       if (pchan && pchan->desc && pchan->desc !=3D pchan->done) {
> >               struct virt_dma_desc *vd =3D &pchan->desc->vd;
> > @@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_cha=
n *chan)
> >               pchan->done =3D NULL;
> >       }
> >
> > -     spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > +     spin_unlock(&vchan->vc.lock);
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       vchan_dma_desc_free_list(&vchan->vc, &head);
> >
> > @@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct=
 dma_chan *chan,
> >                                          dma_cookie_t cookie,
> >                                          struct dma_tx_state *state)
> >  {
> > +     struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       struct sun6i_dma_lli *lli;
> >       struct virt_dma_desc *vd;
> >       struct sun6i_desc *txd;
> > @@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(stru=
ct dma_chan *chan,
> >       unsigned long flags;
> >       size_t bytes =3D 0;
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> > +     spin_lock(&vchan->vc.lock);
> >       ret =3D dma_cookie_status(chan, cookie, state);
> >       if (ret =3D=3D DMA_COMPLETE || !state)
> > -             return ret;
> > -
> > -     spin_lock_irqsave(&vchan->vc.lock, flags);
> > +             goto out;
> > +     pchan =3D vchan->phy;
> >
> >       vd =3D vchan_find_desc(&vchan->vc, cookie);
> >       txd =3D to_sun6i_desc(&vd->tx);
> > @@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struc=
t dma_chan *chan,
> >               bytes =3D sun6i_get_chan_size(pchan);
> >       }
> >
> > -     spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > -
> >       dma_set_residue(state, bytes);
> > +out:
> > +     spin_unlock(&vchan->vc.lock);
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return ret;
> >  }
> >
> > --
> > 2.53.0
> >
