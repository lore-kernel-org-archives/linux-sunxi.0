Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7B18EB0
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 00:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779755066; cv=pass; b=rlS4UUhri1hWET8DmMYCD3p5ZOQ1nXTbti4n3jCET6IEbKOw9TNy8hx0ODwlKJqLxnVrNZlrZwdzqMkpttSwIIGrbceSi7sX7dcVcIP1NRGue+IAuBm0i4ZTqv4IxvnCc0QqScojBwP7Pvn8sZu0UfoO87X7BaqsmdRVAgNJ11Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779755066; c=relaxed/simple;
	bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/vtquyrHMmQHagH12EW/1JqBJfGr2CSY+paolp97kRnInZ1GadKPc7sgephcNMSUwUtrshC0BIiKyYZv0kea3BoKGt7ZSS9amXBJ1n1rfqsTOjI148Pggo8IaOG0DyjrZQkor72PfjNUvshePCUPa0zOOgwRCTxFFsLktvtP1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNsqj9pC; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNsqj9pC"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so9859087e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 25 May 2026 17:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779755063; cv=none;
        d=google.com; s=arc-20240605;
        b=ib7pcl6WXONZsLNtRzB/8j7lpeY0N1Rhz8idsv6uo3ddThVtOGs5zvsLg2P+nZ9dvj
         qOEVBxj6RfRvc2vug4CM7otsJFJi44KsKs8CDdEPPrNA/QdaUdie0EWsNbjn/ilPjX9+
         fOO6l7zcqIZmtzyfiqH/38YD+G3q+BOiu6tTmOE038oVm81Kf2xkOhV5tXZo6Hty0dyo
         WXqTGdoXNdvo4Hnrxi/fuhfDvLDV+P6dma3IjmR+cHmZKeMk7S2IxjZYx8qHCd/6QeA7
         T6pM6RcayUXvwdvnmazRImzoeWohBdOJaoAEsrtNLhsJWSo5xm2wYh7d12afx2B9zlUK
         Nu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
        fh=efDqHD2RssSwBuuQZ7q4wkbyN9U1dTC2JZKFQAOSGOo=;
        b=cDAKSWiZrwqHzhTjVzx6M3MHsZxawU+tk5a2QRyf+Pr8aP6YjRljqzpef/0qcKSJXg
         t3kA1yDbUWHpI29EJx2BPNhZF6teeTmofe5qULUFiPtGcrrhBjC0n13AvV1rD+EazFmB
         7ZhlCEHDoTHBCm+xqg1uoS1OsRT8r4Sq4IeQAhrWzFyQSA3Izo/U9HLt18m668LXj6rd
         t2LYHbPY4T8DRzAsPOmdZ6tM7UdECYphPU47YEyd5mYpPLAg+Ick4BUawJ3mhWjWaOXb
         bfWsCGH/OiP5g+m4UV7NDjJd41lt2h3ZcZ2gCVIs/JSJIeVRXWiM4/zjV2gC5oUtVa/T
         JH5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779755063; x=1780359863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
        b=tNsqj9pCdivCu/bZjylKc4TEjujJHbWhyYBrO1mPB6YCJ+IWB83000IuWbt5zRJXQN
         6CtWtG38shdzDoM9EYEV2bj7+XOufZJOetXCmO6Z4Qw4EVypXizMCCnXhIVHZavYZSaf
         y/BvT+OiYluUMW9pMpVguOZkcRj9gBjfLroEZCZAhtm7Rj6YGWLu0DqVXPu6v9pn6Tk/
         NndsuFDO9yah4DuobiUkjgUt7cnHNiop2/5shbrL0Nz24oAkOvYGh7jWu0Sy4JSswYHM
         iBSO36HWO9LCS86heCrUfi08Sg0pLMf/2ZOfLCRI7QOLfnkWGAWmQ8pzGG5tNh6xka3R
         Nx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779755063; x=1780359863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
        b=k0MCddQruy9YHFo1fLh+s/d96rFHtV5c68h0TYl21/cXCc45ChtpIew5aTIF8PBP1L
         0LJzkX/nY72a5NWoutwJNOERKxlMOAvrIauXiOBRNtN4/mqaDXvW40PF/sZX/COPpa69
         GWm7hjpn1xMMw2vN/UeZ1C63Re+MRIDSy5eePoWUaf90VCe0jepONQQTe5vPR4l7Cowo
         ijm15ceXvumI+yIMrCSAwdDZdIS4LI1amEyMQXZmJiC8WlBiM42EKkT5OT/b9LaWg2HU
         lfLH/8HQrricU+QVYvfXqGtNBtaZ3j7wobgE6ifoMmod21wkRbVkbAYZAGw8MApCcSXU
         T3Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/kMNsvyYG6XxXCq5mbwylaSEqRKfOO23/oi7LHFPcfjezSs32eWU9RxTW2aGWgjm1tdl087Kv+GP3/PQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKaa6P/IQFe9a+9XzJa5dRK7Uc5gm7TPH9qv4xXHbZzQskm2ym
	rTazInLHxCtssyQcF2AcfMhMeY9Iwt8SdVfQECwYynH+NfxvDam2DCJKim8JNXJjsVqwNWd0kbH
	I95H7MR9chLNa7UYlYRsXAJN5n6jsQ7U=
