Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB7C6FB0
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713451906; cv=none; b=f1L4KBX6EWDCBICj47ESnkk2oxFl5OMRzPYMzt/FaGKnrXWH+lzxWMd/c3U+UnotphxFOXPRm05k7bB7RbCIS3qEFxQY8t2x/CehP39tUsdocNHcK1NEH1xJEcP86NEdwtibu5XnJSws8qC5jimuk5zaoMTEQ2SP5Iopej3AND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713451906; c=relaxed/simple;
	bh=CbuQk1PghdDnmrxhojCwmpRorta2iCVuoxXGBVbnZE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sj6sboMvqvmR1HWP4VCv4wljKkZD82CdwNHhTzHnEQPFgnsoxR3It4XCM0DUz/pgHF8jPCRxoHE2loyr2aIozx/W+QiYKVidUJPyGm7zaupc7Gg0L3l+dfYava3DCze+w5a5S8LJ+QCy4w/jYDrb7Uu9LkGuGW8IoQU4PIArq/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GLcD4BtZ; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GLcD4BtZ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-479ccc89792so488290137.0
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713451904; x=1714056704; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
        b=GLcD4BtZ0j1AVf83IBuKnfvA9OkL7fbiBSWJNsBlgeWibn1KbgLxfD9JYs+lpcqov7
         hNZ2jXkxPKTr//WX36Zo9O6bx6OWcxVqBRdVSAl18IbyiAxJ2DXXNFQBlCu0rOEWzvvp
         WzV0ah5cCdFyLfcURaZrQLcmbnsB0JFuPcFmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451904; x=1714056704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
        b=DJ6C5k4JDTBxo6/JH77k/hCwr/UU0SUj6qaNMg6rVrGt6ttTb2c8vCfjo5hreso41S
         xowJANgIsZa7lAqhKGwj/zq9GQLpN6nUAhSTG2f5MUpFrqlRLCpAECECW6Q08P6BmWTi
         0FXD0cp5/Ksq46sMt+BoeGNJZhltLJuzlnC6AoIbUOkcZcxTPMuHTmZ34aoISMW9Goof
         G7IWYT1pwI0h+sGRUG445lbTdZqfcyaJbzl0vjaLDB1jyOqRnrkk4h9BIJjjqCjy0IUy
         KeiKvxgsst1MFW+lYsAmdjEgr1D0c3kA7/E+CBSaWUrHDo1dGONBZSZsCqt4OJnfg3GI
         bhcw==
X-Forwarded-Encrypted: i=1; AJvYcCWYrrYgkn33pxOr4kZ2Hu5R1sC6RyCMM8mAYedPmbqqLdHyevlGaiVKTP3+ngR/xHCM3b3Z0l6Hw0DRrLGpI9P5fYjmNQPYKv44evg=
X-Gm-Message-State: AOJu0Yysjh7XE0NpcqgNgL4BRIRBy+CbMy0gFWe09AuBaR3Hm9Y6lYs7
	1CTSSJhlBSRdmE21fPsMOYcpg1I0ccWbJTpDjmI8m435EHl0JCJK2VbBrGHRI/3l0L5X5cnhJ8E
	=
X-Google-Smtp-Source: AGHT+IEBwCLKb+krN52QUZe9s63YkyeieSAX+0k7776fo4HkNKhrqde+nZp5quiI+ZYJneDzIYJXwA==
X-Received: by 2002:a05:6102:2844:b0:47b:5f05:5a57 with SMTP id az4-20020a056102284400b0047b5f055a57mr3753802vsb.16.1713451903564;
        Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id l16-20020ab07190000000b007e71e926ae7sm159294uao.37.2024.04.18.07.51.42
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-47bb81424adso454953137.1
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 07:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkFRel3sPtpPs68KzLYsZ3rsUoXO3EWPbe756qOiEyQm2qPkc67SagZo676zy/t0C+QuuoeVm438DvrDmXTMlQJIeZg/z1K7vutF0=
X-Received: by 2002:a05:6214:4a5b:b0:6a0:4571:e0c8 with SMTP id
 ph27-20020a0562144a5b00b006a04571e0c8mr3999896qvb.18.1713451882078; Thu, 18
 Apr 2024 07:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain> <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com> <20240418105310.GV12561@pendragon.ideasonboard.com>
In-Reply-To: <20240418105310.GV12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 18 Apr 2024 16:51:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Oleg Drokin <green@linuxhacker.ru>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 18 Apr 2024 at 12:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> > On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > > In my opinion, it's better to just ignore old warnings.
> > >
> > > I agree. Whatever checkers we enable, whatever code we test, there will
> > > always be false positives. A CI system needs to be able to ignore those
> > > false positives and only warn about new issues.
> >
> > We already have support for that:
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads
>
> Those are manually written filters. Would it be possible to reduce the
> manual step to flagging something as a false positive, and have a
> machine build the filters ?
>

Do you expect that the list of exceptions will grow?

I hope that once the CI is in place we will fix the warnings before
they land in the tree.


> > But it would be great if those lists were as small as possible:
> >
> > - If we have a lot of warnings, two error messages can be combined and
> > will scape the filters
> > eg:
> > print(AAAA);
> > print(BBBB);
> > > AABBBAAB
> >
> > - The filters might hide new errors if they are too broad
> >
> >
> > Most of the patches in this series are simple and make a nicer code:
> > Eg the non return minmax() ,
> > Other patches show real integer overflows.
> >
> > Now that the patches are ready, let's bite the bullet and try to
> > reduce our technical debt.
> >
> > > > When code is new the warnings are going to be mostly correct.  The
> > > > original author is there and knows what the code does.  Someone has
> > > > the hardware ready to test any changes.  High value, low burden.
> > > >
> > > > When the code is old only the false positives are left.  No one is
> > > > testing the code.  It's low value, high burden.
> > > >
> > > > Plus it puts static checker authors in a difficult place because now
> > > > people have to work around our mistakes.  It creates animosity.
> > > >
> > > > Now we have to hold ourselves to a much higher standard for false
> > > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > > Drokin has told me previously that I spend too much time trying to
> > > > silence false positives instead of working on new code.  He's has a
> > > > point which is that actually we have limited amount of time and we have
> > > > to make choices about what's the most useful thing we can do.
> > > >
> > > > So what I do and what the zero day bot does is we look at warnings one
> > > > time and we re-review old warnings whenever a file is changed.
> > > >
> > > > Kernel developers are very good at addressing static checker warnings
> > > > and fixing the real issues...  People sometimes ask me to create a
> > > > database of warnings which I have reviewed but the answer is that
> > > > anything old can be ignored.  As I write this, I've had a thought that
> > > > instead of a database of false positives maybe we should record a
> > > > database of real bugs to ensure that the fixes for anything real is
> > > > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
