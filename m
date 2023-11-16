Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68BC34558
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Nov 2023 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcXouEQB"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1ea82246069so590404fac.3
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Nov 2023 11:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700162280; x=1700767080; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
        b=hcXouEQBZ8rB5qHGPZV1nngWYRbic9zBiEFLwhVGbkNk4Qvi9BMp645R3OwvS4eIv8
         /1r4HKqX7bnqk3UiZwBczA+kEANl0S4Gx1IwvcAdAXVGMEA2UbzKBTCLDOVSHy9k7Vn4
         ddhOHXzD9TI94ACbbquxg0jP/nTfzC/yb1Wlt059cmRUnLfNzNayByB4TYhgRHw0rOAK
         bXLEARdsTBCkA9VArAEe9hhXaZhauPEtPJjJF1UoUqHByV7N8mZ6fLwsqyn7GKEVi+0q
         f8VC3vquRn0Kas+hK8cJRE2SSz2H0kxNW/s6834ao/IarkkwZDeMdUB/kqomy/1f1g3n
         6UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162280; x=1700767080;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
        b=k1LZcSCWqUEZ2GYMKIA1JR/94k6wFQlSylIsDidIHw9cQlSXgaR6jdjG63uYZC+/cy
         UBCMDq3e0BhtPkOSWjx0UbqshXhXEmxgS4jZaoFdgaKmXLJLsZCGU9Hmoco/0amgDcNt
         zlXrbK6FX2PgjNwNZ+5KLSP5DT8YrVglQuuNjhDUyMCt08aDWFIjentBb/MO3Uj8MOrt
         FSIcSRfxtJirjHaePf6lNtVEZgXZO+2RhlotkbqheKDG8eyFfNUg+i9CGnGXaG+oGfIR
         lbPnNH2XsTDYj4twQxuHfZKRu1ch1QTVLRxKnF8c1WUe4PAgosNMLFivV4zYnv6LZhta
         njeA==
X-Gm-Message-State: AOJu0YzBiVWPtBl6i24qrJV0cCBYDELn+h/3tgYHpIMRkLgXzmaTlsv/
	wCBK1uPbuYPvwFyQUWKP9phtjPo17AgZl4AQMUU=
X-Google-Smtp-Source: AGHT+IFchzrhEbVbz5AEifNKluJrx6zIDMG5gc5BfPiF7RMJY6+/+9azNscfVMvB74Y03sWBedUaDVz9bS5Uf4oPXtE=
X-Received: by 2002:a05:6871:2312:b0:1e9:cb7f:2287 with SMTP id
 sf18-20020a056871231200b001e9cb7f2287mr21389323oab.46.1700162279900; Thu, 16
 Nov 2023 11:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com> <ZVJhwSS16+/Zzt0f@shikoro>
 <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com> <ZVKNIn1eSlZ9yzco@shikoro>
In-Reply-To: <ZVKNIn1eSlZ9yzco@shikoro>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:17:48 -0500
Message-ID: <CADnq5_NgzZ+1FTzZObivnjJbbuYcafY-fbvgiGA9ryqA9wYedg@mail.gmail.com>
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
To: Wolfram Sang <wsa@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-fbdev@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 3:55=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
>
> > We're not in a hurry. It's just my experience with patch series' affect=
ing
> > multiple subsystems that typically the decision was to apply the full
> > series via one tree. Also to avoid inquires from maintainers like:
> > Shall I take it or are you going to take it?
> > Of course there may be different opinions. Please advise.
>
> Ok, then this turns out to be a negotation thing between the drm/fbdev
> maintainers and me. I *can* take all the patches, of course. But since
> the number of patches touching the non-i2c subsystems is high, I'd like
> to hear their preference, too.
>

I don't have a preference if you would prefer to take these via i2c.

Alex
