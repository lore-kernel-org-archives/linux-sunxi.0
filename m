Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B02EC567
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Sep 2025 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980644; cv=none; b=pf5nBMck2JjCVTngm7POS8XOghgZ+7+3UONcHmvYeKAwO64+z98S6VqiOfJx+fOd2vK9sU2JgX5+oPG82uZ1JmbdiNBLfFF2TzENqwJJXVi0yYMNN9t3VvmixsDI5+I0X7UwBJWz9kuEzysvrHJ7lmpIUXtrLPDOe5jD9ydlLm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980644; c=relaxed/simple;
	bh=WYAkuhBUkyGeNAMuzRFafeVQCBzyUp43MM/5ay7OtGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sr9VE7rgODQfJOBGsnNjnH45FHIQjloNPsPOR5fM3zU4GE38zKbvvFBRaSJN2a1sP2issmr7y4bLLlIQWjWgaIj+mgxPUuHKS22nr/oGciURotSVUNFCcAZBn/U8tqfUlfyeAtkqU/VFhBxZrvHshPgl30sQVPxzDJuzxNiXcjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZL0lYnU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZL0lYnU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323266d6f57so962173a91.0
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Sep 2025 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756980642; x=1757585442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mzz9fRqkvT5uX5MoAuPEzgbckQvhFxni4jRgfGvmtgU=;
        b=IZL0lYnUr/Rmcamx6qmDYcPQX4KEMCS+vD7q3SttSfw3mUH9ugibkNJ6+14ycPlfiA
         B7QDPnun9CuvxBrggYrR239xKH8gjQjwQ8jIl7I1Ubj/fs32Riu3Vsen0ZMACHD4RJuV
         B4bQrUPQehTMlSwoQglNhXASCSiBZ7SGH2w2mQAQRMpSTec4TiAjh5Pk9LKCErwNfLJ1
         HYS3zzpaWEO11BsLUmn9BwvWLNz2JMPxeoplACuCgzCUUJ0eYzbX/+mfhxgh6Jk1llgf
         KNn4uJ7suTjD82UVka0ibi4+OkkG4S7Zvs+v7UZxCzEAu4LKDs7F2J2WViPXznsqEUN+
         4TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756980642; x=1757585442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mzz9fRqkvT5uX5MoAuPEzgbckQvhFxni4jRgfGvmtgU=;
        b=vWpQLVuBI2JxKYDsKzo2vELVqEbjwpG3FOSWnsuOoStZEoGw60BVqj2N9X0or31lv4
         qweEMpIF16uhc+b/V5Z2as2lUhRNUsBGvRcVXs2tAK9qIJPudIqCcJu7jivzz1VV//2R
         KI1SZFF5/AdNwESfTMFksxbFn08xYsM4Btb5NqrhdMqzG+NLizMEaO/MMgPanEDmhRBh
         j5xKqBStbUFm8BE5Tf7mThZKG61vVmIW/ybZ0HvPw0zXYfWhmM3/72VDa4JXpy7P5cy9
         0CzEzux+82ZpdnGLvnaeIpa2C4HN+DMndqLQlWgsyDL8P3Dzye5yNEtGdIhG8204dgyG
         TyTg==
X-Forwarded-Encrypted: i=1; AJvYcCUTJBz19Yy4tid0IpphIfwoorWFtDSSIKtPBDHWoGFy/Hlz887vvIoRnDBJj5WIHDrMJScnSBM0dcW6aA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO2FD9/gFyLZikYuKdEPI1ncRenNJubPWtgRFNZSYFv6ooRdrD
	0pM35VkkkM/fZxjyQwLeEtusnWm8bKZLAcbiA/ZaFIjJKc0oKuOm5jCgW44lqhXGT4D9UORbmVJ
	axW2x+UYg2JKD0dDxH7U0URQ9sE67RIg=
X-Gm-Gg: ASbGnctz5VeiEwu4Kf37lwrEY2dg3XzNFMw7SuO1LeWDFf8MSsrSjOlyFLCLL/Iwaf6
	L7+drmvy1CBJ0wwM5Q7w6nfOiqal+8MEQ3H0EZSP9m/mRcdP5hpuMpos7OM2UeuU/sYNzlfS54N
	TkrntbNDUN3J0SXbc/7k1+V0P3VI4Ua0mYxl3APRuNnqFKM3QUxrUmDMNUJvBQv1Yu9M9N9tjFU
	xG/w69EmEiO+mv6
X-Google-Smtp-Source: AGHT+IEcr6S5zr86X7JbbP5sYJWvgrw9FGbOqdwNbxj9i0AU+TbarxyEOKi8uBCwkBmAEckqzOKfKywVq1s6p5aN8Pk=
X-Received: by 2002:a17:90b:2252:b0:327:edde:609e with SMTP id
 98e67ed59e1d1-3281543caffmr28305888a91.12.1756980641893; Thu, 04 Sep 2025
 03:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250904002924.2bc63b73@minigeek.lan>
In-Reply-To: <20250904002924.2bc63b73@minigeek.lan>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 4 Sep 2025 12:10:30 +0200
X-Gm-Features: Ac12FXy-UNDQKQzOziQWMNs3hr0MwNpnD0zv9eFEeEfrnSbWD3LfsO0NbySuusI
Message-ID: <CAH9NwWepSZnBP7tot9it_bDEbSC14PrMePz+fBtHfHz4ikLDYA@mail.gmail.com>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
	linux-sunxi <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

>
> the Allwinner A523/A527/T527 family of SoCs feature a Vivante
> "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
> See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, the
> row labelled "NPU" indicates which model has the IP. We suspect it's
> all the same die, with the NPU selectively fused off on some packages.
>
> Board vendors seem to use multiple SKUs of the SoC on the same board,
> so it's hard to say which particular board has the NPU or not. We
> figured that on unsupported SoCs all the NPU registers read as 0,
> though, so were wondering if that could be considered as a bail-out
> check for the driver?
> At the moment I get this, on a SoC with a disabled NPU:
> [    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)
> [    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0
> [    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
> [    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
> [    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0x0000000=
0
>
> Chen-Yu got this on his board featuring the NPU:
>     etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003
>
> If I get the code correctly, then etnaviv_gpu_init() correctly detects
> the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
> etnaviv_drv.c then somewhat ignores this, since it keeps looking for more
> GPUs, and fails to notice that *none* showed up:
> /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.
>

Looks fine to me - no wrong behavior.

> Quick questions:
> - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
>   registers) an invalid ID, so we can use that to detect those disabled
>   NPUs? If not, can any other register used to check this? The whole
>   block seems to be RAZ/WI when the NPU is disabled.
>
> - Would it be acceptable to change the logic to error out of the
>   driver's init or probe routine when no GPU/NPU has been found, at
>   best with a proper error message? As it stands at the moment, the
>   driver is loaded, but of course nothing is usable, so it keeps
>   confusing users.
>

From an application standpoint, it=E2=80=99s not confusing since there is n=
o etnaviv
device to interact with. The user might wonder about the kernel messages,
but that=E2=80=99s actually caused by an incorrect device tree. If the SoC =
doesn=E2=80=99t
have an NPU, it shouldn=E2=80=99t be enabled in the DTS.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
