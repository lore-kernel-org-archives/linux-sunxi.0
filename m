Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C970
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 07:05:34 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id oz16so6381108ejc.7
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QzFrnn4/EByGWqfuBWRVUIBP6//KrlgR4YFAj4ObM4o=;
        b=VkPMZsULx4/+6BKCp2u6FhxPWCEMPD9uhYGBOMxqg+3Z8RFu7AyixOitCZnhKRAIzx
         WGl4uM0Bh/EhOf381B18dyPdz6t1nyeHV7H5bx+uvG3rdCgGOZ0z0xYEA0/P6thT92AG
         olkRLeqQbfpCnhhAckDSqwstoxtj/rcVdjHOqZJ3hLzK4zQ8Bj63J5HmLt7+65UFceI3
         gb42S4AGsS1y6hQKENXR5Zna4g9F03GDVaYBWvFl1AVMtuz06hUhmwLZ3KRwkVrGmmym
         v+7Ov68FXiglTGzylWUOPP0XwkMupaIXsej26jIV46tU8ERZpTGectfVTif0+R71njvt
         Uw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QzFrnn4/EByGWqfuBWRVUIBP6//KrlgR4YFAj4ObM4o=;
        b=c0IuSWrxGMYfe43GYUBoSsiZp55WgRaMDmlwxhPqaUEZdFCgiKvQZA9SGmVVvW+mQk
         Z//SxtqEuvnw+dxvzxBxgkgb+v7E0WSNMwb9btV/Uas2ePOvdorHygKS3lJqtbLmCor6
         8lJd03KDI7HBH6MxfGZ6wcBolswEJydQaJD7rSkgbrGf6zr7APG5jrZTLDAnszK3vp+M
         fSyNfsUrJqg52chMS+YlF/HyAX2FkNJ3GiOY6lJeq6vIRznNh8MJsu0M2N1f9D2fnXlW
         6xKBxZOezj+A/JNAaa01xgMJNHFEIp+YhJLJR8RXRZKJX0pdcwpB49AkfO7Vy6/OhyI1
         iluQ==
X-Gm-Message-State: AOAM533Az01OXLoJSSWDQS32vfsxL8r9gZ+i6WvOGCmWLV3fWwkNHjib
	bsU9oJoAaPqYvZnJ5LQO0b5Mc61ycjSAuaEvxkQ=
X-Google-Smtp-Source: ABdhPJxxFbtn8wZEe7zkDx4UOP1R20r53d6SHo5S6ATGj4BY70Ot6+z1YN7H9ysPwtXEfBpsXZxzjr0zZjCD+mF32FI=
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr16252428ejz.73.1627283132598;
 Mon, 26 Jul 2021 00:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210726062801.2078117-1-mudongliangabcd@gmail.com> <YP5aqtmAXS4xNtv/@Red>
In-Reply-To: <YP5aqtmAXS4xNtv/@Red>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 26 Jul 2021 15:05:06 +0800
Message-ID: <CAD-N9QUaNX=qYM9qKDcqOC85sF1UaxHN=TMmg0XmmBPcOEa+fA@mail.gmail.com>
Subject: Re: [PATCH] crypto: sun8i-ce: fix memory leak and return value of sun8i_ce_hash_run
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@google.com>, 
	Colin Ian King <colin.king@canonical.com>, Xiang Chen <chenxiang66@hisilicon.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2021 at 2:48 PM Corentin Labbe
