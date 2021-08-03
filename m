Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BFC70
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Aug 2021 06:07:10 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id qk33so34588329ejc.12
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Aug 2021 23:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3r+75DACLv5UUEGAMg/p6dRcOLqZwifCJvbUYocHdso=;
        b=t+VGVJ3CQj5LZ3tfmjte2QwHY0kpdQJXZpNvVg5efqsDIbP8CP6JmmPAb3HSAiVIqt
         c6+VIpY9Pd3FSLaoiKepJwlnYQeglAmEf+6DCUDal6qhQfsPCx6Lpk3FciGHa9R7SBHj
         x3b0h5H1lR5IKiCyBEyM/eHgXLomeO3olR/61dCBBtpXy1Iv+KEyolcmMB/WWLvZraln
         5QGI6HP0yXFyCmP+0N7ptO0CPavxi8C0LSwy2pZmn2a7gMesutvlT6FUCdWClTeZ2I7Y
         RdDeZZFLHOHfXGtrRm3bMrUvutphD4m4sD4IDfOL95L8YKN2y/jWX6LRU+45oXY0UL+S
         7ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3r+75DACLv5UUEGAMg/p6dRcOLqZwifCJvbUYocHdso=;
        b=J2k++63NGwNX3zyTcdzOD9yTEovdehhUKcI3sy7Jg+qbHbxbyu1J1TNc3ys+voONdU
         E2j25c05LHjYmWWLUzlMQDjPlLq547n9iTnXIeO/k2G9SEyMDmIvnLAYegajIl4FVHHe
         VE9EAEp3P1b4wya0zE+stoSNvAnKF1nfELCidktZgYWlNFPvUJPUmqFbgEkd/zzeN2V/
         AOTQuB6vG5tIu6iJjQGvfCk+nnn6tXz9XA2flQaM1it3/v75ZpfAbAE1w0mkDF9JsbEd
         TJ67hE4epSu6ZUEAkQuxUP8iCP3M8JulbH2ljZZDqJZWTGIxBykrM1OPXK0BJveTey60
         Yt1w==
X-Gm-Message-State: AOAM530DoqO6KTIKrAYrhSI8emoVOSZteTjneBeyk8epn+OLSEhEIq34
	YUQcgNtlxmmyMwldyFk+ZIELIMrzAwSvJSGVXZU=
X-Google-Smtp-Source: ABdhPJy17ovymExQ6CM3PLsr4+BkDdHTeZRWwscEb/mx09eomxeVIh1K2yppOon6bmFvRWAaOVN8Ox0oUVjrKM0f13M=
X-Received: by 2002:a17:906:a890:: with SMTP id ha16mr549039ejb.73.1627970829399;
 Mon, 02 Aug 2021 23:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210726152724.2281408-1-mudongliangabcd@gmail.com>
 <YQg4lehajLpQjyPd@Red> <CAD-N9QWvR-7caWCnk1CMo8sWPEC=CfKU2_v=YkTVr0o5L7wehA@mail.gmail.com>
In-Reply-To: <CAD-N9QWvR-7caWCnk1CMo8sWPEC=CfKU2_v=YkTVr0o5L7wehA@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 3 Aug 2021 14:06:43 +0800
Message-ID: <CAD-N9QVfreHCV7673DVq6aS3+3RYQ4-x8eZuGF0pvUbRhTL-Cg@mail.gmail.com>
Subject: Re: [PATCH] crypto: sun8i-ce: fix multiple memory leaks in sun8i_ce_hash_run
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@google.com>, 
	Xiang Chen <chenxiang66@hisilicon.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Corentin Labbe <clabbe@baylibre.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 1:57 PM Dongliang Mu <mudongliangabcd@gmail.com> wro=
te:
>
> On Tue, Aug 3, 2021 at 2:25 AM Corentin Labbe <clabbe.montjoie@gmail.com>=
 wrote:
