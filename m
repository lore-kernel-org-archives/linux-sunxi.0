Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA230DD03
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763315413; cv=none; b=TA2tZ4h48XyNdRSd0NZdc4meKz1jNI3hBYZJyGV/+8W5ZygCNlkjsGE3isG9igX7l4fe0NEweg4EIuZ//w2Lwi18bMuf6QpK3HL0aN67TAFPCEJ2eouG6ctdbFfFNiEt5TJTTiyvecoxXqNu/l8MvXqCdD1J1UDb1zYBmkWRHg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763315413; c=relaxed/simple;
	bh=QP7jspNMzyTvkGv06BWTHIjJjU1oOmLPoesgjcHxeRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WA/7o18UO19wHR7h7trOf9janrT3tXD/XINQsaZKwiBL/dFBTb2vtbjP/GiasNVSyAKxpIheOPZJvjybKQAkkOfrIBRyikFA70a0OveOse7bjKICcwyraLlbB2MWbey90geEwb4mOpLgzWrmX94NnkcNfUAH8xxBb0e0Z+P/VqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwaMA3a4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwaMA3a4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b737cd03d46so177035066b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763315409; x=1763920209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP7jspNMzyTvkGv06BWTHIjJjU1oOmLPoesgjcHxeRo=;
        b=mwaMA3a4o5G4auq/EDQSn/G6jA18WpXDdv1QQP838Onyl+OcoYhJlmuoQujUhtrzYs
         oY0Ngc9+te/8USfQqaNy1/nsLl+CYx+t1GyApz+V+64minD1hhes1V02wD1X32SeigQK
         neB62k9j3thawbHhAEi7AjpvcWtFWFb3xGOWphBzYx0dQGN3Y3Ei1O8U3/qP4rZXQ51I
         jI6ff1ekKlSwbPelhvXUeyaXf+ACEvsVyaJRvTPA7W3h1rN2GQd8U3fg873c3Rqovm5o
         stLaN+YxUZLLoupDWt5Vgg4zzsFamQwpaoy8vDQBdn7ukSXVURIclN2tWBQZ/N6ro1Kb
         7iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763315409; x=1763920209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QP7jspNMzyTvkGv06BWTHIjJjU1oOmLPoesgjcHxeRo=;
        b=sf1iq0MYZwpPe49EVxOXCfzErQ3xmFlbbE8G4ma64v8VxMNqYWNSSleOeonYGuG57I
         WbaoRLSsBYDC75oioRHGmhoPRl6hE+Qmut1vjTAhA9cb+Lu6Gt7vCmpgwzvgpYI91EEZ
         bYlVw5AwczxhNPS+GmnD8X/WqUoQbKk6MkahEooyHjuPJj7vqpj8A+1urgdnFb6uPo3U
         8DnVMENqyduiaNyPDyFw1gBdrxGRL6WJiYZlZa1N3jG8wCBmY9k2M6xh3syvno8aBDK+
         B+P9X8JuzQmPYOQYvMc2BAe3LJJEIFCjVOhkiPa9ntbSH+el4kXQsV3QYUSTPdQ2V5Mj
         MuAg==
X-Forwarded-Encrypted: i=1; AJvYcCX2L2+5JQXDZMYjNAYXITu3Kv571Pgta6G1Anl+jdpgdpotwtBSFjEAN43vOroHLsO88C95XBI6s1Tx4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZlRcuLdlFkRnRRkrQ5zWl2uTWr721B7k3umKa55d4XeMdViKi
	iuMuKrNPoRCPYyV0hiuG3pbHstu9MYCJIN3rP+Z1L5c/oMd8nL14fseIb+u9kQ==
X-Gm-Gg: ASbGncvbPMDsmIqHVwva/BFFpDr061oRbB6ihG2lysfACLkgug82mTCMAO7TvT0Ndq4
	+VrGqphGDKK0L6riRFJ4IN/a2mZwYgFf3pjfN5hqxMz0Jj6FnnfWcoSXFy56t4oMvwj/w1JPkA5
	cMnJ4DE1y8hfa6BFdEAdbejiimTOUr7EGuVKWjP5IcIW3eyJvxb4CNK/ayDrqGFOPHq7hWf8tTS
	lzOdNeI99pJc7o16Pdm6ewGnKfQT9nHa4/4j/HxqOZM2kHzlJLMeDbU0cVKWLqU29fcFTl2vgM7
	zYa04Enes1P78j+eYnvoZYNTDajfVy8KFu/FoGM+fMw2US0+29DV5cttmmb9J8npR8qw6tmhAsY
	n1xAiMPhHvjMWowhuZZh0orwOoOCyBN/LOwixelUvp0bx2tFz+VpQ4U75JwkYV/PbHm5Tp78lBL
	Us2NUDY2wEn6bumN3/HFVjBDndT0qBKnAAKFpPjNq2wrNj3nGq69+ZX8OZbpWjb8pbC14QdwuAV
	00RtQ==
X-Google-Smtp-Source: AGHT+IHnJ3o0lU2xLaeiHwgSeukdwtR1KGCz5g9vsnkLKv/heK41BVWAROvmPtIvPoJ/A4s01hmsSQ==
X-Received: by 2002:a17:907:1b1d:b0:b3c:3c8e:189d with SMTP id a640c23a62f3a-b7367b8dd38mr1112936266b.32.1763315408563;
        Sun, 16 Nov 2025 09:50:08 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed9e9fsm879409766b.69.2025.11.16.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:50:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
 Maxime Ripard <mripard@kernel.org>, kernel@pengutronix.de,
 linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Thomas =?UTF-8?B?TcO8aGxiYWNoZXI=?= <tmuehlbacher@posteo.net>
Subject:
 Re: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq loop
 handling
Date: Sun, 16 Nov 2025 18:46:51 +0100
Message-ID: <5938604.DvuYhMxLoT@jernej-laptop>
In-Reply-To:
 <20251116-mysterious-delightful-spaniel-18d220-mkl@pengutronix.de>
References:
 <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
 <2804881.mvXUDI8C0e@jernej-laptop>
 <20251116-mysterious-delightful-spaniel-18d220-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne nedelja, 16. november 2025 ob 17:26:07 Srednjeevropski standardni =C4=
=8Das je Marc Kleine-Budde napisal(a):
> On 16.11.2025 17:20:37, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 16. november 2025 ob 16:55:26 Srednjeevropski standardni =
=C4=8Das je Marc Kleine-Budde napisal(a):
> > > Reading the interrupt register `SUN4I_REG_INT_ADDR` causes all of its=
 bits
> > > to be reset. If we ever reach the condition of handling more than
> > > `SUN4I_CAN_MAX_IRQ` IRQs, we will have read the register and reset al=
l its
> > > bits but without actually handling the interrupt inside of the loop b=
ody.
> > >
> > > This may, among other issues, cause us to never `netif_wake_queue()` =
again
> > > after a transmission interrupt.
> > >
> > > Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support -=
 Kernel module")
> > > Cc: stable@vger.kernel.org
> > > Co-developed-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> > > Signed-off-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> > > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > > ---
> > > I've ported the fix from the sja1000 driver to the sun4i_can, which b=
ased
> > > on the sja1000 driver.
> >
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Thank you very much! I have seen a lot of feedback from you about the
> sun4i driver. Would you like to become the maintainer of the driver?

As a Allwinner (sunxi) maintainer, it is somehow implied that I help with
reviewing such drivers, right?

However, while I never used sun4i_can driver, I know CAN protocol well
as I work with SJA1000 compatible controllers at work, so I can help with
maintaining it.

Best regards,
Jernej


