Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA215B980
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713370795; cv=none; b=CRuQcbYta5JhgrtKjHjkUpht9BGJSdB5xX1/BCkWHxFPb96QEKwbuc685Y+oNY06SSQcsi2mbCxUj2dsYwwz/3K0JZGFzfQpa9OrM0FJxyn3mMmqWV2iUO5FMbF+2xc6KL7pxmxoN6JUkJycTJIkFiPbuyrgdqeEMEIkiChvhy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713370795; c=relaxed/simple;
	bh=fPxUcbghkVzBBb3O5m3J0h86wBDuD+Z0gMmR/qCLOwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l91HGa3uQoIYHGthm+CBPRolRfx8KXzpn/Mrlm738k4UGyeDyFVU1VNIKbQ8tjUNFEZrC+ATtxc18YckHLAYslx1kzS1JOa6OgP6u96cK3r3o8rlGIaOJ7uakKAx+V4Kjek1wAuXd8Q3MAulvEhSWBQqdcFVxC0OpSi6cJMeXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ljNcyGXD; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ljNcyGXD"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e9e1a52b74so1049063a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713370792; x=1713975592; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
        b=ljNcyGXDuQ2yaioVQvwjdtq6RTOx4SAKsFj6rDZby1OFSMQCbRNkcA9FU3R77+wbai
         jgkspyNT7r3aO65I2RSknPLeCaXmfuY6HQn4Y5hxbjIru7h/Z4UtsCHvvYgzb8lpEqF2
         kCCURM/Q7Ro+ZDbzZyBq4NeBdFjdXGod2WOkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713370792; x=1713975592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
        b=RYXrTiN1wyXk+6gBl2lAgjnU7PosT/Yx3/EXLsLQU50zi98SOGp/eFHcwMl/ktZ0Dj
         D9VMEDVVIkIXHEOlipxXuhrrbgO4pvkw9Gaf0aqgiND4Y4AJqD90v5OJOP0vX6o3eCQ+
         cjBiHG1WXEfanvz2H0lrzzE8pSaJx8R5cEFIYKnkz1pNQ7IRLmzKPfzcLuAPOj5MTn+J
         U7DxSnPbyAgs/qotAqmk9eCa8P2EutRSAvdtxdw4P5UhiSG4+lBWe56VVgzwW6PiLV24
         OeAdK5sUX1vkGgj8UBRlJ9xTdvXLa5UJq1a+U3qlmaktO210c0SNaV1i1S/prTRL/Khn
         hR2w==
X-Forwarded-Encrypted: i=1; AJvYcCWwHh57tE4tNSqEmuxxiikqc6vOCBcOa7+BmiD1zhZUcSRBur8yxz2jH1dauuwbdNiTvha8s1ONXEnbQQ+RD7tYxLkBpijcKt2Vw8E=
X-Gm-Message-State: AOJu0YxqVD319vAR3XeE/1n30bRYvmkzXW/q5GSLFA0Ds+UAlQemdRdd
	lYGE+XqRJFqQaF0nNkovsA9Wp/aqvwKYCLO3j7lTYKSrRA3z96aIuj7N+e8gLqpUY9eoYgaOIe+
	RIA==
X-Google-Smtp-Source: AGHT+IH5HZuf8OwleOi6HBZUzzg3iwWK0cLQNbxZnSuLPBx/+xpmzhrUnEGv5HpNy/itILFtVO41qg==
X-Received: by 2002:a9d:6281:0:b0:6ea:2e1a:d84b with SMTP id x1-20020a9d6281000000b006ea2e1ad84bmr19301383otk.16.1713370792493;
        Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id a16-20020a05683012d000b006eb7c8f747fsm1482280otq.76.2024.04.17.09.19.51
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6eb6b9e1808so2499451a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 09:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWWNQolEigTSkPoz8iPi099oX2IFik0dnqUhg2GnVNdFaJctqUWTrv3XKz4NZcH5MW/PlVzETxBj+ZEUmVSQTrltwTbKI8w1w5XGM=
X-Received: by 2002:ad4:4f23:0:b0:69b:5445:6ab0 with SMTP id
 fc3-20020ad44f23000000b0069b54456ab0mr19079283qvb.46.1713370770447; Wed, 17
 Apr 2024 09:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain> <20240417155112.GQ12561@pendragon.ideasonboard.com>
In-Reply-To: <20240417155112.GQ12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 17 Apr 2024 18:19:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
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

On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > In my opinion, it's better to just ignore old warnings.
>
> I agree. Whatever checkers we enable, whatever code we test, there will
> always be false positives. A CI system needs to be able to ignore those
> false positives and only warn about new issues.

We already have support for that:
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads

But it would be great if those lists were as small as possible:

- If we have a lot of warnings, two error messages can be combined and
will scape the filters
eg:
print(AAAA);
print(BBBB);
> AABBBAAB

- The filters might hide new errors if they are too broad


Most of the patches in this series are simple and make a nicer code:
Eg the non return minmax() ,
Other patches show real integer overflows.

Now that the patches are ready, let's bite the bullet and try to
reduce our technical debt.


Regards!
>
> > When code is new the warnings are going to be mostly correct.  The
> > original author is there and knows what the code does.  Someone has
> > the hardware ready to test any changes.  High value, low burden.
> >
> > When the code is old only the false positives are left.  No one is
> > testing the code.  It's low value, high burden.
> >
> > Plus it puts static checker authors in a difficult place because now
> > people have to work around our mistakes.  It creates animosity.
> >
> > Now we have to hold ourselves to a much higher standard for false
> > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > Drokin has told me previously that I spend too much time trying to
> > silence false positives instead of working on new code.  He's has a
> > point which is that actually we have limited amount of time and we have
> > to make choices about what's the most useful thing we can do.
> >
> > So what I do and what the zero day bot does is we look at warnings one
> > time and we re-review old warnings whenever a file is changed.
> >
> > Kernel developers are very good at addressing static checker warnings
> > and fixing the real issues...  People sometimes ask me to create a
> > database of warnings which I have reviewed but the answer is that
> > anything old can be ignored.  As I write this, I've had a thought that
> > instead of a database of false positives maybe we should record a
> > database of real bugs to ensure that the fixes for anything real is
> > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
