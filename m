Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795160611;
	b=AIndVrxuZs1D64T0w6QbKX8Y40WnH1fMLxLiDCDTsSnxbe86kENvIay7nFOFey/ClK2z
	 4+9pyetXphlctn7fFkbC/ejvHM4amy0OSpM9J0Nyj5YoFhJPTN0DgsNwR9n+V9dFZu5bl
	 /cjAIwlm6N7nwP86hmBm0q8om2pIfsuTFn6PUjgDf3yL4bb1ws73kANTXRxSjvBcsr0J8
	 sbx1i4cHtpcyJ2pCKl+3GDpa5QrNv5h1WEtpjYQU0puyYs103rOA43/zQ//GwVd5I/oQI
	 6xsLesYKvu8g2ccbGHXIc7mBMj74d7hz2Y7Gi2UB5hf9fLsaI2IqzWcod3zx54RESkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rH8FLeRD6lQe4Eo0A2CHWhT7lgzRVzXkup8Vbmb/vUw=;
	b=0Ksrus7fwLUEjqaZS0Z6w6AcVaek42YNb60I1NSD+XS8tHogx94qjZlB054uIL+cEgrX
	 +VaciRGsCgrnACak/jYwqAzTcxLTNlYpWq4xdgjhcxkoJYNy4VeM4Q7t0zOnpjDrjrRXh
	 xuoHlWMqy3jrJRPhZVwX492tgeXI7+RcXfqqiiPGcRu2nVcOxTOEdbIRzISG5XZv/hvY9
	 9lHTPftJd3n6vASIEtMJJ8Gz8h+d3/EQRfusl55zmRAC9sL7kYoq79eJXXEhmnv6l82d+
	 JuuHH1qnhn9rugSVHdqMy52T7kI9TY17zOREzowBEnVC67yKFwWYyFb+/g70QEbJwbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7NM7LZq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06288606A320
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06288606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7NM7LZq
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b10d24345dso5732627b3.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 23:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795160610; cv=none;
        d=google.com; s=arc-20260327;
        b=cpcbCBVBG0QoiS7gREDCYCu5c8GN/Y4pN5EHAWTTCCIbNO9BTv9RkfZVyKo0S7403b
         xepPqmS2LNBPkNIukB2/7qzS/CXCryqfqQemM3/1HKHHp0hlbFLtG8WEKwRPZ+RSJkQS
         PhFP7bFczQKQ/Ba853bX/smZOOMMwqYiDNTZmQ4WvdAt+7n6OGFQbVVhO8PpbclJ1U+N
         iGOArtwErok2alnSDuopxblo+kLoz4W/6JGGiEgJjWPIWehdL15EZTIWKAVoctdMJBsU
         zC4GPPRTQ7EbhZJA/FCA1yVVYPtA0mWaBrGAUYC3aUrE5OnDEXEfCS/yJj2CcsCY9y9t
         HCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rH8FLeRD6lQe4Eo0A2CHWhT7lgzRVzXkup8Vbmb/vUw=;
        fh=PC+fhR8RerGPmXFXqBag1G0Zw6PmULpUs3ZSZy/IUyQ=;
        b=Ym71E4hNleCP85lUueg7Aninwuc7hkkgiHdWcU2XBXCmP9ZlT888nYa0I1/Z08Oyd5
         bfHk93RelFc//UNZzTBHurvjHuuTmm0LHnM76SQj3eZ5TaFUGD9bp3/seyYxoap+AV5n
         +W1J6DLIvOPoA+6SWe5vgxtBlcd4x3qTHOTOSFpxCoQz+JEupJ3XHQaMCXJo6osR/MX+
         N+wvQD4xkOvmiyvgemcjVyIPCl1zgWOz4rR7PdR3Dd5IQ7tba34aFnE8sTHtsgklHom2
         xmJnPkw2AFvuGCAApFnotX5laRokrRC95zTVM6tnoSaGJg2pf1a1VdqV7+ETTOR/g28s
         ZFIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160610; x=1795765410; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH8FLeRD6lQe4Eo0A2CHWhT7lgzRVzXkup8Vbmb/vUw=;
        b=U7NM7LZq51hA9KpuRUU1dVZmphgH0w2CMW1HmUGvu8egs7KvQnaviPfwQwlfe/LnHQ
         JVxnMkwJ0RVypB3RTPrphA4ElTBhdp8B8AGwtZzfOuplsx/WXJMzRkblcWRKZNUyaN1W
         TqA2NshytzYWmssuozwOwKPERI5XfmI1fKygCU7StYKkbUFlshj91uAdcet36Q+SEztr
         RPtfimh4b0IkCEoi2DjYsj/LQV0zLNTuG1DPYW8kb5gNXemFInEHTlm9x5W0ZV4phjfi
         b7vUKHDljDC8a1ofxpeq1t2RhhVxu2N+VepkLZMFIpBWQ5w1VrWszjFg6S+39wUYrMRk
         gVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160610; x=1795765410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rH8FLeRD6lQe4Eo0A2CHWhT7lgzRVzXkup8Vbmb/vUw=;
        b=wWPNzXM+DnWrPghnPQKSfRMXo1r5jncJHd+knJfXUQ5wC9oaBDfUwHFkeU0Hwk3kGk
         HUR5Yc74TkTMW7X4BWZcU8BafJMorM8BJmn3Kj3w8wofrjktrKx2uOnhDjd4GPsCxGk/
         PUtOPCxlzqj9CDaqb1ShgUC2TYMS/lOi6mcstu5iAM5H0Ia6w3IrsssFFPl9flyeOqxo
         kbAcsOlkqc5r++WqwdWsc5u0BLvdU6Ec2+lsl8gLp5QyBt0lJLNBuH7+LKaKRbyd2/aM
         udBox9I5P5gdZvhX3qDsMU7MoYeGBYv8WXuf4GurEsW1s7SOKtnjbYWq3VO7ckKMZ72d
         sRtA==
