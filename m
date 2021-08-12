Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3484173
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Aug 2021 10:40:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id o23so10641209ejc.3
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Aug 2021 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cp/s3vlU5WFTroPHhHfA4dE5DhMKa1dsp19BvMnWTZ4=;
        b=mrPQi5ew93qJB70v7OQ2t8la7sHF8w3JNRsIetfnZxSvpuhzZOYVnK/ay+PHyHG/yF
         dGCqzfM1GiqjmypqWslpAOsuv76dHRUwOh31SsRQlpxJ5y7wcEnl599Vit7LkxZzP2eb
         pbV3/G80tGYpqmo+ii374siwtenE5ObBubkpqGnphg+xUHgRPbT9FMdaCmPaEff0CsRK
         qpsS+a4nU77GTzmgvg+aLQkhf1nQiy1kLG8Pq2ChXGQZOBTqB0D91xEaiaN+mcjFk+ek
         CmfOMWQKAsK7Qk9iCvsSkny19pgJ4ZEjfTQrcjhTJoT5utcPzFN3eOPaoNbI9YCayHiU
         2xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cp/s3vlU5WFTroPHhHfA4dE5DhMKa1dsp19BvMnWTZ4=;
        b=CnrgmTEoxfHtYDJ/XVg1KwR7dH2eR4yQVH6CPoFrNWw6a5Sgwun+5WYyOm82dZRViC
         i9o/JBV5w3rjzEE1culToCJfO3xI0f71Y2AkaBGWkVKeHfBMa1oSkPgNLiDm2/qz8Xo5
         CcgPJ1OiJT90HIilOu0+gmmnXlBX0c//DWm1X0TBStX5g1cLxkra/Fl+PvdSmC7CCgYk
         FNnnWxS8hnf7tkF4ZtEewImy8sv9XxlKaByo3wL4CjKPYqZ0bR+dexGUwRtPpfaXjJpV
         L74oN4GVxAc0A8rqCYcX7dmM8acCaYGKduVhW6f89Z0PWigbzg3sVYAOpCyyWnoWUOet
         l2iw==
X-Gm-Message-State: AOAM5335TCfHC2Yq6f/bMZaY+o7ZFQmQciC4dahkE991zza5+O3REnyS
	lo5UKbwMsZ3AGN6uKjn8ABz7aJXf3dTxu3/OPXo=
X-Google-Smtp-Source: ABdhPJyacnVE3owHvyo9vxiHEV0dN5cJra+igFKNNq5Idb+SbkJmRl1G3xNAAUcJP1JwUz6fXhk9JlyLph6KALqj3Cg=
X-Received: by 2002:a17:906:8493:: with SMTP id m19mr2973578ejx.103.1628764847064;
 Thu, 12 Aug 2021 03:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803063149.2821093-1-mudongliangabcd@gmail.com>
 <20210812100437.GA5055@gondor.apana.org.au> <CAD-N9QWGgBBddi5kwTNANKVVdWaQRwagMHvaH592B5GDALpBrg@mail.gmail.com>
 <20210812102954.GA5569@gondor.apana.org.au>
In-Reply-To: <20210812102954.GA5569@gondor.apana.org.au>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 12 Aug 2021 18:40:20 +0800
Message-ID: <CAD-N9QU6r-yLBvJUpV+xy4pgOFnrtquBymthG7k5ddHt20APzg@mail.gmail.com>
Subject: Re: [PATCH v2] crypto: sun8i-ce: fix multiple memory leaks in sun8i_ce_hash_run
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Eric Biggers <ebiggers@google.com>, 
	Xiang Chen <chenxiang66@hisilicon.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Corentin Labbe <clabbe@baylibre.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 12, 2021 at 6:30 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Aug 12, 2021 at 06:24:25PM +0800, Dongliang Mu wrote:
> > On Thu, Aug 12, 2021 at 6:05 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> > >
> > > On Tue, Aug 03, 2021 at 02:31:38PM +0800, Dongliang Mu wrote:
> > > >
> > > > -theend:
> > > > -     kfree(buf);
> > > > +err_result:
> > > >       kfree(result);
> > > > -     crypto_finalize_hash_request(engine, breq, err);
> > > > +err_buf:
> > > > +     kfree(buf);
> > > > +out:
> > > > +     if (!err)
> > > > +             crypto_finalize_hash_request(engine, breq, err);
> > > >       return 0;
> > >
> > > This does not look right.  You're returning zero in case of an error
> >
> > Hi Herbert,
> >
> > Corentin Labbe said,
> >
> > For the error code, I am not sure it is needed, error code is already
> > given to user via crypto_finalize_hash_request().
>
> Yes but your patch changes this.  You're now skipping the finalize
> call and thus throwing away err if it's not zero.
>

I see. Thanks for your comment.

I agree with you and would like to modify "return 0" to "return err"
in the next version.  Even if the parent function does not care about
the return value, it is still necessary to keep the right return
value.

Corentin, how do you think?

> If it's supposed to do this you need to explain it in your patch
> submission.
>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
