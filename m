Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823F4A29
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744530370; cv=none; b=Qux0z9FjCZ5wWxTPZlYV07oCcrlvyyi31Vk9OFi9LlTGLZmABj2vTG2IJxESHbpOGndkYy77ZHqyi4oaUdIRFGAzZ6yZC2zFq3J7uwHchUGD4k8FSlmibqN8FQlFYKAogKQdMxwhw/cF/UPuQK34pYyR/HvyRSYLG9O86scL+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744530370; c=relaxed/simple;
	bh=bDSu5/EVHFrCNsSIo9MPis9K1+uBYhIFfq4Okm82ftE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sy72Eb6uEBnihFbaH7hFz+dd/YIbHJaDLBOJiRc0FuhA0n6NV1jojKstF1yoWodSRb1Yzfdu/277ActiDIVTxjJjiSNl+yp/7JXahZCdpBTm9nwNrf97fSDjmvPp7fJXyGjffTt+hNH3OjsbXgRhck9ORCW+th8722uGTX27zZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlDRuVhX; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlDRuVhX"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8ec399427so28062196d6.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744530368; x=1745135168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDSu5/EVHFrCNsSIo9MPis9K1+uBYhIFfq4Okm82ftE=;
        b=AlDRuVhXLdX2+iOI7GT+OH4z0x7rKlhiWdqnBWtARA7DGEC+ZaGouysnjGCd5iFvZ9
         4/M/yQp69KgIS3utwNTqIq4U3HdsM4XCk/KGksVjW1wHOJwHukMv5plxZANX66T2kzQk
         BDuXowRZWx57/7EgWxL++XB7bma2WmkquaVAgsljMRWEhTnelfeaDCPCg9CgurSiMpVF
         vaydrrTUFEUX9RZu5no9A+4OxcOtczt6O9lVXV5jw5FkL+mpleeNXWhUC8RwyiwMLBv1
         a1Lpf1nqeuNHHljFkTkRDdpLDWOPCq9UVfyJoxKhea2yk6KBKxKP7ZtLfns7l6A59bRT
         FalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744530368; x=1745135168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDSu5/EVHFrCNsSIo9MPis9K1+uBYhIFfq4Okm82ftE=;
        b=RjlIzBvMC0pt8uFNa8GG9xk468UIx28t4waCFqUAD5KNtKzfgMYOIKxxYTxuIT2pDz
         VyvXU8rh8SZEj+yYpodqp4AUs0JMk1SAywoeCHUmZnplNcnKHIzBsKvQ4DiXXJCfwxej
         pPtjTtk1wE4GslCy7mQPidgQt6omAm7zuhc2hPM4iJXhPfOF10gP1L7rStbog08qZUSz
         q2gvpUk1Qd0tdgtOwhVxZ1s28JLKwtOtaZwLEjzvnZdN9+W5WEjUj0nziG48D+xALFy9
         YjFQHfQ5O4yBmeRFwqfKgNx96GbP7WcKECmEAkT5aui6ssfotcGekI7Bl+PFxNGTJZbl
         PERQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2lU6NK8i4FrIXGddk+1PpTdFn4XhwtojOhT1wxnIB4biQ7xYho8x59Rrf/LKQyVZjdemML4c1Nsh+Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGpNRDrs1FuqtJKBZ2sGAxNBHjDNwG01p9+Rv2FXQoYM5rTR5V
	aHsc6yRDS0TU1M7XXtSLV7YWF4hUdyOx9WoLM7FaeyFJOKU9h6f2agLuxQcvc4BWkH5sXXN/qlq
	23cYCDg53+A128QbcY5mXNBHLmls=
X-Gm-Gg: ASbGncuG2Rq1Tn6BN27ccyTh84Z8NzJjug6BNePzioFaDrzOYSvUs103cD2+O4GZnVd
	yjJ0DOxQgklb8zRHXl3+2nEQbnhWa9JkZorLoc3he59NeQI9D/xyFkEMzkDbSO9rF1UxyXIIHCE
	2VP8ivZq2k3XtKxnEL8VBAm3mOuwxO8d86f48F8LdQ3EWS5a+Y
X-Google-Smtp-Source: AGHT+IE2ltyuOxfGOryXdaLo+W43seZVcMMz3+9+li7smTXP3KjLa9lJvabIEPh7RW1u+VRnSNyF0yWPYUQYYsnOyvY=
X-Received: by 2002:a05:6214:496:b0:6ea:d604:9e59 with SMTP id
 6a1803df08f44-6f230caf43fmr148715986d6.9.1744530367915; Sun, 13 Apr 2025
 00:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de> <20250409133610.59d42bec@donnerap.manchester.arm.com>
 <e10ecbe1-d8c3-444d-92cb-647a1c54675f@web.de>
In-Reply-To: <e10ecbe1-d8c3-444d-92cb-647a1c54675f@web.de>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 13 Apr 2025 17:45:56 +1000
X-Gm-Features: ATxdqUGCfzpcdhEUWjj5b9x98mojrheGEprGdWhLMUFri6RCu-8lKdWby7ULwLo
Message-ID: <CAGRGNgUV6Dq6ZR9bcgomzj1PMQj4vLq9qJCy0dxVd0vQoPWYXA@mail.gmail.com>
Subject: Re: crypto: sun8i-ce-hash - Refine exception handling in sun8i_ce_hash_run()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andre Przywara <andre.przywara@arm.com>, Ovidiu Panait <ovidiu.panait.oss@gmail.com>, 
	linux-sunxi@lists.linux.dev, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Wed, Apr 9, 2025 at 10:47=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> Two if branches contained duplicate source code.
> >> Thus avoid the specification of repeated error code assignments by usi=
ng
> >> additional labels instead.
> =E2=80=A6
> > Now there is one rather opaque label it goes to, so a reader doesn't se=
e
> > the error code immediately. And it really just saves one line per case
> > here. =E2=80=A6
> I imagine that such a code refinement can occasionally matter.

Just because you imagine that such a code refinement might matter,
doesn't mean it's actually useful.

1. this is making the code significantly less readable to save 1 line.
2. gotos into control blocks are weird at best and problematic and
confusing at worst. There's a reason why nobody writes code like this.
3. this sort of tail merging is something a compiler would apply
automatically when optimising for size and it can do a much better job
of this than you can.

I note that you said you did this using the Coccinelle software. Is
the semantic patch something you're trying to get upstream at part of
coccicheck? If so, could you please get that semantic patch merged
before posting these patches?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