X-Forwarded-Encrypted: i=1; AL+hErGtAGBj0gAMiWgPx5dU/6XLDYG26vcYXl3FEPKNvR4k8JJuouFl0b6aL3mI5hLs8pucQfOG8L1MWne2+g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8OVN7DYUoamf3j+LnUmkmI+kEB4FIHl4NOVd9FLqC6O6c1HbTB
	05REdn54hzqDlVDCNxU16gCndZ1ABdyhPp8zo/bXE52JEBGQw+/0QyAhrWIXiEkZQ4tCVyvKUpR
	GG8WHhWYOV4cW6NlLqI2F/4kieL0LaA==
X-Gm-Gg: AZFdTZdavp+zS+XQ5YYzd3boTyCTWDu/uGAp1xo6V+xcz7KXf2V1f/Tu5fSOXMt2NHw
	ebYnIDHFazqMS1NWdwb7MDqgniPNEIJyyX5PwFPGDRwZBaEvZZPiDLWQCZu2M2Zb/luexY6sxKY
	7Yn7ARJUy4GpzJ3yYc0zsTvKt70WWSkH/RF9iqzOSRi4QtuexvFXjO3Khv+WH9mKx6R/T/rcgWp
	n3E1Ly03W2QkBmMduoFuY5VB+0VHUs67dwV/XoFXjy73N5JS/pDlO+VPPF0l+q2NXzynGl5yzl/
	32f+YIMczQUqTqqP8M+NReggFDUm6M7+8nv99ifWhcWSPajjRsA/xArv2h61rXmAJ7r3p/BR02A
	sVOdw+HT4LmQq18+WktWC1yHqx83rPV9suPwAwpx+76GRMXbQoSH1d06v9O6eR9arp2qrzWR/Fg
	H7u0LEbMNK9WseuRU=
X-Received: by 2002:a05:690c:9689:b0:8a1:781f:4aa0 with SMTP id
 00721157ae682-8b52050a2c3mr14429817b3.56.1795160610043; Thu, 19 Nov 2026
 23:43:30 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
 <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com> <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
 <CANxy8yTA7Nqmggk=qn7tCnXn50vS2ceHdZYZC0_OancmZhnKcg@mail.gmail.com> <435b0f23-134f-4d52-8a08-7cde51f7de38@arm.com>
In-Reply-To: <435b0f23-134f-4d52-8a08-7cde51f7de38@arm.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Fri, 20 Nov 2026 01:43:18 -0600
X-Gm-Features: AclHuK-qrl0bbospTyZue3hkY-pyeBA6t4fydawjGyuckZVn9r8TVszlP_ozfhA
Message-ID: <CANxy8yTmhLAztuzTQMhhoFr72oLNe=wADp9TKfJP03BPUGd-Sw@mail.gmail.com>
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP table
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

> Just a heads up: if you send a first version in two weeks, it will most
> likely miss the v7.4 merge window, which would be a shame.
> If you could consider sending something earlier, even if it's not
> perfect, we could start the review already, and maybe can then meet the
> deadline for the next release.

Thanks for the heads-up, I have sent it now:
https://lore.kernel.org/all/20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com/

> For the regulator assignment, try to look at a running BSP kernel,
> checking /sys/kernel/debug/regulator/regulator_summary, if available.
> Or look at the vendor DT if you find any hints on the regulator
> assignment. If nothing hits, it's probably save to see if the other A133
> DTs agree on a specific regulator, and copy that.
> Also it might be possible to turn a specific regulator off, to see if
> the component still works, to get some confirmation.

Thanks, that helped. I did not get a regulator_summary from the BSP
kernel, but the other checks agree: KickPi publishes the V1.3
schematic, and the rails in the DT follow it; I compared them node by
node with the vendor DT; the pin bank supplies are the same as on the
HelperBoard. With the DT, the kernel switches off every rail it does not
use, the PMIC registers show that only the rails in use stay on, and
eMMC, SD, USB, RTC and cpufreq keep working, also in a 3 hour soak.

Thanks,
Rajan