X-Gm-Gg: Acq92OHNRJzYDq+ujOwXek5E8BU80czvfb6Gj8rOjBek7OEgkyQUkpgTJ2PUYnw1lL3
	81Jy0ugQ1B9VSff3jitW1UQmrjTUXAC/sUove1EQq17ayVdFbJEkKLYFmJSeeon+Eu1+GIoqA8n
	33W8tyXA2OnXcYoMCy4uBrhslcuPo5M0qb4jJRZsbAXTAfmYkWt/AlMERzU7CfJpBEh2XjxuoBp
	XbS3GJ/AWwTwvrhwnPB96RChoSgthWpjxcmLCgooVSoGq0rIhaH+zLbY9RFB3kNtdBHcQuJMZxv
	cI3aTNPQuYLmBUetaAkMTHLHdBhm94UORzv8kJE0EoSBuX3tSjJTK4raVQftAwG7mj0kUHTj
X-Received: by 2002:a05:6512:1599:b0:5a7:4699:9fd8 with SMTP id
 2adb3069b0e04-5aa2ba85b09mr7355408e87.16.1779755062403; Mon, 25 May 2026
 17:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5AHK2FF1_wws3wQsJs5ofvjn2JpQmk3of+p1+ExL8h+ew@mail.gmail.com>
In-Reply-To: <CAOMZO5AHK2FF1_wws3wQsJs5ofvjn2JpQmk3of+p1+ExL8h+ew@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 May 2026 21:24:10 -0300
X-Gm-Features: AVHnY4JS4uosGBNNT0O2e2-uAlaBFEkB6tUSmGGzp3aw6DXRUG7IRPZ2XdoJxuA
Message-ID: <CAOMZO5AX8z-S6x7agjAs9qvyVL=Je9GBwtLc8Jhg=s=baerfgA@mail.gmail.com>
Subject: Re: sunxi: Watchdog reboot fails on Allwinner R40 after Linux boot
To: Guenter Roeck <linux@roeck-us.net>, wens@kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-watchdog@vger.kernel.org, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 9:41=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi,
>
> I am seeing a reboot failure on an Allwinner R40-based board
> (Boardcon EMA40i) running mainline Linux v6.18 or also 7.1.0-rc4-next-202=
60522.
> This board hasn't been upstreamed yet, but I plan to do so soon.
>
> The board reboots correctly from U-Boot 2026.04 using the sunxi watchdog,
> but Linux fails to reboot even when programming the watchdog
> registers with the exact same values used by U-Boot.

This is solved now. The problem was that the X32KIN R40 pin was not
getting a 32kHz
from the external PCF8563 CLKOUT pin.
