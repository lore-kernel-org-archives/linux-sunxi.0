Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E73FCD
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Sep 2021 00:55:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ee50so16955785edb.13
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Sep 2021 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NPU/ZVpuhfsq8j4kWcPthoCwQtSjQlJkLhZqLNa7WA=;
        b=Cb9EPH1Qt1jr1w9lMJ7uOJHRz2cY2mMb6moezHp6svacqI+SyDgHLmm3bGXkH/4SkS
         fk5o2ub72tL7rqPDxxJSG93AeE61SxhvogvTWIjtX/ZVE0eyVhFiXC/0QFiIPziza5xe
         XA9iqHGjm2vNgdbbyC4c0MwuvzO98MAy/KkM+y4sro1pkdNJgonNyg6GGnEyUw8tSQWf
         BQsmQLTiqt0uKNIVyDy1uda4K1gMEyeYkhb8TvpWdTtWb6YRyGdREPaLYW+jfMUO7++N
         SV3eQeJ/dLnByQ7GDFjJ3eSLO6IkVSnJRDOvu/zGWsVbVcvcbnanFSRU9NtagYs3JGP3
         XSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NPU/ZVpuhfsq8j4kWcPthoCwQtSjQlJkLhZqLNa7WA=;
        b=fE7GHtAOPZc9MnFmREpVzYI4xlunoDTXGiwSkkPFm0E1PcK/YHAAHKFRpHYAL3uYkh
         IRqryv7YKsGn3rRBZ5xReB0EQYdNxFkKlvi3dBBr0D3RnV3wWwT9ErCm34JdQrEb85OG
         hQ92UpWC7HqA7lTmKLxHk7QBSE6/IoNNi0P4AS1l9N8Bm58+UD0N6I740dsYFRUNPKzJ
         5PCoe1lps2MThOY6pTJl3f3SNqQDal6BPDvBWCmaFi0QizWNkDbpytzsGOkAa59pI0bq
         UPY4YR0O+l2/sLr9+Ku5sVR8tIQGVdx2Y2kVLxjDOGziH6MYB7GAMC3x8nmABJR/ylwp
         F53g==
X-Gm-Message-State: AOAM533ncSirc4nkxMrRF58LfTvwmrQ9xDwKwv/YpqeTqJh2e0fSFy/B
	qssxwk6qHLff67J7ebCW3YN/ThSJt5TWZC79QeE=
X-Google-Smtp-Source: ABdhPJxlAuJ/7eKxf3n3hw5XfXfcjTDvtlZrE6PHEAXIoz1CrajrEeIKkIfEFrKu3tP/f+g7puJocrrxA3UvQ2BhaXg=
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr2146828ejk.147.1632358524398;
 Wed, 22 Sep 2021 17:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803063149.2821093-1-mudongliangabcd@gmail.com>
 <20210812100437.GA5055@gondor.apana.org.au> <CAD-N9QWGgBBddi5kwTNANKVVdWaQRwagMHvaH592B5GDALpBrg@mail.gmail.com>
 <20210812102954.GA5569@gondor.apana.org.au> <CAD-N9QU6r-yLBvJUpV+xy4pgOFnrtquBymthG7k5ddHt20APzg@mail.gmail.com>
 <20210812104318.GA5780@gondor.apana.org.au> <CAD-N9QVz3W1E0D4i9iVTpkHVaB_Y9u1_HK2VW+FoQKJ9H8krrA@mail.gmail.com>
In-Reply-To: <CAD-N9QVz3W1E0D4i9iVTpkHVaB_Y9u1_HK2VW+FoQKJ9H8krrA@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 23 Sep 2021 08:54:58 +0800
Message-ID: <CAD-N9QUu0QPdMtijoRKSzfq1EKa-VYgPy5r4+EkGG8swpQo8Fg@mail.gmail.com>
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

On Mon, Aug 16, 2021 at 9:21 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Thu, Aug 12, 2021 at 6:43 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Thu, Aug 12, 2021 at 06:40:20PM +0800, Dongliang Mu wrote:
> > >
> > > I agree with you and would like to modify "return 0" to "return err"
> > > in the next version.  Even if the parent function does not care about
> > > the return value, it is still necessary to keep the right return
> > > value.
> >
> > Well if the parent is ignoring the error then returning the error
> > there obviously isn't going to help.
>
> If so, do I still need to change my current patch?

Any update on this thread?

>
> Dongliang Mu
>
> >
> > Cheers,
> > --
> > Email: Herbert Xu <herbert@gondor.apana.org.au>
> > Home Page: http://gondor.apana.org.au/~herbert/
> > PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
