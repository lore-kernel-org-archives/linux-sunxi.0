Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D8E72
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 15:32:02 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x90so4762781ede.8
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mRghCE9uemL2l6phf1pi3lSsvM3GyyFlNkgm44kAP9E=;
        b=bsj2JvMFZcXilYHqaNJDghFt4dIqQ5yUNZWk14BP7QVHElB8WKAtCoq7yjraGnyOGn
         xt+zF2xe3CokN5POWc0EOoDlHYmKF2in0V88WqyAlVEen7Apo/t9jpa3V5VDmVN9EgjJ
         TPCgLXb5DSVV6TK9XaYXPytiM2tJuWsLU7lAGCP7K5NYiSRdmxi2EvWwUm0ktBh8NfTi
         Pr2TNYl9LpyUIJJ+Tq5o9Pkj/RtQuhbQ+SBGd1rmbjWqmD4sVBArhRBxGdD10cPHSlew
         GyVFw43Euf9xk7k0oy8nruhzf53RjsmGLR5Wh7Z9dzCe4LjRu6sjWImi01+LcAMShGpl
         k47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRghCE9uemL2l6phf1pi3lSsvM3GyyFlNkgm44kAP9E=;
        b=E1hu6wwzE9nTa43GEWU3wEaxqH3QqM3HzMI2yakvKC/lZyuPZPlXBCCgj41Ah5RRkC
         J+4MIp0+0qcSJi07dbJ/yv9sLMARt6oKeV+7VwEhzUeOf/ZvIQj7gbUkw/qxg8zYFk/A
         kyo432t7SaP5lIFQsQXOasjqAuesmX7ZmTQpdHpGJUJruLmTlqfIDN5qtgAg5KWAjAYl
         PMYzU+4NCnbhIq9Yod/wnyXyu8IC+MyO+ULRVLFPde8GopB7FGgEllOtzliOJh1IbOmA
         RDT3FmLcUsHEJYk+88wFVVi0844sWFdoxKmdXaO+GOK4xfROYkocwipFoizDlQQa1DgO
         FWEw==
X-Gm-Message-State: AOAM533vatyDfBeaBmd2rrqnQax4rNJkxmCAoIHt+BurWYXwGuHb5O47
	JY2vlHMgHjzYXVsS3z8MvtLPc2sUIhpmXU7ZV60=
X-Google-Smtp-Source: ABdhPJw4Tmlh2i4lNFoU7+yyIAJQqY7Q37WjZG2z/5WEKc50B1VFqxNcpy3j0UjTZgkbwe8h1In6wNsupmYbJpJQtng=
X-Received: by 2002:a05:6402:270d:: with SMTP id y13mr22349779edd.66.1627313520540;
 Mon, 26 Jul 2021 08:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210726152533.2281139-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210726152533.2281139-1-mudongliangabcd@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 26 Jul 2021 23:31:34 +0800
Message-ID: <CAD-N9QV68AUo9MRXkRBOu950BdfoaWUaNSX9jfxhz5Qkpc4LMQ@mail.gmail.com>
Subject: Re: [PATCH v4] crypto: sun8i-ss: fix multiple memory leaks in sun8i_ss_hash_run
To: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Xiang Chen <chenxiang66@hisilicon.com>, Eric Biggers <ebiggers@google.com>, 
	Dongliang Mu <mudongliangabcd@gmail.com>, Colin Ian King <colin.king@canonical.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 11:25 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> In sun8i_ss_hash_run, all the dma_mmap_sg/single will cause memory leak
> due to no corresponding unmap operation if errors happen.
>
> Fix this by adding error handling part for all the dma_mmap_sg/single.
>
> Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
> v1->v2: move crypto_finalize_hash_request to the end of function; move
> the memcpy after the dma_mmap_sg/single functions.
> v2->v3: remove some unrelated code changes; delete the fix of return value
> since there is no corresponding handling code
> v3->v4: change sun8i_ce to sun8i_ss

From v3 to v4, I changed the title and commit message from sun8i_ce to
sun8i_ss because I suddenly realized that the code change below is for
sun8i_ss_hash_run, other than sun8i_ce_hash_run.

Furthermore, sun8i_ce is also prone to this issue. I've sent another
patch to fix it.

>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> index 3c073eb3db03..5448705e8ae1 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> @@ -368,14 +368,14 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>         if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
>                 dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
>                 err = -EINVAL;
> -               goto theend;
> +               goto err_result;
>         }
>
>         addr_res = dma_map_single(ss->dev, result, digestsize, DMA_FROM_DEVICE);
>         if (dma_mapping_error(ss->dev, addr_res)) {
>                 dev_err(ss->dev, "DMA map dest\n");
>                 err = -EINVAL;
> -               goto theend;
> +               goto err_unmap_sg;
>         }
>
>         len = areq->nbytes;
> @@ -390,7 +390,7 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>         if (len > 0) {
>                 dev_err(ss->dev, "remaining len %d\n", len);
>                 err = -EINVAL;
> -               goto theend;
> +               goto err_addr_res;
>         }
>
>         byte_count = areq->nbytes;
> @@ -428,18 +428,19 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>         if (dma_mapping_error(ss->dev, addr_pad)) {
>                 dev_err(ss->dev, "DMA error on padding SG\n");
>                 err = -EINVAL;
> -               goto theend;
> +               goto err_addr_res;
>         }
>
>         err = sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(areq->base.tfm));
>
>         dma_unmap_single(ss->dev, addr_pad, j * 4, DMA_TO_DEVICE);
> +err_addr_res:
> +       dma_unmap_single(ss->dev, addr_res, digestsize, DMA_FROM_DEVICE);
> +err_unmap_sg:
>         dma_unmap_sg(ss->dev, areq->src, sg_nents(areq->src),
>                      DMA_TO_DEVICE);
> -       dma_unmap_single(ss->dev, addr_res, digestsize, DMA_FROM_DEVICE);
> -
>         memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
> -theend:
> +err_result:
>         kfree(pad);
>         kfree(result);
>         crypto_finalize_hash_request(engine, breq, err);
> --
> 2.25.1
>