<clabbe.montjoie@gmail.com> wrote:
>
> Le Mon, Jul 26, 2021 at 02:27:50PM +0800, Dongliang Mu a =C3=A9crit :
> > This patch fixes some memory leak caused by dma_mmap_sg/single
> > in the error handling code. In addition, it fixes the return value
> > when errors related with dma_mmap_sg/single occur.
> >
> > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > Fixes: 732b764099f65 ("crypto: sun8i-ce - fix two error path's memory l=
eak")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 37 ++++++++++---------
> >  1 file changed, 20 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/driver=
s/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> > index 3c073eb3db03..7c4ed19f5466 100644
> > --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> > +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> > @@ -324,11 +324,11 @@ int sun8i_ss_hash_run(struct crypto_engine *engin=
e, void *breq)
> >       struct sun8i_ss_alg_template *algt;
> >       struct sun8i_ss_dev *ss;
> >       struct scatterlist *sg;
> > -     int nr_sgs, err, digestsize;
> > +     int j, i, todo, nr_sgs, tmp_err, digestsize;
> > +     int err =3D 0;
> >       unsigned int len;
> >       u64 fill, min_fill, byte_count;
> >       void *pad, *result;
> > -     int j, i, todo;
> >       __be64 *bebits;
> >       __le64 *lebits;
> >       dma_addr_t addr_res, addr_pad;
> > @@ -368,14 +368,14 @@ int sun8i_ss_hash_run(struct crypto_engine *engin=
e, void *breq)
> >       if (nr_sgs <=3D 0 || nr_sgs > MAX_SG) {
> >               dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
> >               err =3D -EINVAL;
> > -             goto theend;
> > +             goto err_result;
> >       }
> >
> >       addr_res =3D dma_map_single(ss->dev, result, digestsize, DMA_FROM=
_DEVICE);
> >       if (dma_mapping_error(ss->dev, addr_res)) {
> >               dev_err(ss->dev, "DMA map dest\n");
> >               err =3D -EINVAL;
> > -             goto theend;
> > +             goto err_unmap_sg;
> >       }
> >
> >       len =3D areq->nbytes;
> > @@ -390,7 +390,7 @@ int sun8i_ss_hash_run(struct crypto_engine *engine,=
 void *breq)
> >       if (len > 0) {
> >               dev_err(ss->dev, "remaining len %d\n", len);
> >               err =3D -EINVAL;
> > -             goto theend;
> > +             goto err_addr_res;
> >       }
> >
> >       byte_count =3D areq->nbytes;
> > @@ -421,27 +421,30 @@ int sun8i_ss_hash_run(struct crypto_engine *engin=
e, void *breq)
> >       }
> >
> >       addr_pad =3D dma_map_single(ss->dev, pad, j * 4, DMA_TO_DEVICE);
> > -     rctx->t_src[i].addr =3D addr_pad;
> > -     rctx->t_src[i].len =3D j;
> > -     rctx->t_dst[i].addr =3D addr_res;
> > -     rctx->t_dst[i].len =3D digestsize / 4;
> >       if (dma_mapping_error(ss->dev, addr_pad)) {
> >               dev_err(ss->dev, "DMA error on padding SG\n");
> >               err =3D -EINVAL;
> > -             goto theend;
> > +             goto err_addr_res;
> >       }
> > +     rctx->t_src[i].addr =3D addr_pad;
> > +     rctx->t_src[i].len =3D j;
> > +     rctx->t_dst[i].addr =3D addr_res;
> > +     rctx->t_dst[i].len =3D digestsize / 4;
> >
> > -     err =3D sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(areq=
->base.tfm));
> > +     tmp_err =3D sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(=
areq->base.tfm));
> > +
> > +     memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
> > +
> > +     crypto_finalize_hash_request(engine, breq, tmp_err);
> >
> >       dma_unmap_single(ss->dev, addr_pad, j * 4, DMA_TO_DEVICE);
> > +err_addr_res:
> > +     dma_unmap_single(ss->dev, addr_res, digestsize, DMA_FROM_DEVICE);
> > +err_unmap_sg:
> >       dma_unmap_sg(ss->dev, areq->src, sg_nents(areq->src),
> >                    DMA_TO_DEVICE);
> > -     dma_unmap_single(ss->dev, addr_res, digestsize, DMA_FROM_DEVICE);
> > -
> > -     memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
> > -theend:
> > +err_result:
> >       kfree(pad);
> >       kfree(result);
> > -     crypto_finalize_hash_request(engine, breq, err);
> > -     return 0;
> > +     return err;
> >  }
>
> Hello
>
> This is wrong, you need to always call crypto_finalize_hash_request()
>
> Do you have tested your changes ? Copying results before dma_unmap() is a=
lso very wrong, this will lead to random cache fail.

I am sorry I don't test my changes due to no PoC or input at hand. If
you know any PoC for me to test, please let me know. Thanks in
advance.

I am not familiar with this code. All my intention is to fix the leak
caused by the incorrect error handling code.

Your reply indicated two pieces of information:

1. crypto_finalize_hash_request must be executed and placed at the end
2. memcpy must be executed after dma_unmap_*() functions.

Any other information I missed? I can address those issues and send a v2 pa=
tch.

>
> Regards