> >
> > Le Mon, Jul 26, 2021 at 11:27:12PM +0800, Dongliang Mu a =C3=A9crit :
> > > In sun8i_ce_hash_run, all the dma_mmap_sg/single will cause memory le=
ak
> > > due to no corresponding unmap operation if errors happen.
> > >
> > > Fix this by adding error handling part for all the dma_mmap_sg/single=
.
> > >
> >
> > I think it could be better worded, error handling is already there (but=
 bad).
>
> Sure. How about "Fix this by freeing the objects allocated by
> dma_mmap_sg/single when errors occur."?
>
> >
> > > Fixes: 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > ---
> > >  .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 28 +++++++++--------=
--
> > >  1 file changed, 13 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/driv=
ers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > > index 88194718a806..d454ad99deee 100644
> > > --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > > +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > > @@ -286,16 +286,14 @@ int sun8i_ce_hash_run(struct crypto_engine *eng=
ine, void *breq)
> > >
> > >       /* the padding could be up to two block. */
> > >       buf =3D kzalloc(bs * 2, GFP_KERNEL | GFP_DMA);
> > > -     if (!buf) {
> > > -             err =3D -ENOMEM;
> > > -             goto theend;
> >
> > Please keep all goto error for being consistent.
>
> OK, no problem.
>
> BTW, usually for the 1st malloc failure, I prefer returning with errno di=
rectly.

For this case, as crypto_finalize_hash_request must be executed, so
directly return is incorrect. I will add a goto label before
crypto_finalize_hash_request.

>
> >
> > > -     }
> > > +     if (!buf)
> > > +             return -ENOMEM;
> > >       bf =3D (__le32 *)buf;
> > >
> > >       result =3D kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
> > >       if (!result) {
> > > -             err =3D -ENOMEM;
> > > -             goto theend;
> > > +             kfree(buf);
> > > +             return -ENOMEM;
> > >       }
> > >
> > >       flow =3D rctx->flow;
> > > @@ -321,7 +319,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> > >       if (nr_sgs <=3D 0 || nr_sgs > MAX_SG) {
> > >               dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
> > >               err =3D -EINVAL;
> > > -             goto theend;
> > > +             goto err_result;
> > >       }
> > >
> > >       len =3D areq->nbytes;
> > > @@ -334,7 +332,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> > >       if (len > 0) {
> > >               dev_err(ce->dev, "remaining len %d\n", len);
> > >               err =3D -EINVAL;
> > > -             goto theend;
> > > +             goto err_unmap_sg;
> > >       }
> > >       addr_res =3D dma_map_single(ce->dev, result, digestsize, DMA_FR=
OM_DEVICE);
> > >       cet->t_dst[0].addr =3D cpu_to_le32(addr_res);
> > > @@ -342,7 +340,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> > >       if (dma_mapping_error(ce->dev, addr_res)) {
> > >               dev_err(ce->dev, "DMA map dest\n");
> > >               err =3D -EINVAL;
> > > -             goto theend;
> > > +             goto err_unmap_sg;
> > >       }
> > >
> > >       byte_count =3D areq->nbytes;
> > > @@ -392,7 +390,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> > >       if (dma_mapping_error(ce->dev, addr_pad)) {
> > >               dev_err(ce->dev, "DMA error on padding SG\n");
> > >               err =3D -EINVAL;
> > > -             goto theend;
> > > +             goto err_addr_res;
> > >       }
> > >
> > >       if (ce->variant->hash_t_dlen_in_bits)
> > > @@ -405,15 +403,15 @@ int sun8i_ce_hash_run(struct crypto_engine *eng=
ine, void *breq)
> > >       err =3D sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(areq->b=
ase.tfm));
> > >
> > >       dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
> > > +err_addr_res:
> > > +     dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE=
);
> > > +err_unmap_sg:
> > >       dma_unmap_sg(ce->dev, areq->src, sg_nents(areq->src),
> > >                    DMA_TO_DEVICE);
> > > -     dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE=
);
> > > -
> > > -
> > >       memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
> >
> > The result should be copied only when everything is ok. Please add a "i=
f (!err)"
>
> Sure.
>
> >
> > Thanks for your work
> > Regards
