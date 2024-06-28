Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7C1C8FC5
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719590838; cv=none; b=g1rRk2NMpddJNqxf0V7aAw2IFj9hSr0W65YXG7jFlHbYzBkTqgr6Z+rTw4WwauujNnidxjIgWCu/N5MSB2x4mu1Ntyzp1jsQuWSQ/Rgfcmr75WtGz6uNyijnihSXc+79mTn2+aAgKpP907gynoNVypp1jpjQuRQLdYGa4D75u88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719590838; c=relaxed/simple;
	bh=hfX+qJVjjcAcXiAhQztZ3+zVRGnspWsdg4Of5y5zZtg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=axIoGUDIJxvi6GiZN9RDzxoRhUvw7SpvPlUzA3TKbB6JdG9ixofFJ+P2jAZLHYU5UfaUUTd1sfsnGIuNFCGuvx3vJc6Rjczb811qvHEo5Js0fgoaxcsEX8u61h6F/rOhAnBVKbeERpu6Mv6xWuk/zEL2cmycuFrv6a1crDP9Cfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvwmbhTl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvwmbhTl"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso779846e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719590835; x=1720195635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BLuQHw7XUYh7A6NXygwXg3SOfMQ/2DhzNHBqiquzFk=;
        b=mvwmbhTlSugEYsoUe9ugnfVCji6rBZdBhZ938VgTz1tlTAndJSv/m39BdokBKgHIHN
         wnRRZnT/3JAxeZpP69OrY+q5QwwOJk+jbQQWzUs+l1+UvzTuVbrG8A/n00jOiJ8w4XLk
         7rxK0v5xR4AbbZFpARIAcKVnYgGp1TvqBFCapUH2qdnbPZmE/uRzbMLRv7uOzL78+k8W
         j875uToqgieG8UMcu09vASreLeW5mLg+YmutjuZTnF0lxFksrBWBzxmJI9ZobYt+O4IY
         kFShMrd79N9bCNOUbpT92nK8nBXnbnd6BFAZhslHno9RBRU42RNw7Alw2EcQQ1X95ivp
         MoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719590835; x=1720195635;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8BLuQHw7XUYh7A6NXygwXg3SOfMQ/2DhzNHBqiquzFk=;
        b=j7sE9G67umjIZzIWCueXh2hQ/Pb4LZP5kf8qXGSZ5GVPiNmTjjYk9vdDsve+aI4m4j
         +S1o352WVcKbEXMG7nzbuUG11WR62pE1so6o4htE7tEk0HNNpaMCOvisxz5oxNQXOkoR
         p8omndxfBBXQT2tSkCY9dgwdfLVekLQUoDSfJ0jVbRQfu3fcQ/yxxE0Qc3NTdHHJsnA8
         wUEd4bCwW1wIsROJ8gV5fB4MBhNj7RUEybb7eQ0pPTV29hQD8M1xp4IiRnHzXQxcqN3s
         Z92HT+XVwmuUQUZcVP49vV9RgLkNpaS5vhkPIrtK86fZZOmnZXxAOK3kXAiGFZIPNpen
         WTZg==
X-Forwarded-Encrypted: i=1; AJvYcCW7vvayGhmp7aj7vl36WegojdI5ZFlO0CjV8+btuNlLDL6l/RoxCzORPUSAyGey4+iDM1SGL86bc5bLlNEUvNiGaxloeYN1H/DYypc=
X-Gm-Message-State: AOJu0Yw8uSNj4GR4uWhqDJQST7vdG4c7KJa+WvdxMTHWjNq3UHD27p5r
	dVjShpCzLdZ86MXPpg0M9BaaimZGqrtrRITiX5VARNVXVIXZ68o3vjnzcAgP
X-Google-Smtp-Source: AGHT+IGKtZ27jyLm/4hObT+qQKvkXECnsn/l8exN8++MKWIkS87HhKNrOpgNjyAfe/Lwii2sJwIqVw==
X-Received: by 2002:a05:6512:3105:b0:52b:b327:9c1c with SMTP id 2adb3069b0e04-52ce068042emr10387590e87.62.1719590834351;
        Fri, 28 Jun 2024 09:07:14 -0700 (PDT)
Received: from localhost (host-95-246-50-43.retail.telecomitalia.it. [95.246.50.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b097c2asm42256035e9.38.2024.06.28.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 09:07:13 -0700 (PDT)
Date: Fri, 28 Jun 2024 18:07:12 +0200
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Marcus Cooper <codekipper@gmail.com>, 
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <667edfb08cbf3_eca1e370ea@njaxe.notmuch>
In-Reply-To: <d614f04e-3609-48e3-bd30-9e57c69cd94d@sirena.org.uk>
References: <20240529140658.180966-2-matteomartelli3@gmail.com>
 <20240529140658.180966-3-matteomartelli3@gmail.com>
 <20240606-savvy-wallaby-of-champagne-d4a50e@houat>
 <6662bf1b61bbc_2f51737023@njaxe.notmuch>
 <d614f04e-3609-48e3-bd30-9e57c69cd94d@sirena.org.uk>
Subject: Re: [PATCH 1/1] ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s
 mode
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mark Brown wrote:
> On Fri, Jun 07, 2024 at 10:04:43AM +0200, Matteo Martelli wrote:
> > Maxime Ripard wrote:
> > > > -	/*
> > > > -	 * DAI clock polarity
> > > > -	 *
> > > > -	 * The setup for LRCK contradicts the datasheet, but under a
> > > > -	 * scope it's clear that the LRCK polarity is reversed
> > > > -	 * compared to the expected polarity on the bus.
> > > > -	 */
> > > 
> > > I think we should keep that comment somewhere.
> > 
> > I think that keeping that comment would be very misleading since the LRCLK
> > setup would not contradict the datasheet anymore [1][2].
> > 
> > Also, do you recall any details about the mentioned scope test setup? Was i2s
> > mode tested in that occasion? It would help clarify the situation.
> > 
> > Could anyone verify this patch against H3/H6 SoCs?
> 
> Any news on any of this?

Not on my side, unfortunately I cannot test the fix against H3/H6 SoCs.

Matteo Martelli
