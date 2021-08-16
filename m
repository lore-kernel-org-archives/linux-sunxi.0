Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3912FAE
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Aug 2021 13:22:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id i22so7654250edq.11
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Aug 2021 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASKfOUpZVAKtKzShqT3td46CJv+FH9BqYMNcktsexHo=;
        b=IcBlsysZ3ws214IXTNUrCb+4+DCBm2SCE3c2JJUL51h6dJBKF7Ula8/ob58WJ2k0Cy
         FEZGtmG1NZYmGAts9FtG2XE/HJ9M843p4t4PU60ERpqzs4zwSqYWgN2XuMd+ihWFP/yv
         rGHOO9ST32fto7q/TQRueLCBGLMF3huT1BD3tFRwsnzyBrU3vTQ571+4kDHGPVkBwrVw
         +912H8BxXAm1Vyc1ojbRdp3xiIWUBKeJF4A1z7yDucdj/IHJWLX2lwCvi1UlkXT/qsRj
         DFg5w+st1jy8gPlwybQpWDfgZVk27vmOxuG/qT3AVWfIE2wfqqx/NjJJcZ+L0esWgr1B
         oeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASKfOUpZVAKtKzShqT3td46CJv+FH9BqYMNcktsexHo=;
        b=CxWuPrOE+BKRi/iKRAkUlWFpzOfFJT2g1D39VW2OcFbcuCtcceeL9PSA93JeyXPtbd
         wEcOgZ52qfg5X9F+y0oFJwf+kHnJx/b9Xc5yHmh+D0Gf6dp9vlOURWQU+Ml0IBxbClRg
         knZHbQ1FMIcgzXMwjUNWQ3tBE+eNur8q8O0UIoL/DW3WkCR0dbn2gJxgQdMx7UBrcwob
         Yxz2AohROiAgJsNFUQQgKnj6f4HpXfC8rKucYLXEacmxS29JjSF+OsD5cXJGkac3/Mjf
         Ymygvf20O+FLosFENcNM+8IryaZ4hoEbH0/Qk+RWfcLVuLJiqyKyL6GtSJewLiUeJthD
         21ng==
X-Gm-Message-State: AOAM532Cc28GQq9+HH3v6ZbBFuMNRSFyp740piHc/YME1R5RfGgMXCCv
	4Qug6AAPh1OFluUkfA3PbzCvPx0yCXznyaItGJM=
X-Google-Smtp-Source: ABdhPJx//v0XFjAw696+fxHOjjII7EueTho7mjMVcewyNR038dnvShSmcCCRNZTFY7RXYVxbYyXC1TDmTnk3eFMRwfE=
X-Received: by 2002:a05:6402:288b:: with SMTP id eg11mr20341402edb.241.1629120131918;
 Mon, 16 Aug 2021 06:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803063149.2821093-1-mudongliangabcd@gmail.com>
 <20210812100437.GA5055@gondor.apana.org.au> <CAD-N9QWGgBBddi5kwTNANKVVdWaQRwagMHvaH592B5GDALpBrg@mail.gmail.com>
 <20210812102954.GA5569@gondor.apana.org.au> <CAD-N9QU6r-yLBvJUpV+xy4pgOFnrtquBymthG7k5ddHt20APzg@mail.gmail.com>
 <20210812104318.GA5780@gondor.apana.org.au>
In-Reply-To: <20210812104318.GA5780@gondor.apana.org.au>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 16 Aug 2021 21:21:45 +0800
Message-ID: <CAD-N9QVz3W1E0D4i9iVTpkHVaB_Y9u1_HK2VW+FoQKJ9H8krrA@mail.gmail.com>
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

On Thu, Aug 12, 2021 at 6:43 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Aug 12, 2021 at 06:40:20PM +0800, Dongliang Mu wrote:
> >
> > I agree with you and would like to modify "return 0" to "return err"
> > in the next version.  Even if the parent function does not care about
> > the return value, it is still necessary to keep the right return
> > value.
>
> Well if the parent is ignoring the error then returning the error
> there obviously isn't going to help.

If so, do I still need to change my current patch?

Dongliang Mu

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
