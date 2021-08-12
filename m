Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537870
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Aug 2021 10:24:53 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id o23so10560869ejc.3
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Aug 2021 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lAh9DOdcJ3AKWMys8jX22Sn3J/EvQJoBUpAz3Mifi7Y=;
        b=FuBgqDya2SMkvuzIHwWeMn0SPDEhxcF29PLUldLp1NFrLY5+fD7Rp6jGS5BNHlZlhJ
         n8ldXVE1XB9H30jAnNzno+qV4GAWfDzxLbvvM23nYM82AJjqHteMjm5DNesrBD8HzBAd
         wbMu/SXn/DPnLIoZiQ/Nw26qJU5cmH1yuarRlU9z8+tbKit8vwWJy5ZhLswPtbHcxfDU
         wl3P3wO4TE7WjhH1m5YdZ/+C6Ipbtr/pprwqJ3UR5KN1CWJregTCj4OwPGHb3yA0Q7vD
         DV8stnj6DbayS7mGIUBcqn8DbGixiBB+GL3oqJvXkrbBOpxUiA7zFTF4ATsy32Px1TXL
         /mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAh9DOdcJ3AKWMys8jX22Sn3J/EvQJoBUpAz3Mifi7Y=;
        b=n84Pzvsxt1O41a+6d0/P9X34BCWhEEv6NJ4YmrichRW2oYKRt6DicQfUxSnLyE8S5y
         XfbxK/kqBXUnvc5J4M3VcsipQBX7mqNGFNzxZFqegC1C/t/1mCV80xLTPmlaPAtPCtBA
         96cm7MpL2K5iZGn+udHPts7P5eecOOcx9IRkCLnEgar0SgkwnWsom3/aMl4xMgjUQCjM
         fA0GcstOOlKVrmx/rx0JZ64IQ3mBi8ZZKwnyLzyAsomNbr2MJOwLGt/vjGd+kZa7HS+X
         4qOR1DFSYJRHDLbusUH8/Ox2sCvKpfcogEs+OskoOw8F+OQ4exCDsjvAyHYRjfjvNgKg
         l1kA==
X-Gm-Message-State: AOAM531Uk2E3ui/T3ykiLGvlsFvVhTQeqpgE+R3V/wmo0YSuqEqom4Ep
	4/ctGbl00pWPkVSqKluntkNp0bvI40IkN0LtItg=
X-Google-Smtp-Source: ABdhPJx3waPDU8WaSHHfmm2MI9XVdW007l7jwQHyxXP19vdrXuLfYGA/G01rd25ZVycRVcaSoB5/vWXK30VC+KjB2VA=
X-Received: by 2002:a17:906:b0d4:: with SMTP id bk20mr2815864ejb.535.1628763891324;
 Thu, 12 Aug 2021 03:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803063149.2821093-1-mudongliangabcd@gmail.com> <20210812100437.GA5055@gondor.apana.org.au>
In-Reply-To: <20210812100437.GA5055@gondor.apana.org.au>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 12 Aug 2021 18:24:25 +0800
Message-ID: <CAD-N9QWGgBBddi5kwTNANKVVdWaQRwagMHvaH592B5GDALpBrg@mail.gmail.com>
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

On Thu, Aug 12, 2021 at 6:05 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Aug 03, 2021 at 02:31:38PM +0800, Dongliang Mu wrote:
> >
> > -theend:
> > -     kfree(buf);
> > +err_result:
> >       kfree(result);
> > -     crypto_finalize_hash_request(engine, breq, err);
> > +err_buf:
> > +     kfree(buf);
> > +out:
> > +     if (!err)
> > +             crypto_finalize_hash_request(engine, breq, err);
> >       return 0;
>
> This does not look right.  You're returning zero in case of an error

Hi Herbert,

Corentin Labbe said,

For the error code, I am not sure it is needed, error code is already
given to user via crypto_finalize_hash_request().
The "return 0" is for crypto/crypto_engine API, returning an error
will not change anything since we dont have retry_support.

So I propose you to focus on dma_map_xxx() fix patch.

See details in [1]. P.S., my previous patch returns err variable.

[1] https://lkml.org/lkml/2021/7/26/164


>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
