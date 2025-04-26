Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E682628D
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689501; cv=none; b=aK9OyaEmkTuou55v6UTpzifZuFWmYw+DgxNgPrBvs+vpxtw6LM97GAAkIaZyhodDnGImF8pbr7w/CH/kY/zkv1WljCRRsR+mCB9w9WtLt0SDZ1PKcQy2eOmmUv70CD3gxcgDhHUdf6LD9CJhsj+qyPdnteSFH40f56Dcjt/dTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689501; c=relaxed/simple;
	bh=FtaSYDDsLlb9XQiT+NauP2FYW/AAY4bmrejfSOBWq2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2vdeYIbEnJdDqJ7a/1OWgRnS897I/eGaDaAT9wNTkpfT92+hMmMRKHciwxq5xzKyyP1U51VqGDKkNzhKQHKSU+UcLKEzemYt0CGHlbbIYzqaVTEbXZizdAVqNU/NjZdSc9dXFcF6R20VqLrU5HKU6aB6JBpAmB0dXpo583UuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAMgwhfs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAMgwhfs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso5574148a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745689498; x=1746294298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbxITtHAcGXMiREQydyGZcJ4eVVA2TjDN/sMT0c7kME=;
        b=JAMgwhfseT9e9SlBlaN801E2jxALe7/uwMf5qV4FDsvLaFyt6VQiehShwxWB6ZZu8i
         HHf6GNMOfQ+r1fySTmQ4YMFHmoaqQgp1/jTf111vMqAx+wJ2o5mSC/+xdNRvRpirKfqu
         rZY2okTq8wPrvKpO3bjOQHQEwK3wQvXnNmlmsGxAkUEQkfyUjqUFQqxnQmggGTV8AHGS
         dJv15ztoLzd7ajdk9rO8+8TiM7dEapCZHPMMpwHZuoX4m7av8XxwbNBBCzG9L8V7vW6T
         Uy2kK2vN35qX2pm9gEU95D0BPF7j7AExcPcq0hIbvyHTORYe0iyt2zwg18wtGzrQY0uU
         tqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745689498; x=1746294298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbxITtHAcGXMiREQydyGZcJ4eVVA2TjDN/sMT0c7kME=;
        b=EXQFfCPEVeMGWQSI8dsQ5pMv+ILpmSnLpYnz4dGEADJiP0e8W1H1OGPp8b972SoHZL
         gpIkBnMnffPzQngz6vfwpJsTLrPWVmpcZEOnWpOFywRljMQQ73s8EqJLMo2MqMd8YnWE
         tkZEZ54NTny0fm+V+2IIp2YysQBlngIZYMnuXSA7hKTF9lMpYqQHD6SMDP5PsQVvwUi2
         jSdr2je1yLMzlxtpJu0U/x+7zItpaYG70mJ869QAx78I0TEuRNpryl5i/jELU5dk0pga
         ybtMksW0+4QMkven94L7lQJXDTVF0FwpvAJEvfwj0DrRAM+ZTdIUaQKPEFoBVB4bB+Uy
         9xQA==
X-Forwarded-Encrypted: i=1; AJvYcCU12pgMVWfDvqXfYu98KT+ylHnYvF62H407x9PBewNJmOQKpZtSlSIZLcMbSSIyLBxAvAL3vX7QONPDeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9y11Hf4OkYBCNRnjyhwvNOOcDp0K8gOz6AwbKNszBaLQga6is
	bpkvKacZNuMPAsRiEfIbR5LqBlkIi9nbhNljMb+A+ZoBrRHWhi3P
X-Gm-Gg: ASbGncvIFI1jw8cfM1fF0iSFPXoIPfaNqqDA50JFY8jJ4aPN+MIuCXxJ7I1mBSxnPM0
	FuOm7QaGnxt2h5eQTHVyzS9ACK823mGVHiTuGo0xuHvD39qMI2KlvYcqiGPRjvOB5mIxaz6fbvX
	TddtJnbq0//ttGKJoD+2ZJtI/I1sFtlUvwk7Ihz3/LYrYw5gmczfD7CXnHizWCE2nHityPS5Bhg
	SuZpJS5U/h0bRyvo2LKaqNnrW/IEd1HiPk5Tacg7DSU2eSsRzuWcnIHgdQT4DpnP/g4GsRCFMya
	p1vBx5Lg2mAqwAjzuPMiZeFtdMYSPr0AATjUB/lQJgE4r+2CUwZnp87F38aVtA==
X-Google-Smtp-Source: AGHT+IEYoP+s6tFCFsfMdNf9KlXDsfO+MPR416gnEOqDraQJNtj/S0B9IjLspGmK/DThc8WDCo1SSA==
X-Received: by 2002:a05:6402:3513:b0:5ed:994c:7e75 with SMTP id 4fb4d7f45d1cf-5f72352cedamr4762738a12.24.1745689497686;
        Sat, 26 Apr 2025 10:44:57 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354638bsm2915649a12.63.2025.04.26.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 10:44:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: enable MMU_PGPROT proper page table protection
Date: Sat, 26 Apr 2025 19:44:55 +0200
Message-ID: <5003571.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250426120913.23314-1-andre.przywara@arm.com>
References: <20250426120913.23314-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 26. april 2025 ob 14:09:13 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> Select the new MMU_PGPROT Kconfig symbol for all Allwinner board builds,
> to use a write-protected .rodata, non-executable .data and .rodata
> sections, and non-writable .text sections.
>=20
> This might trigger runtime exceptions in misbehaving drivers, which
> should then be fixed.
> Please report on the list or on IRC if bisecting ends at this patch.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Hi,
>=20
> I am planning on merging this ASAP, to get some exposure and use the time
> until the release for wider testing. If worst comes to the worst, we can
> revert it still before July.
>=20
> Cheers,
> Andre
>=20
>  arch/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 99750072e55..f22d347d5ad 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1192,6 +1192,7 @@ config ARCH_SUNXI
>  	select DM_KEYBOARD
>  	select DM_SERIAL
>  	select DM_PMIC
> +	select MMU_PGPROT if ARM64
>  	select OF_BOARD_SETUP
>  	select OF_CONTROL
>  	select PINCTRL
>=20




